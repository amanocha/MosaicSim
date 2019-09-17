/* $Id: main.c,v 1.1 2008/03/04 17:30:03 stratton Exp $ */

/*############################################################################*/

#include "DECADES/DECADES.h"
#include "main.h"
#include "lbm.h"
#include <stdio.h>
#include <stdlib.h>

#if defined(SPEC_CPU)
#   include <time.h>
#else
#   include <sys/times.h>
#   include <unistd.h>
#endif

#include <sys/stat.h>

/*############################################################################*/

static LBM_GridPtr srcGrid, dstGrid;

/*############################################################################*/

struct pb_TimerSet timers;

void _kernel_(MAIN_Param param, int tid, int num_threads) {
  int t;
  for(t = 1 + tid; t <= param.nTimeSteps; t+= num_threads) {
    if( param.simType == CHANNEL ) {
      LBM_handleInOutFlow( *srcGrid );
    }

    LBM_performStreamCollide( *srcGrid, *dstGrid );
    LBM_swapGrids( &srcGrid, &dstGrid );

    //printf( "timestep: %i\n", t );
    //LBM_showGridStatistics( *srcGrid );
  }
}

int main( int nArgs, char* arg[] ) {
	MAIN_Param param;
#if !defined(SPEC_CPU)
	MAIN_Time time;
#endif
        pb_InitializeTimerSet(&timers);
        pb_SwitchToTimer(&timers, pb_TimerID_COMPUTE);
        struct pb_Parameters* params;
        params = pb_ReadParameters(&nArgs, arg);

	MAIN_parseCommandLine( nArgs, arg, &param, params );
	MAIN_printInfo( &param );
	MAIN_initialize( &param );
#if !defined(SPEC_CPU)
	MAIN_startClock( &time );
#endif

        _kernel_(param, 0, 1);

#if !defined(SPEC_CPU)
	MAIN_stopClock( &time, &param );
#endif

	MAIN_finalize( &param );

        pb_SwitchToTimer(&timers, pb_TimerID_NONE);
        pb_PrintTimerSet(&timers);
        pb_FreeParameters(params);
	return 0;
}

/*############################################################################*/

void MAIN_parseCommandLine( int nArgs, char* arg[], MAIN_Param* param, struct pb_Parameters * params) {
	struct stat fileStat;
	
	if( nArgs < 2 ) {
                param->nTimeSteps     = 1;
		//printf( "syntax: lbm <time steps>\n" );
		//exit( 1 );
	} else {
	        param->nTimeSteps     = atoi( arg[1] );
        }

	if( params->inpFiles[0] != NULL ) {
		param->obstacleFilename = params->inpFiles[0];

		if( stat( param->obstacleFilename, &fileStat ) != 0 ) {
			printf( "MAIN_parseCommandLine: cannot stat obstacle file '%s'\n",
			         param->obstacleFilename );
			exit( 1 );
		}
		if( fileStat.st_size != SIZE_X*SIZE_Y*SIZE_Z+(SIZE_Y+1)*SIZE_Z ) {
			printf( "MAIN_parseCommandLine:\n"
			        "\tsize of file '%s' is %i bytes\n"
					    "\texpected size is %i bytes\n",
			        param->obstacleFilename, (int) fileStat.st_size,
			        SIZE_X*SIZE_Y*SIZE_Z+(SIZE_Y+1)*SIZE_Z );
			exit( 1 );
		}
	}
	else param->obstacleFilename = NULL;

	param->resultFilename = params->outFile;
	param->action         = STORE;
	param->simType        = LDC;
}

/*############################################################################*/

void MAIN_printInfo( const MAIN_Param* param ) {
	const char actionString[3][32] = {"nothing", "compare", "store"};
	const char simTypeString[3][32] = {"lid-driven cavity", "channel flow"};
	printf( "MAIN_printInfo:\n"
	        "\tgrid size      : %i x %i x %i = %.2f * 10^6 Cells\n"
	        "\tnTimeSteps     : %i\n"
	        "\tresult file    : %s\n"
	        "\taction         : %s\n"
	        "\tsimulation type: %s\n"
	        "\tobstacle file  : %s\n\n",
	        SIZE_X, SIZE_Y, SIZE_Z, 1e-6*SIZE_X*SIZE_Y*SIZE_Z,
	        param->nTimeSteps, param->resultFilename, 
	        actionString[param->action], simTypeString[param->simType],
	        (param->obstacleFilename == NULL) ? "<none>" :
	                                            param->obstacleFilename );
}

/*############################################################################*/

void MAIN_initialize( const MAIN_Param* param ) {
	LBM_allocateGrid( (float**) &srcGrid );
	LBM_allocateGrid( (float**) &dstGrid );

	LBM_initializeGrid( *srcGrid );
	LBM_initializeGrid( *dstGrid );

	if( param->obstacleFilename != NULL ) {
		LBM_loadObstacleFile( *srcGrid, param->obstacleFilename );
		LBM_loadObstacleFile( *dstGrid, param->obstacleFilename );
	}

	if( param->simType == CHANNEL ) {
		LBM_initializeSpecialCellsForChannel( *srcGrid );
		LBM_initializeSpecialCellsForChannel( *dstGrid );
	}
	else {
		LBM_initializeSpecialCellsForLDC( *srcGrid );
		LBM_initializeSpecialCellsForLDC( *dstGrid );
	}

	LBM_showGridStatistics( *srcGrid );
}

/*############################################################################*/

void MAIN_finalize( const MAIN_Param* param ) {
	LBM_showGridStatistics( *srcGrid );

	if( param->action == COMPARE )
		LBM_compareVelocityField( *srcGrid, param->resultFilename, TRUE );
	if( param->action == STORE )
	LBM_storeVelocityField( *srcGrid, param->resultFilename, TRUE );

	LBM_freeGrid( (float**) &srcGrid );
	LBM_freeGrid( (float**) &dstGrid );
}

#if !defined(SPEC_CPU)
/*############################################################################*/

void MAIN_startClock( MAIN_Time* time ) {
	time->timeScale = 1.0 / sysconf( _SC_CLK_TCK );
	time->tickStart = times( &(time->timeStart) );
}


/*############################################################################*/

void MAIN_stopClock( MAIN_Time* time, const MAIN_Param* param ) {
	time->tickStop = times( &(time->timeStop) );

	printf( "MAIN_stopClock:\n"
	        "\tusr: %7.2f sys: %7.2f tot: %7.2f wct: %7.2f MLUPS: %5.2f\n\n",
	        (time->timeStop.tms_utime - time->timeStart.tms_utime) * time->timeScale,
	        (time->timeStop.tms_stime - time->timeStart.tms_stime) * time->timeScale,
	        (time->timeStop.tms_utime - time->timeStart.tms_utime +
	         time->timeStop.tms_stime - time->timeStart.tms_stime) * time->timeScale,
	        (time->tickStop           - time->tickStart          ) * time->timeScale,
	        1.0e-6 * SIZE_X * SIZE_Y * SIZE_Z * param->nTimeSteps /
	        (time->tickStop           - time->tickStart          ) / time->timeScale );
}
#endif
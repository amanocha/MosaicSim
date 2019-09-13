; ModuleID = 'decades_base/main_visited.cpp'
source_filename = "decades_base/main_visited.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.LatticeDim_t = type { i32, i32, i32, %struct.Vec3_t, float }
%struct.Vec3_t = type { float, float, float }
%struct.Lattice_t = type { %struct.LatticeDim_t, float* }
%struct.pb_TimerSet = type { i32, %struct.pb_async_time_marker_list*, i64, i64, [8 x %struct.pb_Timer], [8 x %struct.pb_SubTimerList*] }
%struct.pb_async_time_marker_list = type { i8*, i32, i8*, %struct.pb_async_time_marker_list* }
%struct.pb_Timer = type { i32, i64, i64 }
%struct.pb_SubTimerList = type { %struct.pb_SubTimer*, %struct.pb_SubTimer* }
%struct.pb_SubTimer = type { i8*, %struct.pb_Timer, %struct.pb_SubTimer* }
%struct.pb_Parameters = type { i8*, i8** }
%struct.Atoms_t = type { %struct.Atom_t*, i32 }
%struct.Atom_t = type { float, float, float, float }

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.1 = private unnamed_addr constant [30 x i8] c"error appending to file %s..\0A\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"%d  %.3f\0A\00", align 1
@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.3 = private unnamed_addr constant [15 x i8] c"Out of memory\0A\00", align 1
@.str.4 = private unnamed_addr constant [26 x i8] c"Expecting one input file\0A\00", align 1
@.str.5 = private unnamed_addr constant [25 x i8] c"read_atom_file() failed\0A\00", align 1
@.str.6 = private unnamed_addr constant [30 x i8] c"read %d atoms from file '%s'\0A\00", align 1
@.str.8 = private unnamed_addr constant [20 x i8] c"  minimum %g %g %g\0A\00", align 1
@.str.9 = private unnamed_addr constant [20 x i8] c"  maximum %g %g %g\0A\00", align 1
@.str.10 = private unnamed_addr constant [32 x i8] c"padding domain by %g Angstroms\0A\00", align 1
@.str.11 = private unnamed_addr constant [35 x i8] c"domain lengths are %g by %g by %g\0A\00", align 1
@.str.13 = private unnamed_addr constant [20 x i8] c"Computation failed\0A\00", align 1
@.str.14 = private unnamed_addr constant [44 x i8] c"remove_exclusions() failed for cpu lattice\0A\00", align 1
@str = private unnamed_addr constant [21 x i8] c"extent of domain is:\00", align 1

; Function Attrs: nounwind uwtable
define dso_local i32 @_Z10appenddataPKcid(i8* %filename, i32 %size, double %time) local_unnamed_addr #0 {
entry:
  %call = tail call %struct._IO_FILE* @fopen(i8* %filename, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0))
  %cmp = icmp eq %struct._IO_FILE* %call, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.1, i64 0, i64 0), i8* %filename)
  br label %cleanup

if.end:                                           ; preds = %entry
  %call2 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* nonnull %call, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i64 0, i64 0), i32 %size, double %time)
  %call3 = tail call i32 @fclose(%struct._IO_FILE* nonnull %call)
  br label %cleanup

cleanup:                                          ; preds = %if.end, %if.then
  %retval.0 = phi i32 [ -1, %if.then ], [ 0, %if.end ]
  ret i32 %retval.0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind
declare dso_local noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #2

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare dso_local i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare dso_local i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable writeonly
define dso_local void @lattice_from_bounding_box(%struct.LatticeDim_t* noalias nocapture sret %agg.result, <2 x float> %lo.coerce0, float %lo.coerce1, <2 x float> %hi.coerce0, float %hi.coerce1, float %h) local_unnamed_addr #3 {
entry:
  %hi.sroa.0.0.vec.extract = extractelement <2 x float> %hi.coerce0, i32 0
  %lo.sroa.0.0.vec.extract = extractelement <2 x float> %lo.coerce0, i32 0
  %sub = fsub float %hi.sroa.0.0.vec.extract, %lo.sroa.0.0.vec.extract
  %div = fdiv float %sub, %h
  %0 = tail call float @llvm.floor.f32(float %div)
  %conv = fptosi float %0 to i32
  %add = add nsw i32 %conv, 1
  %nx = getelementptr inbounds %struct.LatticeDim_t, %struct.LatticeDim_t* %agg.result, i64 0, i32 0
  store i32 %add, i32* %nx, align 4, !tbaa !2
  %hi.sroa.0.4.vec.extract = extractelement <2 x float> %hi.coerce0, i32 1
  %lo.sroa.0.4.vec.extract = extractelement <2 x float> %lo.coerce0, i32 1
  %sub4 = fsub float %hi.sroa.0.4.vec.extract, %lo.sroa.0.4.vec.extract
  %div5 = fdiv float %sub4, %h
  %1 = tail call float @llvm.floor.f32(float %div5)
  %conv6 = fptosi float %1 to i32
  %add7 = add nsw i32 %conv6, 1
  %ny = getelementptr inbounds %struct.LatticeDim_t, %struct.LatticeDim_t* %agg.result, i64 0, i32 1
  store i32 %add7, i32* %ny, align 4, !tbaa !9
  %sub9 = fsub float %hi.coerce1, %lo.coerce1
  %div10 = fdiv float %sub9, %h
  %2 = tail call float @llvm.floor.f32(float %div10)
  %conv11 = fptosi float %2 to i32
  %add12 = add nsw i32 %conv11, 1
  %nz = getelementptr inbounds %struct.LatticeDim_t, %struct.LatticeDim_t* %agg.result, i64 0, i32 2
  store i32 %add12, i32* %nz, align 4, !tbaa !10
  %lo.sroa.0.0..sroa_idx = getelementptr inbounds %struct.LatticeDim_t, %struct.LatticeDim_t* %agg.result, i64 0, i32 3
  %lo.sroa.0.0..sroa_cast = bitcast %struct.Vec3_t* %lo.sroa.0.0..sroa_idx to <2 x float>*
  store <2 x float> %lo.coerce0, <2 x float>* %lo.sroa.0.0..sroa_cast, align 4
  %lo.sroa.4.0..sroa_idx20 = getelementptr inbounds %struct.LatticeDim_t, %struct.LatticeDim_t* %agg.result, i64 0, i32 3, i32 2
  store float %lo.coerce1, float* %lo.sroa.4.0..sroa_idx20, align 4
  %h14 = getelementptr inbounds %struct.LatticeDim_t, %struct.LatticeDim_t* %agg.result, i64 0, i32 4
  store float %h, float* %h14, align 4, !tbaa !11
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #1

; Function Attrs: nounwind readnone speculatable
declare float @llvm.floor.f32(float) #4

; Function Attrs: nounwind uwtable
define dso_local noalias %struct.Lattice_t* @create_lattice(%struct.LatticeDim_t* byval nocapture readonly align 8 %dim) local_unnamed_addr #0 {
entry:
  %call = tail call noalias i8* @malloc(i64 40) #8
  %0 = bitcast i8* %call to %struct.Lattice_t*
  %cmp = icmp eq i8* %call, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !12
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0), i64 14, i64 1, %struct._IO_FILE* %1) #9
  tail call void @exit(i32 1) #10
  unreachable

if.end:                                           ; preds = %entry
  %3 = bitcast %struct.LatticeDim_t* %dim to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 %call, i8* nonnull align 8 %3, i64 28, i1 false), !tbaa.struct !14
  %nx = getelementptr inbounds %struct.LatticeDim_t, %struct.LatticeDim_t* %dim, i64 0, i32 0
  %4 = load i32, i32* %nx, align 8, !tbaa !2
  %ny = getelementptr inbounds %struct.LatticeDim_t, %struct.LatticeDim_t* %dim, i64 0, i32 1
  %5 = load i32, i32* %ny, align 4, !tbaa !9
  %mul = mul nsw i32 %5, %4
  %nz = getelementptr inbounds %struct.LatticeDim_t, %struct.LatticeDim_t* %dim, i64 0, i32 2
  %6 = load i32, i32* %nz, align 8, !tbaa !10
  %mul3 = mul nsw i32 %mul, %6
  %add = add nsw i32 %mul3, 7
  %and = and i32 %add, -8
  %conv = sext i32 %and to i64
  %call4 = tail call noalias i8* @calloc(i64 %conv, i64 4) #8
  %lattice = getelementptr inbounds i8, i8* %call, i64 32
  %7 = bitcast i8* %lattice to i8**
  store i8* %call4, i8** %7, align 8, !tbaa !17
  %cmp6 = icmp eq i8* %call4, null
  br i1 %cmp6, label %if.then7, label %if.end9

if.then7:                                         ; preds = %if.end
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !12
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0), i64 14, i64 1, %struct._IO_FILE* %8) #9
  tail call void @exit(i32 1) #10
  unreachable

if.end9:                                          ; preds = %if.end
  ret %struct.Lattice_t* %0
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) local_unnamed_addr #5

; Function Attrs: nounwind
declare dso_local noalias i8* @calloc(i64, i64) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define dso_local void @destroy_lattice(%struct.Lattice_t* %lat) local_unnamed_addr #0 {
entry:
  %tobool = icmp eq %struct.Lattice_t* %lat, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %lattice = getelementptr inbounds %struct.Lattice_t, %struct.Lattice_t* %lat, i64 0, i32 1
  %0 = bitcast float** %lattice to i8**
  %1 = load i8*, i8** %0, align 8, !tbaa !17
  tail call void @free(i8* %1) #8
  %2 = bitcast %struct.Lattice_t* %lat to i8*
  tail call void @free(i8* %2) #8
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  ret void
}

; Function Attrs: nounwind
declare dso_local void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: norecurse uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #6 {
entry:
  %argc.addr = alloca i32, align 4
  %min_ext = alloca %struct.Vec3_t, align 4
  %max_ext = alloca %struct.Vec3_t, align 4
  %timers = alloca %struct.pb_TimerSet, align 8
  store i32 %argc, i32* %argc.addr, align 4, !tbaa !15
  %0 = bitcast %struct.Vec3_t* %min_ext to i8*
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %0) #8
  %1 = bitcast %struct.Vec3_t* %max_ext to i8*
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %1) #8
  %2 = bitcast %struct.pb_TimerSet* %timers to i8*
  call void @llvm.lifetime.start.p0i8(i64 288, i8* nonnull %2) #8
  %call = call %struct.pb_Parameters* @pb_ReadParameters(i32* nonnull %argc.addr, i8** %argv)
  %cmp = icmp eq %struct.pb_Parameters* %call, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @exit(i32 1) #10
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call i32 @pb_Parameters_CountInputs(%struct.pb_Parameters* nonnull %call)
  %cmp2 = icmp eq i32 %call1, 1
  br i1 %cmp2, label %if.end5, label %if.then3

if.then3:                                         ; preds = %if.end
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !12
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.4, i64 0, i64 0), i64 25, i64 1, %struct._IO_FILE* %3) #9
  call void @exit(i32 1) #10
  unreachable

if.end5:                                          ; preds = %if.end
  call void @pb_InitializeTimerSet(%struct.pb_TimerSet* nonnull %timers)
  call void @pb_SwitchToTimer(%struct.pb_TimerSet* nonnull %timers, i32 1)
  %inpFiles = getelementptr inbounds %struct.pb_Parameters, %struct.pb_Parameters* %call, i64 0, i32 1
  %5 = load i8**, i8*** %inpFiles, align 8, !tbaa !19
  %6 = load i8*, i8** %5, align 8, !tbaa !12
  %call6 = call %struct.Atoms_t* @read_atom_file(i8* %6)
  %tobool = icmp eq %struct.Atoms_t* %call6, null
  br i1 %tobool, label %if.then7, label %if.end9

if.then7:                                         ; preds = %if.end5
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !12
  %8 = call i64 @fwrite(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.5, i64 0, i64 0), i64 24, i64 1, %struct._IO_FILE* %7) #9
  call void @exit(i32 1) #10
  unreachable

if.end9:                                          ; preds = %if.end5
  %size = getelementptr inbounds %struct.Atoms_t, %struct.Atoms_t* %call6, i64 0, i32 1
  %9 = load i32, i32* %size, align 8, !tbaa !21
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.6, i64 0, i64 0), i32 %9, i8* %6)
  call void @pb_SwitchToTimer(%struct.pb_TimerSet* nonnull %timers, i32 6)
  call void @get_atom_extent(%struct.Vec3_t* nonnull %min_ext, %struct.Vec3_t* nonnull %max_ext, %struct.Atoms_t* nonnull %call6)
  %puts = call i32 @puts(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str, i64 0, i64 0))
  %x = getelementptr inbounds %struct.Vec3_t, %struct.Vec3_t* %min_ext, i64 0, i32 0
  %10 = load float, float* %x, align 4, !tbaa !23
  %conv = fpext float %10 to double
  %y = getelementptr inbounds %struct.Vec3_t, %struct.Vec3_t* %min_ext, i64 0, i32 1
  %11 = load float, float* %y, align 4, !tbaa !24
  %conv12 = fpext float %11 to double
  %z = getelementptr inbounds %struct.Vec3_t, %struct.Vec3_t* %min_ext, i64 0, i32 2
  %12 = load float, float* %z, align 4, !tbaa !25
  %conv13 = fpext float %12 to double
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i64 0, i64 0), double %conv, double %conv12, double %conv13)
  %x15 = getelementptr inbounds %struct.Vec3_t, %struct.Vec3_t* %max_ext, i64 0, i32 0
  %13 = load float, float* %x15, align 4, !tbaa !23
  %conv16 = fpext float %13 to double
  %y17 = getelementptr inbounds %struct.Vec3_t, %struct.Vec3_t* %max_ext, i64 0, i32 1
  %14 = load float, float* %y17, align 4, !tbaa !24
  %conv18 = fpext float %14 to double
  %z19 = getelementptr inbounds %struct.Vec3_t, %struct.Vec3_t* %max_ext, i64 0, i32 2
  %15 = load float, float* %z19, align 4, !tbaa !25
  %conv20 = fpext float %15 to double
  %call21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.9, i64 0, i64 0), double %conv16, double %conv18, double %conv20)
  %call23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.10, i64 0, i64 0), double 5.000000e-01)
  %16 = load float, float* %x, align 4, !tbaa !23
  %sub = fadd float %16, -5.000000e-01
  %17 = load float, float* %y, align 4, !tbaa !24
  %sub28 = fadd float %17, -5.000000e-01
  %18 = load float, float* %z, align 4, !tbaa !25
  %sub31 = fadd float %18, -5.000000e-01
  %19 = load float, float* %x15, align 4, !tbaa !23
  %add = fadd float %19, 5.000000e-01
  %20 = load float, float* %y17, align 4, !tbaa !24
  %add37 = fadd float %20, 5.000000e-01
  %21 = load float, float* %z19, align 4, !tbaa !25
  %add40 = fadd float %21, 5.000000e-01
  %sub43 = fsub float %add, %sub
  %conv44 = fpext float %sub43 to double
  %sub47 = fsub float %add37, %sub28
  %conv48 = fpext float %sub47 to double
  %sub51 = fsub float %add40, %sub31
  %conv52 = fpext float %sub51 to double
  %call53 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.11, i64 0, i64 0), double %conv44, double %conv48, double %conv52)
  %div.i = fmul float %sub43, 2.000000e+00
  %22 = call float @llvm.floor.f32(float %div.i) #8
  %conv.i = fptosi float %22 to i32
  %add.i = add nsw i32 %conv.i, 1
  %div5.i = fmul float %sub47, 2.000000e+00
  %23 = call float @llvm.floor.f32(float %div5.i) #8
  %conv6.i = fptosi float %23 to i32
  %add7.i = add nsw i32 %conv6.i, 1
  %div10.i = fmul float %sub51, 2.000000e+00
  %24 = call float @llvm.floor.f32(float %div10.i) #8
  %conv11.i = fptosi float %24 to i32
  %add12.i = add nsw i32 %conv11.i, 1
  %call.i = call noalias i8* @malloc(i64 40) #8
  %25 = bitcast i8* %call.i to %struct.Lattice_t*
  %cmp.i = icmp eq i8* %call.i, null
  br i1 %cmp.i, label %if.then.i127, label %if.end.i

if.then.i127:                                     ; preds = %if.end9
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !12
  %27 = call i64 @fwrite(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0), i64 14, i64 1, %struct._IO_FILE* %26) #11
  call void @exit(i32 1) #10
  unreachable

if.end.i:                                         ; preds = %if.end9
  %lo.sroa.0.0.vec.insert = insertelement <2 x float> undef, float %sub, i32 0
  %lo.sroa.0.4.vec.insert = insertelement <2 x float> %lo.sroa.0.0.vec.insert, float %sub28, i32 1
  %agg.tmp56126.sroa.0.0.call.i.sroa_cast = bitcast i8* %call.i to i32*
  store i32 %add.i, i32* %agg.tmp56126.sroa.0.0.call.i.sroa_cast, align 8
  %agg.tmp56126.sroa.5.0.call.i.sroa_idx = getelementptr inbounds i8, i8* %call.i, i64 4
  %agg.tmp56126.sroa.5.0.call.i.sroa_cast = bitcast i8* %agg.tmp56126.sroa.5.0.call.i.sroa_idx to i32*
  store i32 %add7.i, i32* %agg.tmp56126.sroa.5.0.call.i.sroa_cast, align 4
  %agg.tmp56126.sroa.7.0.call.i.sroa_idx = getelementptr inbounds i8, i8* %call.i, i64 8
  %agg.tmp56126.sroa.7.0.call.i.sroa_cast = bitcast i8* %agg.tmp56126.sroa.7.0.call.i.sroa_idx to i32*
  store i32 %add12.i, i32* %agg.tmp56126.sroa.7.0.call.i.sroa_cast, align 8
  %agg.tmp56126.sroa.9.0.call.i.sroa_idx = getelementptr inbounds i8, i8* %call.i, i64 12
  %agg.tmp56126.sroa.9.0.call.i.sroa_cast = bitcast i8* %agg.tmp56126.sroa.9.0.call.i.sroa_idx to <2 x float>*
  store <2 x float> %lo.sroa.0.4.vec.insert, <2 x float>* %agg.tmp56126.sroa.9.0.call.i.sroa_cast, align 4
  %agg.tmp56126.sroa.10.0.call.i.sroa_idx = getelementptr inbounds i8, i8* %call.i, i64 20
  %agg.tmp56126.sroa.10.0.call.i.sroa_cast = bitcast i8* %agg.tmp56126.sroa.10.0.call.i.sroa_idx to float*
  store float %sub31, float* %agg.tmp56126.sroa.10.0.call.i.sroa_cast, align 4
  %agg.tmp56126.sroa.11.0.call.i.sroa_idx = getelementptr inbounds i8, i8* %call.i, i64 24
  %agg.tmp56126.sroa.11.0.call.i.sroa_cast = bitcast i8* %agg.tmp56126.sroa.11.0.call.i.sroa_idx to float*
  store float 5.000000e-01, float* %agg.tmp56126.sroa.11.0.call.i.sroa_cast, align 8
  %mul.i = mul nsw i32 %add7.i, %add.i
  %mul3.i = mul nsw i32 %mul.i, %add12.i
  %add.i131 = add nsw i32 %mul3.i, 7
  %and.i = and i32 %add.i131, -8
  %conv.i132 = sext i32 %and.i to i64
  %call4.i = call noalias i8* @calloc(i64 %conv.i132, i64 4) #8
  %lattice.i133 = getelementptr inbounds i8, i8* %call.i, i64 32
  %28 = bitcast i8* %lattice.i133 to i8**
  store i8* %call4.i, i8** %28, align 8, !tbaa !17
  %cmp6.i = icmp eq i8* %call4.i, null
  br i1 %cmp6.i, label %if.then7.i, label %create_lattice.exit

if.then7.i:                                       ; preds = %if.end.i
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !12
  %30 = call i64 @fwrite(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0), i64 14, i64 1, %struct._IO_FILE* %29) #11
  call void @exit(i32 1) #10
  unreachable

create_lattice.exit:                              ; preds = %if.end.i
  %putchar = call i32 @putchar(i32 10)
  %call59 = call i32 @cpu_compute_cutoff_potential_lattice(%struct.Lattice_t* nonnull %25, float 1.200000e+01, %struct.Atoms_t* nonnull %call6)
  %tobool60 = icmp eq i32 %call59, 0
  br i1 %tobool60, label %if.end63, label %if.then61

if.then61:                                        ; preds = %create_lattice.exit
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !12
  %32 = call i64 @fwrite(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.13, i64 0, i64 0), i64 19, i64 1, %struct._IO_FILE* %31) #9
  call void @exit(i32 1) #10
  unreachable

if.end63:                                         ; preds = %create_lattice.exit
  %call64 = call i32 @remove_exclusions(%struct.Lattice_t* nonnull %25, float 1.000000e+00, %struct.Atoms_t* nonnull %call6)
  %tobool65 = icmp eq i32 %call64, 0
  br i1 %tobool65, label %if.end68, label %if.then66

if.then66:                                        ; preds = %if.end63
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !12
  %34 = call i64 @fwrite(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.14, i64 0, i64 0), i64 43, i64 1, %struct._IO_FILE* %33) #9
  call void @exit(i32 1) #10
  unreachable

if.end68:                                         ; preds = %if.end63
  call void @pb_SwitchToTimer(%struct.pb_TimerSet* nonnull %timers, i32 1)
  %outFile = getelementptr inbounds %struct.pb_Parameters, %struct.pb_Parameters* %call, i64 0, i32 0
  %35 = load i8*, i8** %outFile, align 8, !tbaa !26
  %tobool69 = icmp eq i8* %35, null
  br i1 %tobool69, label %destroy_lattice.exit, label %if.then70

if.then70:                                        ; preds = %if.end68
  call void @write_lattice_summary(i8* nonnull %35, %struct.Lattice_t* nonnull %25)
  br label %destroy_lattice.exit

destroy_lattice.exit:                             ; preds = %if.end68, %if.then70
  call void @pb_SwitchToTimer(%struct.pb_TimerSet* nonnull %timers, i32 6)
  %36 = load i8*, i8** %28, align 8, !tbaa !17
  call void @free(i8* %36) #8
  call void @free(i8* nonnull %call.i) #8
  call void @free_atom(%struct.Atoms_t* nonnull %call6)
  call void @pb_SwitchToTimer(%struct.pb_TimerSet* nonnull %timers, i32 0)
  call void @pb_PrintTimerSet(%struct.pb_TimerSet* nonnull %timers)
  call void @pb_FreeParameters(%struct.pb_Parameters* nonnull %call)
  call void @llvm.lifetime.end.p0i8(i64 288, i8* nonnull %2) #8
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %1) #8
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %0) #8
  ret i32 0
}

declare dso_local %struct.pb_Parameters* @pb_ReadParameters(i32*, i8**) local_unnamed_addr #7

declare dso_local i32 @pb_Parameters_CountInputs(%struct.pb_Parameters*) local_unnamed_addr #7

declare dso_local void @pb_InitializeTimerSet(%struct.pb_TimerSet*) local_unnamed_addr #7

declare dso_local void @pb_SwitchToTimer(%struct.pb_TimerSet*, i32) local_unnamed_addr #7

declare dso_local %struct.Atoms_t* @read_atom_file(i8*) local_unnamed_addr #7

declare dso_local void @get_atom_extent(%struct.Vec3_t*, %struct.Vec3_t*, %struct.Atoms_t*) local_unnamed_addr #7

declare dso_local i32 @cpu_compute_cutoff_potential_lattice(%struct.Lattice_t*, float, %struct.Atoms_t*) local_unnamed_addr #7

declare dso_local i32 @remove_exclusions(%struct.Lattice_t*, float, %struct.Atoms_t*) local_unnamed_addr #7

declare dso_local void @write_lattice_summary(i8*, %struct.Lattice_t*) local_unnamed_addr #7

declare dso_local void @free_atom(%struct.Atoms_t*) local_unnamed_addr #7

declare dso_local void @pb_PrintTimerSet(%struct.pb_TimerSet*) local_unnamed_addr #7

declare dso_local void @pb_FreeParameters(%struct.pb_Parameters*) local_unnamed_addr #7

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #8

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #8

; Function Attrs: nounwind
declare i32 @putchar(i32) local_unnamed_addr #8

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="64" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone speculatable }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="64" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind }
attributes #9 = { cold }
attributes #10 = { noreturn nounwind }
attributes #11 = { cold nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (/home/ts20/share/llvm9/llvm-project/clang 3775794812e582769e2ed1b53c00650a6b21387c)"}
!2 = !{!3, !4, i64 0}
!3 = !{!"_ZTS12LatticeDim_t", !4, i64 0, !4, i64 4, !4, i64 8, !7, i64 12, !8, i64 24}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{!"_ZTS6Vec3_t", !8, i64 0, !8, i64 4, !8, i64 8}
!8 = !{!"float", !5, i64 0}
!9 = !{!3, !4, i64 4}
!10 = !{!3, !4, i64 8}
!11 = !{!3, !8, i64 24}
!12 = !{!13, !13, i64 0}
!13 = !{!"any pointer", !5, i64 0}
!14 = !{i64 0, i64 4, !15, i64 4, i64 4, !15, i64 8, i64 4, !15, i64 12, i64 4, !16, i64 16, i64 4, !16, i64 20, i64 4, !16, i64 24, i64 4, !16}
!15 = !{!4, !4, i64 0}
!16 = !{!8, !8, i64 0}
!17 = !{!18, !13, i64 32}
!18 = !{!"_ZTS9Lattice_t", !3, i64 0, !13, i64 32}
!19 = !{!20, !13, i64 8}
!20 = !{!"_ZTS13pb_Parameters", !13, i64 0, !13, i64 8}
!21 = !{!22, !4, i64 8}
!22 = !{!"_ZTS7Atoms_t", !13, i64 0, !4, i64 8}
!23 = !{!7, !8, i64 0}
!24 = !{!7, !8, i64 4}
!25 = !{!7, !8, i64 8}
!26 = !{!20, !13, i64 0}

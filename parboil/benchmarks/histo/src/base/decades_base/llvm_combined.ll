; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::basic_ofstream" = type { %"class.std::basic_ostream.base", %"class.std::basic_filebuf", %"class.std::basic_ios" }
%"class.std::basic_ostream.base" = type { i32 (...)** }
%"class.std::basic_filebuf" = type { %"class.std::basic_streambuf", %union.pthread_mutex_t, %"class.std::__basic_file", i32, %struct.__mbstate_t, %struct.__mbstate_t, %struct.__mbstate_t, i8*, i64, i8, i8, i8, i8, i8*, i8*, i8, %"class.std::codecvt"*, i8*, i64, i8*, i8* }
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%union.pthread_mutex_t = type { %"struct.(anonymous union)::__pthread_mutex_s" }
%"struct.(anonymous union)::__pthread_mutex_s" = type { i32, i32, i32, i32, i32, i16, i16, %struct.__pthread_internal_list }
%struct.__pthread_internal_list = type { %struct.__pthread_internal_list*, %struct.__pthread_internal_list* }
%"class.std::__basic_file" = type <{ %struct._IO_FILE*, i8, [7 x i8] }>
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.__mbstate_t = type { i32, %union.anon }
%union.anon = type { i32 }
%"class.std::codecvt" = type { %"class.std::__codecvt_abstract_base.base", %struct.__locale_struct* }
%"class.std::__codecvt_abstract_base.base" = type { %"class.std::locale::facet.base" }
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_put"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], %struct.__locale_struct*, i8, [7 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::ios_base::Init" = type { i8 }
%"class.std::basic_string" = type { %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider" }
%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider" = type { i8* }
%"class.std::basic_ostringstream" = type { %"class.std::basic_ostream.base", %"class.std::basic_stringbuf", %"class.std::basic_ios" }
%"class.std::basic_stringbuf" = type { %"class.std::basic_streambuf", i32, %"class.std::basic_string" }
%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep" = type { %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep_base" }
%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep_base" = type { i64, i64, i32 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.pb_Parameters = type { i8*, i8** }
%struct.pb_Timer = type { i32, i64, i64 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }
%struct.pb_TimerSet = type { i32, %struct.pb_async_time_marker_list*, i64, i64, [8 x %struct.pb_Timer], [8 x %struct.pb_SubTimerList*] }
%struct.pb_async_time_marker_list = type { i8*, i32, i8*, %struct.pb_async_time_marker_list* }
%struct.pb_SubTimerList = type { %struct.pb_SubTimer*, %struct.pb_SubTimer* }
%struct.pb_SubTimer = type { i8*, %struct.pb_Timer, %struct.pb_SubTimer* }

@f1 = dso_local global [1024 x %"class.std::basic_ofstream"] zeroinitializer, align 16
@f2 = dso_local global [1024 x %"class.std::basic_ofstream"] zeroinitializer, align 16
@f3 = dso_local global [1024 x %"class.std::basic_ofstream"] zeroinitializer, align 16
@expert_mode = dso_local local_unnamed_addr global i8 0, align 1
@remaining_mem_accesses = dso_local local_unnamed_addr global i64 130000000, align 8
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_tracer.cc, i8* null }]
@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@.str.18 = private unnamed_addr constant [14 x i8] c"PYTHIA_EXPERT\00", align 1
@_ZSt4cout = external dso_local global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [72 x i8] c"ERROR: Unable to log for all threads! Increase MAX_THREADS in tracer.cc\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"tracer.cc\00", align 1
@__PRETTY_FUNCTION__._Z12get_dir_nameSsSsSs = private unnamed_addr constant [64 x i8] c"const char *get_dir_name(std::string, std::string, std::string)\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"/output_\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@_ZNSs4_Rep20_S_empty_rep_storageE = external dso_local global [0 x i64], align 8
@_ZTTSt19basic_ostringstreamIcSt11char_traitsIcESaIcEE = external unnamed_addr constant [4 x i8*], align 8
@_ZTVSt15basic_stringbufIcSt11char_traitsIcESaIcEE = external dso_local unnamed_addr constant { [16 x i8*] }, align 8
@_ZTVSt15basic_streambufIcSt11char_traitsIcEE = external dso_local unnamed_addr constant { [16 x i8*] }, align 8
@.str.7 = private unnamed_addr constant [9 x i8] c"ctrl.txt\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"B,\00", align 1
@.str.9 = private unnamed_addr constant [2 x i8] c",\00", align 1
@.str.10 = private unnamed_addr constant [6 x i8] c"false\00", align 1
@__PRETTY_FUNCTION__.printuBranch = private unnamed_addr constant [50 x i8] c"void printuBranch(char *, char *, char *, char *)\00", align 1
@.str.11 = private unnamed_addr constant [3 x i8] c"U,\00", align 1
@.str.12 = private unnamed_addr constant [66 x i8] c"Memory trace exceeded max num of memory accesses. \0A Aborting... \0A\00", align 1
@__PRETTY_FUNCTION__.printMem = private unnamed_addr constant [60 x i8] c"void printMem(char *, char *, char *, bool, long long, int)\00", align 1
@.str.13 = private unnamed_addr constant [8 x i8] c"mem.txt\00", align 1
@.str.14 = private unnamed_addr constant [3 x i8] c"L,\00", align 1
@.str.15 = private unnamed_addr constant [3 x i8] c"S,\00", align 1
@.str.16 = private unnamed_addr constant [8 x i8] c"acc.txt\00", align 1
@.str.26 = private unnamed_addr constant [74 x i8] c"vector::_M_range_check: __n (which is %zu) >= this->size() (which is %zu)\00", align 1
@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.23 = private unnamed_addr constant [17 x i8] c"delete_argument\0A\00", align 1
@.str.24 = private unnamed_addr constant [15 x i8] c"next_argument\0A\00", align 1
@.str.1.1 = private unnamed_addr constant [32 x i8] c"Expecting file name after '-i'\0A\00", align 1
@.str.17 = private unnamed_addr constant [32 x i8] c"Expecting file name after '-o'\0A\00", align 1
@.str.2.18 = private unnamed_addr constant [35 x i8] c"Unexpected command-line parameter\0A\00", align 1
@.str.3.19 = private unnamed_addr constant [43 x i8] c"Ignoring attempt to start a running timer\0A\00", align 1
@.str.4.20 = private unnamed_addr constant [32 x i8] c"Warning: Timer was not stopped\0A\00", align 1
@.str.5.21 = private unnamed_addr constant [35 x i8] c"Warning: Subtimer was not stopped\0A\00", align 1
@.str.6.22 = private unnamed_addr constant [54 x i8] c"Ignoring attempt to start running timer and subtimer\0A\00", align 1
@.str.7.23 = private unnamed_addr constant [42 x i8] c"Ignoring attempt to stop a stopped timer\0A\00", align 1
@.str.8.24 = private unnamed_addr constant [32 x i8] c"Warning: Timer was not running\0A\00", align 1
@.str.9.25 = private unnamed_addr constant [35 x i8] c"Warning: Subtimer was not running\0A\00", align 1
@.str.10.26 = private unnamed_addr constant [53 x i8] c"Ignoring attempt to stop stopped timer and subtimer\0A\00", align 1
@.str.11.27 = private unnamed_addr constant [49 x i8] c"Elapsed time from a running timer is inaccurate\0A\00", align 1
@.str.13.28 = private unnamed_addr constant [3 x i8] c"IO\00", align 1
@.str.14.29 = private unnamed_addr constant [7 x i8] c"Kernel\00", align 1
@.str.15.30 = private unnamed_addr constant [5 x i8] c"Copy\00", align 1
@.str.16.31 = private unnamed_addr constant [7 x i8] c"Driver\00", align 1
@.str.17.32 = private unnamed_addr constant [11 x i8] c"Copy Async\00", align 1
@.str.18.33 = private unnamed_addr constant [8 x i8] c"Compute\00", align 1
@.str.19 = private unnamed_addr constant [10 x i8] c"%-*s: %f\0A\00", align 1
@.str.20 = private unnamed_addr constant [12 x i8] c" -%-*s: %f\0A\00", align 1
@.str.21 = private unnamed_addr constant [24 x i8] c"CPU/Kernel Overlap: %f\0A\00", align 1
@.str.22 = private unnamed_addr constant [21 x i8] c"Timer Wall Time: %f\0A\00", align 1
@str = private unnamed_addr constant [38 x i8] c"Base implementation of histogramming.\00", align 1
@str.10 = private unnamed_addr constant [47 x i8] c"Maintained by Nady Obeid <obeid1@ece.uiuc.edu>\00", align 1
@.str.2.1 = private unnamed_addr constant [21 x i8] c"Input file expected\0A\00", align 1
@.str.4.2 = private unnamed_addr constant [6 x i8] c"Input\00", align 1
@.str.5.3 = private unnamed_addr constant [7 x i8] c"Output\00", align 1
@.str.6.4 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.3.5 = private unnamed_addr constant [45 x i8] c"Expected at least one command line argument\0A\00", align 1
@.str.7.6 = private unnamed_addr constant [53 x i8] c"Error reading input and output dimensions from file\0A\00", align 1
@.str.8.7 = private unnamed_addr constant [37 x i8] c"Error reading input array from file\0A\00", align 1

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_tracer.cc() #0 section ".text.startup" personality i32 (...)* @__gxx_personality_v0 {
entry:
  tail call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull @_ZStL8__ioinit)
  %0 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #3
  %call.i = tail call i8* @getenv(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.18, i64 0, i64 0)) #3
  %cmp.i = icmp ne i8* %call.i, null
  %frombool.i = zext i1 %cmp.i to i8
  store i8 %frombool.i, i8* @expert_mode, align 1, !tbaa !2
  br label %arrayctor.loop.i

arrayctor.loop.i:                                 ; preds = %invoke.cont.i, %entry
  %arrayctor.cur.idx.i = phi i64 [ 0, %entry ], [ %arrayctor.cur.add.i, %invoke.cont.i ]
  %arrayctor.cur.ptr.i = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f1, i64 0, i64 %arrayctor.cur.idx.i
  invoke void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1Ev(%"class.std::basic_ofstream"* nonnull %arrayctor.cur.ptr.i)
          to label %invoke.cont.i unwind label %lpad.i

invoke.cont.i:                                    ; preds = %arrayctor.loop.i
  %arrayctor.cur.add.i = add nuw nsw i64 %arrayctor.cur.idx.i, 1
  %arrayctor.done.i = icmp eq i64 %arrayctor.cur.add.i, 1024
  br i1 %arrayctor.done.i, label %__cxx_global_var_init.19.exit, label %arrayctor.loop.i

lpad.i:                                           ; preds = %arrayctor.loop.i
  %1 = landingpad { i8*, i32 }
          cleanup
  %arraydestroy.isempty.i = icmp eq i64 %arrayctor.cur.idx.i, 0
  br i1 %arraydestroy.isempty.i, label %eh.resume.i, label %lpad.split.i

lpad.split.i:                                     ; preds = %lpad.i
  %arraydestroy.element3.i = getelementptr inbounds %"class.std::basic_ofstream", %"class.std::basic_ofstream"* %arrayctor.cur.ptr.i, i64 -1
  tail call void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ofstream"* nonnull %arraydestroy.element3.i) #3
  %arraydestroy.done7.i = icmp eq %"class.std::basic_ofstream"* %arraydestroy.element3.i, getelementptr inbounds ([1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f1, i64 0, i64 0)
  br i1 %arraydestroy.done7.i, label %eh.resume.i, label %arraydestroy.body.split.i

arraydestroy.body.split.i:                        ; preds = %arraydestroy.body.split.i, %lpad.split.i
  %2 = phi %"class.std::basic_ofstream"* [ %arraydestroy.element4.i, %arraydestroy.body.split.i ], [ %arraydestroy.element3.i, %lpad.split.i ]
  %arraydestroy.element4.i = getelementptr inbounds %"class.std::basic_ofstream", %"class.std::basic_ofstream"* %2, i64 -1
  tail call void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ofstream"* nonnull %arraydestroy.element4.i) #3
  %arraydestroy.done.i = icmp eq %"class.std::basic_ofstream"* %arraydestroy.element4.i, getelementptr inbounds ([1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f1, i64 0, i64 0)
  br i1 %arraydestroy.done.i, label %eh.resume.i, label %arraydestroy.body.split.i

eh.resume.i:                                      ; preds = %arraydestroy.body.split.i, %lpad.split.i, %lpad.i
  resume { i8*, i32 } %1

__cxx_global_var_init.19.exit:                    ; preds = %invoke.cont.i
  %3 = tail call i32 @__cxa_atexit(void (i8*)* nonnull @__cxx_global_array_dtor, i8* null, i8* nonnull @__dso_handle) #3
  br label %arrayctor.loop.i3

arrayctor.loop.i3:                                ; preds = %invoke.cont.i6, %__cxx_global_var_init.19.exit
  %arrayctor.cur.idx.i1 = phi i64 [ 0, %__cxx_global_var_init.19.exit ], [ %arrayctor.cur.add.i4, %invoke.cont.i6 ]
  %arrayctor.cur.ptr.i2 = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f2, i64 0, i64 %arrayctor.cur.idx.i1
  invoke void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1Ev(%"class.std::basic_ofstream"* nonnull %arrayctor.cur.ptr.i2)
          to label %invoke.cont.i6 unwind label %lpad.i8

invoke.cont.i6:                                   ; preds = %arrayctor.loop.i3
  %arrayctor.cur.add.i4 = add nuw nsw i64 %arrayctor.cur.idx.i1, 1
  %arrayctor.done.i5 = icmp eq i64 %arrayctor.cur.add.i4, 1024
  br i1 %arrayctor.done.i5, label %__cxx_global_var_init.20.exit, label %arrayctor.loop.i3

lpad.i8:                                          ; preds = %arrayctor.loop.i3
  %4 = landingpad { i8*, i32 }
          cleanup
  %arraydestroy.isempty.i7 = icmp eq i64 %arrayctor.cur.idx.i1, 0
  br i1 %arraydestroy.isempty.i7, label %eh.resume.i15, label %lpad.split.i11

lpad.split.i11:                                   ; preds = %lpad.i8
  %arraydestroy.element3.i9 = getelementptr inbounds %"class.std::basic_ofstream", %"class.std::basic_ofstream"* %arrayctor.cur.ptr.i2, i64 -1
  tail call void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ofstream"* nonnull %arraydestroy.element3.i9) #3
  %arraydestroy.done7.i10 = icmp eq %"class.std::basic_ofstream"* %arraydestroy.element3.i9, getelementptr inbounds ([1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f2, i64 0, i64 0)
  br i1 %arraydestroy.done7.i10, label %eh.resume.i15, label %arraydestroy.body.split.i14

arraydestroy.body.split.i14:                      ; preds = %arraydestroy.body.split.i14, %lpad.split.i11
  %5 = phi %"class.std::basic_ofstream"* [ %arraydestroy.element4.i12, %arraydestroy.body.split.i14 ], [ %arraydestroy.element3.i9, %lpad.split.i11 ]
  %arraydestroy.element4.i12 = getelementptr inbounds %"class.std::basic_ofstream", %"class.std::basic_ofstream"* %5, i64 -1
  tail call void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ofstream"* nonnull %arraydestroy.element4.i12) #3
  %arraydestroy.done.i13 = icmp eq %"class.std::basic_ofstream"* %arraydestroy.element4.i12, getelementptr inbounds ([1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f2, i64 0, i64 0)
  br i1 %arraydestroy.done.i13, label %eh.resume.i15, label %arraydestroy.body.split.i14

eh.resume.i15:                                    ; preds = %arraydestroy.body.split.i14, %lpad.split.i11, %lpad.i8
  resume { i8*, i32 } %4

__cxx_global_var_init.20.exit:                    ; preds = %invoke.cont.i6
  %6 = tail call i32 @__cxa_atexit(void (i8*)* nonnull @__cxx_global_array_dtor.21, i8* null, i8* nonnull @__dso_handle) #3
  br label %arrayctor.loop.i18

arrayctor.loop.i18:                               ; preds = %invoke.cont.i21, %__cxx_global_var_init.20.exit
  %arrayctor.cur.idx.i16 = phi i64 [ 0, %__cxx_global_var_init.20.exit ], [ %arrayctor.cur.add.i19, %invoke.cont.i21 ]
  %arrayctor.cur.ptr.i17 = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f3, i64 0, i64 %arrayctor.cur.idx.i16
  invoke void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1Ev(%"class.std::basic_ofstream"* nonnull %arrayctor.cur.ptr.i17)
          to label %invoke.cont.i21 unwind label %lpad.i23

invoke.cont.i21:                                  ; preds = %arrayctor.loop.i18
  %arrayctor.cur.add.i19 = add nuw nsw i64 %arrayctor.cur.idx.i16, 1
  %arrayctor.done.i20 = icmp eq i64 %arrayctor.cur.add.i19, 1024
  br i1 %arrayctor.done.i20, label %__cxx_global_var_init.22.exit, label %arrayctor.loop.i18

lpad.i23:                                         ; preds = %arrayctor.loop.i18
  %7 = landingpad { i8*, i32 }
          cleanup
  %arraydestroy.isempty.i22 = icmp eq i64 %arrayctor.cur.idx.i16, 0
  br i1 %arraydestroy.isempty.i22, label %eh.resume.i30, label %lpad.split.i26

lpad.split.i26:                                   ; preds = %lpad.i23
  %arraydestroy.element3.i24 = getelementptr inbounds %"class.std::basic_ofstream", %"class.std::basic_ofstream"* %arrayctor.cur.ptr.i17, i64 -1
  tail call void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ofstream"* nonnull %arraydestroy.element3.i24) #3
  %arraydestroy.done7.i25 = icmp eq %"class.std::basic_ofstream"* %arraydestroy.element3.i24, getelementptr inbounds ([1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f3, i64 0, i64 0)
  br i1 %arraydestroy.done7.i25, label %eh.resume.i30, label %arraydestroy.body.split.i29

arraydestroy.body.split.i29:                      ; preds = %arraydestroy.body.split.i29, %lpad.split.i26
  %8 = phi %"class.std::basic_ofstream"* [ %arraydestroy.element4.i27, %arraydestroy.body.split.i29 ], [ %arraydestroy.element3.i24, %lpad.split.i26 ]
  %arraydestroy.element4.i27 = getelementptr inbounds %"class.std::basic_ofstream", %"class.std::basic_ofstream"* %8, i64 -1
  tail call void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ofstream"* nonnull %arraydestroy.element4.i27) #3
  %arraydestroy.done.i28 = icmp eq %"class.std::basic_ofstream"* %arraydestroy.element4.i27, getelementptr inbounds ([1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f3, i64 0, i64 0)
  br i1 %arraydestroy.done.i28, label %eh.resume.i30, label %arraydestroy.body.split.i29

eh.resume.i30:                                    ; preds = %arraydestroy.body.split.i29, %lpad.split.i26, %lpad.i23
  resume { i8*, i32 } %7

__cxx_global_var_init.22.exit:                    ; preds = %invoke.cont.i21
  %9 = tail call i32 @__cxa_atexit(void (i8*)* nonnull @__cxx_global_array_dtor.23, i8* null, i8* nonnull @__dso_handle) #3
  ret void
}

declare dso_local i32 @__gxx_personality_v0(...)

declare dso_local void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

; Function Attrs: nounwind
declare dso_local void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #2

; Function Attrs: nounwind
declare dso_local i32 @__cxa_atexit(void (i8*)*, i8*, i8*) local_unnamed_addr #3

; Function Attrs: nounwind readonly
declare dso_local i8* @getenv(i8* nocapture) local_unnamed_addr #4

; Function Attrs: uwtable
declare dso_local void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1Ev(%"class.std::basic_ofstream"*) unnamed_addr #0 align 2

; Function Attrs: nounwind uwtable
declare dso_local void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ofstream"*) unnamed_addr #5 align 2

; Function Attrs: nounwind uwtable
define internal void @__cxx_global_array_dtor(i8* nocapture readnone) #5 section ".text.startup" {
entry:
  tail call void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ofstream"* getelementptr inbounds ([1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f1, i64 0, i64 1023)) #3
  br label %arraydestroy.body.split

arraydestroy.body.split:                          ; preds = %arraydestroy.body.split, %entry
  %1 = phi %"class.std::basic_ofstream"* [ getelementptr inbounds ([1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f1, i64 0, i64 1023), %entry ], [ %arraydestroy.element3, %arraydestroy.body.split ]
  %arraydestroy.element3 = getelementptr inbounds %"class.std::basic_ofstream", %"class.std::basic_ofstream"* %1, i64 -1
  tail call void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ofstream"* nonnull %arraydestroy.element3) #3
  %arraydestroy.done = icmp eq %"class.std::basic_ofstream"* %arraydestroy.element3, getelementptr inbounds ([1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f1, i64 0, i64 0)
  br i1 %arraydestroy.done, label %arraydestroy.done1, label %arraydestroy.body.split

arraydestroy.done1:                               ; preds = %arraydestroy.body.split
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @__cxx_global_array_dtor.21(i8* nocapture readnone) #5 section ".text.startup" {
entry:
  tail call void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ofstream"* getelementptr inbounds ([1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f2, i64 0, i64 1023)) #3
  br label %arraydestroy.body.split

arraydestroy.body.split:                          ; preds = %arraydestroy.body.split, %entry
  %1 = phi %"class.std::basic_ofstream"* [ getelementptr inbounds ([1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f2, i64 0, i64 1023), %entry ], [ %arraydestroy.element3, %arraydestroy.body.split ]
  %arraydestroy.element3 = getelementptr inbounds %"class.std::basic_ofstream", %"class.std::basic_ofstream"* %1, i64 -1
  tail call void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ofstream"* nonnull %arraydestroy.element3) #3
  %arraydestroy.done = icmp eq %"class.std::basic_ofstream"* %arraydestroy.element3, getelementptr inbounds ([1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f2, i64 0, i64 0)
  br i1 %arraydestroy.done, label %arraydestroy.done1, label %arraydestroy.body.split

arraydestroy.done1:                               ; preds = %arraydestroy.body.split
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @__cxx_global_array_dtor.23(i8* nocapture readnone) #5 section ".text.startup" {
entry:
  tail call void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ofstream"* getelementptr inbounds ([1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f3, i64 0, i64 1023)) #3
  br label %arraydestroy.body.split

arraydestroy.body.split:                          ; preds = %arraydestroy.body.split, %entry
  %1 = phi %"class.std::basic_ofstream"* [ getelementptr inbounds ([1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f3, i64 0, i64 1023), %entry ], [ %arraydestroy.element3, %arraydestroy.body.split ]
  %arraydestroy.element3 = getelementptr inbounds %"class.std::basic_ofstream", %"class.std::basic_ofstream"* %1, i64 -1
  tail call void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ofstream"* nonnull %arraydestroy.element3) #3
  %arraydestroy.done = icmp eq %"class.std::basic_ofstream"* %arraydestroy.element3, getelementptr inbounds ([1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f3, i64 0, i64 0)
  br i1 %arraydestroy.done, label %arraydestroy.done1, label %arraydestroy.body.split

arraydestroy.done1:                               ; preds = %arraydestroy.body.split
  ret void
}

; Function Attrs: noinline uwtable
define dso_local void @tracer_cleanup() #6 {
entry:
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.inc
  ret void

for.body:                                         ; preds = %for.inc, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc ]
  %arrayidx = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f1, i64 0, i64 %indvars.iv
  %_M_file.i.i = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f1, i64 0, i64 %indvars.iv, i32 1, i32 2
  %call.i.i = tail call zeroext i1 @_ZNKSt12__basic_fileIcE7is_openEv(%"class.std::__basic_file"* nonnull %_M_file.i.i) #17
  br i1 %call.i.i, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %_M_filebuf.i = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f1, i64 0, i64 %indvars.iv, i32 1
  %call.i = tail call %"class.std::basic_filebuf"* @_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv(%"class.std::basic_filebuf"* nonnull %_M_filebuf.i)
  %tobool.i = icmp eq %"class.std::basic_filebuf"* %call.i, null
  br i1 %tobool.i, label %if.then.i, label %if.end

if.then.i:                                        ; preds = %if.then
  %0 = bitcast %"class.std::basic_ofstream"* %arrayidx to i8**
  %vtable.i = load i8*, i8** %0, align 16, !tbaa !6
  %vbase.offset.ptr.i = getelementptr i8, i8* %vtable.i, i64 -24
  %1 = bitcast i8* %vbase.offset.ptr.i to i64*
  %vbase.offset.i = load i64, i64* %1, align 8
  %2 = bitcast %"class.std::basic_ofstream"* %arrayidx to i8*
  %add.ptr.i = getelementptr inbounds i8, i8* %2, i64 %vbase.offset.i
  %3 = bitcast i8* %add.ptr.i to %"class.std::basic_ios"*
  %_M_streambuf_state.i.i.i = getelementptr inbounds i8, i8* %add.ptr.i, i64 32
  %4 = bitcast i8* %_M_streambuf_state.i.i.i to i32*
  %5 = load i32, i32* %4, align 8, !tbaa !8
  %or.i.i.i = or i32 %5, 4
  tail call void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %3, i32 %or.i.i.i)
  br label %if.end

if.end:                                           ; preds = %if.then.i, %if.then, %for.body
  %arrayidx4 = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f2, i64 0, i64 %indvars.iv
  %_M_file.i.i25 = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f2, i64 0, i64 %indvars.iv, i32 1, i32 2
  %call.i.i26 = tail call zeroext i1 @_ZNKSt12__basic_fileIcE7is_openEv(%"class.std::__basic_file"* nonnull %_M_file.i.i25) #17
  br i1 %call.i.i26, label %if.then6, label %if.end9

if.then6:                                         ; preds = %if.end
  %_M_filebuf.i27 = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f2, i64 0, i64 %indvars.iv, i32 1
  %call.i28 = tail call %"class.std::basic_filebuf"* @_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv(%"class.std::basic_filebuf"* nonnull %_M_filebuf.i27)
  %tobool.i29 = icmp eq %"class.std::basic_filebuf"* %call.i28, null
  br i1 %tobool.i29, label %if.then.i36, label %if.end9

if.then.i36:                                      ; preds = %if.then6
  %6 = bitcast %"class.std::basic_ofstream"* %arrayidx4 to i8**
  %vtable.i30 = load i8*, i8** %6, align 16, !tbaa !6
  %vbase.offset.ptr.i31 = getelementptr i8, i8* %vtable.i30, i64 -24
  %7 = bitcast i8* %vbase.offset.ptr.i31 to i64*
  %vbase.offset.i32 = load i64, i64* %7, align 8
  %8 = bitcast %"class.std::basic_ofstream"* %arrayidx4 to i8*
  %add.ptr.i33 = getelementptr inbounds i8, i8* %8, i64 %vbase.offset.i32
  %9 = bitcast i8* %add.ptr.i33 to %"class.std::basic_ios"*
  %_M_streambuf_state.i.i.i34 = getelementptr inbounds i8, i8* %add.ptr.i33, i64 32
  %10 = bitcast i8* %_M_streambuf_state.i.i.i34 to i32*
  %11 = load i32, i32* %10, align 8, !tbaa !8
  %or.i.i.i35 = or i32 %11, 4
  tail call void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %9, i32 %or.i.i.i35)
  br label %if.end9

if.end9:                                          ; preds = %if.then.i36, %if.then6, %if.end
  %arrayidx11 = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f3, i64 0, i64 %indvars.iv
  %_M_file.i.i38 = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f3, i64 0, i64 %indvars.iv, i32 1, i32 2
  %call.i.i39 = tail call zeroext i1 @_ZNKSt12__basic_fileIcE7is_openEv(%"class.std::__basic_file"* nonnull %_M_file.i.i38) #17
  br i1 %call.i.i39, label %if.then13, label %for.inc

if.then13:                                        ; preds = %if.end9
  %_M_filebuf.i40 = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f3, i64 0, i64 %indvars.iv, i32 1
  %call.i41 = tail call %"class.std::basic_filebuf"* @_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv(%"class.std::basic_filebuf"* nonnull %_M_filebuf.i40)
  %tobool.i42 = icmp eq %"class.std::basic_filebuf"* %call.i41, null
  br i1 %tobool.i42, label %if.then.i49, label %for.inc

if.then.i49:                                      ; preds = %if.then13
  %12 = bitcast %"class.std::basic_ofstream"* %arrayidx11 to i8**
  %vtable.i43 = load i8*, i8** %12, align 16, !tbaa !6
  %vbase.offset.ptr.i44 = getelementptr i8, i8* %vtable.i43, i64 -24
  %13 = bitcast i8* %vbase.offset.ptr.i44 to i64*
  %vbase.offset.i45 = load i64, i64* %13, align 8
  %14 = bitcast %"class.std::basic_ofstream"* %arrayidx11 to i8*
  %add.ptr.i46 = getelementptr inbounds i8, i8* %14, i64 %vbase.offset.i45
  %15 = bitcast i8* %add.ptr.i46 to %"class.std::basic_ios"*
  %_M_streambuf_state.i.i.i47 = getelementptr inbounds i8, i8* %add.ptr.i46, i64 32
  %16 = bitcast i8* %_M_streambuf_state.i.i.i47 to i32*
  %17 = load i32, i32* %16, align 8, !tbaa !8
  %or.i.i.i48 = or i32 %17, 4
  tail call void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %15, i32 %or.i.i.i48)
  br label %for.inc

for.inc:                                          ; preds = %if.then.i49, %if.then13, %if.end9
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1024
  br i1 %exitcond, label %for.cond.cleanup, label %for.body
}

; Function Attrs: nounwind readonly
declare dso_local zeroext i1 @_ZNKSt12__basic_fileIcE7is_openEv(%"class.std::__basic_file"*) local_unnamed_addr #4

declare dso_local %"class.std::basic_filebuf"* @_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv(%"class.std::basic_filebuf"*) local_unnamed_addr #1

declare dso_local void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"*, i32) local_unnamed_addr #1

; Function Attrs: noinline uwtable
define dso_local i8* @_Z12get_dir_nameSsSsSs(%"class.std::basic_string"* nocapture readonly %run_dir, %"class.std::basic_string"* nocapture readonly %kernel_type, %"class.std::basic_string"* nocapture readonly %type) local_unnamed_addr #6 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %ref.tmp.i.i.i.i41 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i.i.i.i = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i = alloca %"class.std::ios_base::Init", align 1
  %ret = alloca %"class.std::basic_ostringstream", align 8
  %ref.tmp = alloca %"class.std::basic_string", align 8
  %call = tail call i32 @omp_get_thread_num() #3
  %cmp = icmp sgt i32 %call, 1023
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([72 x i8], [72 x i8]* @.str, i64 0, i64 0))
  %call2 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0))
  tail call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i64 0, i64 0), i32 43, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @__PRETTY_FUNCTION__._Z12get_dir_nameSsSsSs, i64 0, i64 0)) #18
  unreachable

if.end:                                           ; preds = %entry
  %0 = bitcast %"class.std::basic_ostringstream"* %ret to i8*
  call void @llvm.lifetime.start.p0i8(i64 352, i8* nonnull %0) #3
  call void @_ZNSt19basic_ostringstreamIcSt11char_traitsIcESaIcEEC1ESt13_Ios_Openmode(%"class.std::basic_ostringstream"* nonnull %ret, i32 16)
  %1 = bitcast %"class.std::basic_ostringstream"* %ret to %"class.std::basic_ostream"*
  %_M_p.i.i.i = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %run_dir, i64 0, i32 0, i32 0
  %2 = load i8*, i8** %_M_p.i.i.i, align 8, !tbaa !17
  %arrayidx.i.i.i = getelementptr inbounds i8, i8* %2, i64 -24
  %_M_length.i.i = bitcast i8* %arrayidx.i.i.i to i64*
  %3 = load i64, i64* %_M_length.i.i, align 8, !tbaa !20
  %call2.i22 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %1, i8* %2, i64 %3)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.end
  %call1.i23 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call2.i22, i8* nonnull getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i64 0, i64 0), i64 8)
          to label %invoke.cont4 unwind label %lpad

invoke.cont4:                                     ; preds = %invoke.cont
  %_M_p.i.i.i24 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %kernel_type, i64 0, i32 0, i32 0
  %4 = load i8*, i8** %_M_p.i.i.i24, align 8, !tbaa !17
  %arrayidx.i.i.i25 = getelementptr inbounds i8, i8* %4, i64 -24
  %_M_length.i.i26 = bitcast i8* %arrayidx.i.i.i25 to i64*
  %5 = load i64, i64* %_M_length.i.i26, align 8, !tbaa !20
  %call2.i27 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call2.i22, i8* %4, i64 %5)
          to label %invoke.cont6 unwind label %lpad

invoke.cont6:                                     ; preds = %invoke.cont4
  %call1.i30 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call2.i27, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0), i64 1)
          to label %invoke.cont8 unwind label %lpad

invoke.cont8:                                     ; preds = %invoke.cont6
  %call10 = call i32 @omp_get_thread_num() #3
  %call12 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull %call2.i27, i32 %call10)
          to label %invoke.cont11 unwind label %lpad

invoke.cont11:                                    ; preds = %invoke.cont8
  %call1.i33 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call12, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i64 0, i64 0), i64 1)
          to label %invoke.cont13 unwind label %lpad

invoke.cont13:                                    ; preds = %invoke.cont11
  %_M_p.i.i.i35 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %type, i64 0, i32 0, i32 0
  %6 = load i8*, i8** %_M_p.i.i.i35, align 8, !tbaa !17
  %arrayidx.i.i.i36 = getelementptr inbounds i8, i8* %6, i64 -24
  %_M_length.i.i37 = bitcast i8* %arrayidx.i.i.i36 to i64*
  %7 = load i64, i64* %_M_length.i.i37, align 8, !tbaa !20
  %call2.i38 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call12, i8* %6, i64 %7)
          to label %invoke.cont15 unwind label %lpad

invoke.cont15:                                    ; preds = %invoke.cont13
  %8 = bitcast %"class.std::basic_string"* %ref.tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %8) #3
  %_M_stringbuf.i = getelementptr inbounds %"class.std::basic_ostringstream", %"class.std::basic_ostringstream"* %ret, i64 0, i32 1
  invoke void @_ZNKSt15basic_stringbufIcSt11char_traitsIcESaIcEE3strEv(%"class.std::basic_string"* nonnull sret %ref.tmp, %"class.std::basic_stringbuf"* nonnull %_M_stringbuf.i)
          to label %invoke.cont18 unwind label %lpad17

invoke.cont18:                                    ; preds = %invoke.cont15
  %_M_p.i.i = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %ref.tmp, i64 0, i32 0, i32 0
  %9 = load i8*, i8** %_M_p.i.i, align 8, !tbaa !17
  %arrayidx.i.i = getelementptr inbounds i8, i8* %9, i64 -24
  %10 = bitcast i8* %arrayidx.i.i to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %11 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %11) #3
  %cmp.i.i = icmp eq i8* %arrayidx.i.i, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i, label %_ZNSsD2Ev.exit, label %if.then.i.i, !prof !22

if.then.i.i:                                      ; preds = %invoke.cont18
  %_M_refcount.i.i = getelementptr inbounds i8, i8* %9, i64 -8
  %12 = bitcast i8* %_M_refcount.i.i to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i, label %if.else.i.i.i

if.then.i.i.i:                                    ; preds = %if.then.i.i
  %13 = atomicrmw volatile add i32* %12, i32 -1 acq_rel
  br label %invoke.cont.i.i

if.else.i.i.i:                                    ; preds = %if.then.i.i
  %14 = load i32, i32* %12, align 4, !tbaa !23
  %add.i.i.i.i = add nsw i32 %14, -1
  store i32 %add.i.i.i.i, i32* %12, align 4, !tbaa !23
  br label %invoke.cont.i.i

invoke.cont.i.i:                                  ; preds = %if.else.i.i.i, %if.then.i.i.i
  %retval.0.i.i.i = phi i32 [ %13, %if.then.i.i.i ], [ %14, %if.else.i.i.i ]
  %cmp3.i.i = icmp slt i32 %retval.0.i.i.i, 1
  br i1 %cmp3.i.i, label %if.then4.i.i, label %_ZNSsD2Ev.exit

if.then4.i.i:                                     ; preds = %invoke.cont.i.i
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %10, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i) #3
  br label %_ZNSsD2Ev.exit

_ZNSsD2Ev.exit:                                   ; preds = %if.then4.i.i, %invoke.cont.i.i, %invoke.cont18
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %11) #3
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %8) #3
  %15 = load i64, i64* bitcast ([4 x i8*]* @_ZTTSt19basic_ostringstreamIcSt11char_traitsIcESaIcEE to i64*), align 8
  %16 = bitcast %"class.std::basic_ostringstream"* %ret to i64*
  store i64 %15, i64* %16, align 8, !tbaa !6
  %17 = load i64, i64* bitcast (i8** getelementptr inbounds ([4 x i8*], [4 x i8*]* @_ZTTSt19basic_ostringstreamIcSt11char_traitsIcESaIcEE, i64 0, i64 3) to i64*), align 8
  %vtable.cast.i.i = inttoptr i64 %15 to i8*
  %vbase.offset.ptr.i.i = getelementptr i8, i8* %vtable.cast.i.i, i64 -24
  %18 = bitcast i8* %vbase.offset.ptr.i.i to i64*
  %vbase.offset.i.i = load i64, i64* %18, align 8
  %add.ptr.i.i = getelementptr inbounds i8, i8* %0, i64 %vbase.offset.i.i
  %19 = bitcast i8* %add.ptr.i.i to i64*
  store i64 %17, i64* %19, align 8, !tbaa !6
  %20 = getelementptr inbounds %"class.std::basic_ostringstream", %"class.std::basic_ostringstream"* %ret, i64 0, i32 1, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [16 x i8*] }, { [16 x i8*] }* @_ZTVSt15basic_stringbufIcSt11char_traitsIcESaIcEE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %20, align 8, !tbaa !6
  %_M_p.i.i.i.i.i.i = getelementptr inbounds %"class.std::basic_ostringstream", %"class.std::basic_ostringstream"* %ret, i64 0, i32 1, i32 2, i32 0, i32 0
  %21 = load i8*, i8** %_M_p.i.i.i.i.i.i, align 8, !tbaa !17
  %arrayidx.i.i.i.i.i = getelementptr inbounds i8, i8* %21, i64 -24
  %22 = bitcast i8* %arrayidx.i.i.i.i.i to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %23 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i.i.i.i, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %23) #3
  %cmp.i.i.i.i.i = icmp eq i8* %arrayidx.i.i.i.i.i, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i.i.i.i, label %_ZNSt19basic_ostringstreamIcSt11char_traitsIcESaIcEED1Ev.exit, label %if.then.i.i.i.i.i, !prof !22

if.then.i.i.i.i.i:                                ; preds = %_ZNSsD2Ev.exit
  %_M_refcount.i.i.i.i.i = getelementptr inbounds i8, i8* %21, i64 -8
  %24 = bitcast i8* %_M_refcount.i.i.i.i.i to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i.i, label %if.else.i.i.i.i.i.i

if.then.i.i.i.i.i.i:                              ; preds = %if.then.i.i.i.i.i
  %25 = atomicrmw volatile add i32* %24, i32 -1 acq_rel
  br label %invoke.cont.i.i.i.i.i

if.else.i.i.i.i.i.i:                              ; preds = %if.then.i.i.i.i.i
  %26 = load i32, i32* %24, align 4, !tbaa !23
  %add.i.i.i.i.i.i.i = add nsw i32 %26, -1
  store i32 %add.i.i.i.i.i.i.i, i32* %24, align 4, !tbaa !23
  br label %invoke.cont.i.i.i.i.i

invoke.cont.i.i.i.i.i:                            ; preds = %if.else.i.i.i.i.i.i, %if.then.i.i.i.i.i.i
  %retval.0.i.i.i.i.i.i = phi i32 [ %25, %if.then.i.i.i.i.i.i ], [ %26, %if.else.i.i.i.i.i.i ]
  %cmp3.i.i.i.i.i = icmp slt i32 %retval.0.i.i.i.i.i.i, 1
  br i1 %cmp3.i.i.i.i.i, label %if.then4.i.i.i.i.i, label %_ZNSt19basic_ostringstreamIcSt11char_traitsIcESaIcEED1Ev.exit

if.then4.i.i.i.i.i:                               ; preds = %invoke.cont.i.i.i.i.i
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %22, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i.i.i.i) #3
  br label %_ZNSt19basic_ostringstreamIcSt11char_traitsIcESaIcEED1Ev.exit

_ZNSt19basic_ostringstreamIcSt11char_traitsIcESaIcEED1Ev.exit: ; preds = %if.then4.i.i.i.i.i, %invoke.cont.i.i.i.i.i, %_ZNSsD2Ev.exit
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %23) #3
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [16 x i8*] }, { [16 x i8*] }* @_ZTVSt15basic_streambufIcSt11char_traitsIcEE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %20, align 8, !tbaa !6
  %_M_buf_locale.i.i.i.i = getelementptr inbounds %"class.std::basic_ostringstream", %"class.std::basic_ostringstream"* %ret, i64 0, i32 1, i32 0, i32 7
  call void @_ZNSt6localeD1Ev(%"class.std::locale"* nonnull %_M_buf_locale.i.i.i.i) #3
  %27 = getelementptr inbounds %"class.std::basic_ostringstream", %"class.std::basic_ostringstream"* %ret, i64 0, i32 2, i32 0
  call void @_ZNSt8ios_baseD2Ev(%"class.std::ios_base"* nonnull %27) #3
  call void @llvm.lifetime.end.p0i8(i64 352, i8* nonnull %0) #3
  ret i8* %9

lpad:                                             ; preds = %invoke.cont13, %invoke.cont11, %invoke.cont8, %invoke.cont6, %invoke.cont4, %invoke.cont, %if.end
  %28 = landingpad { i8*, i32 }
          cleanup
  %29 = extractvalue { i8*, i32 } %28, 0
  %30 = extractvalue { i8*, i32 } %28, 1
  br label %ehcleanup

lpad17:                                           ; preds = %invoke.cont15
  %31 = landingpad { i8*, i32 }
          cleanup
  %32 = extractvalue { i8*, i32 } %31, 0
  %33 = extractvalue { i8*, i32 } %31, 1
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %8) #3
  br label %ehcleanup

ehcleanup:                                        ; preds = %lpad17, %lpad
  %exn.slot.0 = phi i8* [ %32, %lpad17 ], [ %29, %lpad ]
  %ehselector.slot.0 = phi i32 [ %33, %lpad17 ], [ %30, %lpad ]
  %34 = load i64, i64* bitcast ([4 x i8*]* @_ZTTSt19basic_ostringstreamIcSt11char_traitsIcESaIcEE to i64*), align 8
  %35 = bitcast %"class.std::basic_ostringstream"* %ret to i64*
  store i64 %34, i64* %35, align 8, !tbaa !6
  %36 = load i64, i64* bitcast (i8** getelementptr inbounds ([4 x i8*], [4 x i8*]* @_ZTTSt19basic_ostringstreamIcSt11char_traitsIcESaIcEE, i64 0, i64 3) to i64*), align 8
  %vtable.cast.i.i42 = inttoptr i64 %34 to i8*
  %vbase.offset.ptr.i.i43 = getelementptr i8, i8* %vtable.cast.i.i42, i64 -24
  %37 = bitcast i8* %vbase.offset.ptr.i.i43 to i64*
  %vbase.offset.i.i44 = load i64, i64* %37, align 8
  %add.ptr.i.i45 = getelementptr inbounds i8, i8* %0, i64 %vbase.offset.i.i44
  %38 = bitcast i8* %add.ptr.i.i45 to i64*
  store i64 %36, i64* %38, align 8, !tbaa !6
  %39 = getelementptr inbounds %"class.std::basic_ostringstream", %"class.std::basic_ostringstream"* %ret, i64 0, i32 1, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [16 x i8*] }, { [16 x i8*] }* @_ZTVSt15basic_stringbufIcSt11char_traitsIcESaIcEE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %39, align 8, !tbaa !6
  %_M_p.i.i.i.i.i.i46 = getelementptr inbounds %"class.std::basic_ostringstream", %"class.std::basic_ostringstream"* %ret, i64 0, i32 1, i32 2, i32 0, i32 0
  %40 = load i8*, i8** %_M_p.i.i.i.i.i.i46, align 8, !tbaa !17
  %arrayidx.i.i.i.i.i47 = getelementptr inbounds i8, i8* %40, i64 -24
  %41 = bitcast i8* %arrayidx.i.i.i.i.i47 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %42 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i.i.i.i41, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %42) #3
  %cmp.i.i.i.i.i48 = icmp eq i8* %arrayidx.i.i.i.i.i47, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i.i.i.i48, label %_ZNSt19basic_ostringstreamIcSt11char_traitsIcESaIcEED1Ev.exit59, label %if.then.i.i.i.i.i50, !prof !22

if.then.i.i.i.i.i50:                              ; preds = %ehcleanup
  %_M_refcount.i.i.i.i.i49 = getelementptr inbounds i8, i8* %40, i64 -8
  %43 = bitcast i8* %_M_refcount.i.i.i.i.i49 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i.i.i.i51, label %if.else.i.i.i.i.i.i53

if.then.i.i.i.i.i.i51:                            ; preds = %if.then.i.i.i.i.i50
  %44 = atomicrmw volatile add i32* %43, i32 -1 acq_rel
  br label %invoke.cont.i.i.i.i.i56

if.else.i.i.i.i.i.i53:                            ; preds = %if.then.i.i.i.i.i50
  %45 = load i32, i32* %43, align 4, !tbaa !23
  %add.i.i.i.i.i.i.i52 = add nsw i32 %45, -1
  store i32 %add.i.i.i.i.i.i.i52, i32* %43, align 4, !tbaa !23
  br label %invoke.cont.i.i.i.i.i56

invoke.cont.i.i.i.i.i56:                          ; preds = %if.else.i.i.i.i.i.i53, %if.then.i.i.i.i.i.i51
  %retval.0.i.i.i.i.i.i54 = phi i32 [ %44, %if.then.i.i.i.i.i.i51 ], [ %45, %if.else.i.i.i.i.i.i53 ]
  %cmp3.i.i.i.i.i55 = icmp slt i32 %retval.0.i.i.i.i.i.i54, 1
  br i1 %cmp3.i.i.i.i.i55, label %if.then4.i.i.i.i.i57, label %_ZNSt19basic_ostringstreamIcSt11char_traitsIcESaIcEED1Ev.exit59

if.then4.i.i.i.i.i57:                             ; preds = %invoke.cont.i.i.i.i.i56
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %41, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i.i.i.i41) #3
  br label %_ZNSt19basic_ostringstreamIcSt11char_traitsIcESaIcEED1Ev.exit59

_ZNSt19basic_ostringstreamIcSt11char_traitsIcESaIcEED1Ev.exit59: ; preds = %if.then4.i.i.i.i.i57, %invoke.cont.i.i.i.i.i56, %ehcleanup
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %42) #3
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [16 x i8*] }, { [16 x i8*] }* @_ZTVSt15basic_streambufIcSt11char_traitsIcEE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %39, align 8, !tbaa !6
  %_M_buf_locale.i.i.i.i58 = getelementptr inbounds %"class.std::basic_ostringstream", %"class.std::basic_ostringstream"* %ret, i64 0, i32 1, i32 0, i32 7
  call void @_ZNSt6localeD1Ev(%"class.std::locale"* nonnull %_M_buf_locale.i.i.i.i58) #3
  %46 = getelementptr inbounds %"class.std::basic_ostringstream", %"class.std::basic_ostringstream"* %ret, i64 0, i32 2, i32 0
  call void @_ZNSt8ios_baseD2Ev(%"class.std::ios_base"* nonnull %46) #3
  call void @llvm.lifetime.end.p0i8(i64 352, i8* nonnull %0) #3
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn.slot.0, 0
  %lpad.val21 = insertvalue { i8*, i32 } %lpad.val, i32 %ehselector.slot.0, 1
  resume { i8*, i32 } %lpad.val21
}

; Function Attrs: nounwind
declare dso_local i32 @omp_get_thread_num() local_unnamed_addr #2

; Function Attrs: inlinehint uwtable
declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272), i8*) local_unnamed_addr #7

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #8

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #9

; Function Attrs: uwtable
declare dso_local void @_ZNSt19basic_ostringstreamIcSt11char_traitsIcESaIcEEC1ESt13_Ios_Openmode(%"class.std::basic_ostringstream"*, i32) unnamed_addr #0 align 2

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* dereferenceable(272), i8*, i64) local_unnamed_addr #1

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"*, i32) local_unnamed_addr #1

; Function Attrs: uwtable
declare dso_local void @_ZNKSt15basic_stringbufIcSt11char_traitsIcESaIcEE3strEv(%"class.std::basic_string"* noalias sret, %"class.std::basic_stringbuf"*) local_unnamed_addr #0 align 2

; Function Attrs: nounwind
declare extern_weak dso_local i32 @__pthread_key_create(i32*, void (i8*)*) #2

; Function Attrs: nounwind
declare dso_local void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*, %"class.std::ios_base::Init"* dereferenceable(1)) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #9

; Function Attrs: nounwind
declare dso_local void @_ZNSt6localeD1Ev(%"class.std::locale"*) unnamed_addr #2

; Function Attrs: nounwind
declare dso_local void @_ZNSt8ios_baseD2Ev(%"class.std::ios_base"*) unnamed_addr #2

; Function Attrs: noinline uwtable
define dso_local void @printBranch(i8* %name, i8* %kernel_type, i8* %run_dir, i32 %cond, i8* %n1, i8* %n2) #6 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %ref.tmp.i107 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i93 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i76 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i62 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i48 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i = alloca %"class.std::ios_base::Init", align 1
  %agg.tmp = alloca %"class.std::basic_string", align 8
  %ref.tmp = alloca %"class.std::ios_base::Init", align 1
  %agg.tmp5 = alloca %"class.std::basic_string", align 8
  %ref.tmp6 = alloca %"class.std::ios_base::Init", align 1
  %agg.tmp9 = alloca %"class.std::basic_string", align 8
  %ref.tmp10 = alloca %"class.std::ios_base::Init", align 1
  %call = tail call i32 @omp_get_thread_num() #3
  %idxprom = sext i32 %call to i64
  %_M_file.i.i = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f1, i64 0, i64 %idxprom, i32 1, i32 2
  %call.i.i = tail call zeroext i1 @_ZNKSt12__basic_fileIcE7is_openEv(%"class.std::__basic_file"* nonnull %_M_file.i.i) #17
  br i1 %call.i.i, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call2 = tail call i32 @omp_get_thread_num() #3
  %idxprom3 = sext i32 %call2 to i64
  %arrayidx4 = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f1, i64 0, i64 %idxprom3
  %0 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %0) #3
  invoke void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* nonnull %agg.tmp, i8* %run_dir, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.then
  %1 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp6, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %1) #3
  invoke void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* nonnull %agg.tmp5, i8* %kernel_type, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp6)
          to label %invoke.cont8 unwind label %lpad7

invoke.cont8:                                     ; preds = %invoke.cont
  %2 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp10, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %2) #3
  invoke void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* nonnull %agg.tmp9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i64 0, i64 0), %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp10)
          to label %invoke.cont12 unwind label %lpad11

invoke.cont12:                                    ; preds = %invoke.cont8
  %call15 = invoke i8* @_Z12get_dir_nameSsSsSs(%"class.std::basic_string"* nonnull %agg.tmp, %"class.std::basic_string"* nonnull %agg.tmp5, %"class.std::basic_string"* nonnull %agg.tmp9)
          to label %invoke.cont14 unwind label %lpad13

invoke.cont14:                                    ; preds = %invoke.cont12
  %_M_filebuf.i = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f1, i64 0, i64 %idxprom3, i32 1
  %call2.i46 = invoke %"class.std::basic_filebuf"* @_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode(%"class.std::basic_filebuf"* nonnull %_M_filebuf.i, i8* %call15, i32 17)
          to label %call2.i.noexc unwind label %lpad13

call2.i.noexc:                                    ; preds = %invoke.cont14
  %tobool.i41 = icmp eq %"class.std::basic_filebuf"* %call2.i46, null
  %3 = bitcast %"class.std::basic_ofstream"* %arrayidx4 to i8**
  %vtable3.i = load i8*, i8** %3, align 16, !tbaa !6
  %vbase.offset.ptr4.i = getelementptr i8, i8* %vtable3.i, i64 -24
  %4 = bitcast i8* %vbase.offset.ptr4.i to i64*
  %vbase.offset5.i = load i64, i64* %4, align 8
  %5 = bitcast %"class.std::basic_ofstream"* %arrayidx4 to i8*
  %add.ptr6.i = getelementptr inbounds i8, i8* %5, i64 %vbase.offset5.i
  %6 = bitcast i8* %add.ptr6.i to %"class.std::basic_ios"*
  br i1 %tobool.i41, label %if.then.i44, label %if.else.i45

if.then.i44:                                      ; preds = %call2.i.noexc
  %_M_streambuf_state.i.i.i42 = getelementptr inbounds i8, i8* %add.ptr6.i, i64 32
  %7 = bitcast i8* %_M_streambuf_state.i.i.i42 to i32*
  %8 = load i32, i32* %7, align 8, !tbaa !8
  %or.i.i.i43 = or i32 %8, 4
  invoke void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %6, i32 %or.i.i.i43)
          to label %invoke.cont18 unwind label %lpad13

if.else.i45:                                      ; preds = %call2.i.noexc
  invoke void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %6, i32 0)
          to label %invoke.cont18 unwind label %lpad13

invoke.cont18:                                    ; preds = %if.else.i45, %if.then.i44
  %_M_p.i.i.i = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp9, i64 0, i32 0, i32 0
  %9 = load i8*, i8** %_M_p.i.i.i, align 8, !tbaa !17
  %arrayidx.i.i = getelementptr inbounds i8, i8* %9, i64 -24
  %10 = bitcast i8* %arrayidx.i.i to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %11 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %11) #3
  %cmp.i.i = icmp eq i8* %arrayidx.i.i, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i, label %_ZNSsD2Ev.exit, label %if.then.i.i, !prof !22

if.then.i.i:                                      ; preds = %invoke.cont18
  %_M_refcount.i.i = getelementptr inbounds i8, i8* %9, i64 -8
  %12 = bitcast i8* %_M_refcount.i.i to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i, label %if.else.i.i.i

if.then.i.i.i:                                    ; preds = %if.then.i.i
  %13 = atomicrmw volatile add i32* %12, i32 -1 acq_rel
  br label %invoke.cont.i.i

if.else.i.i.i:                                    ; preds = %if.then.i.i
  %14 = load i32, i32* %12, align 4, !tbaa !23
  %add.i.i.i.i = add nsw i32 %14, -1
  store i32 %add.i.i.i.i, i32* %12, align 4, !tbaa !23
  br label %invoke.cont.i.i

invoke.cont.i.i:                                  ; preds = %if.else.i.i.i, %if.then.i.i.i
  %retval.0.i.i.i = phi i32 [ %13, %if.then.i.i.i ], [ %14, %if.else.i.i.i ]
  %cmp3.i.i = icmp slt i32 %retval.0.i.i.i, 1
  br i1 %cmp3.i.i, label %if.then4.i.i, label %_ZNSsD2Ev.exit

if.then4.i.i:                                     ; preds = %invoke.cont.i.i
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %10, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i) #3
  br label %_ZNSsD2Ev.exit

_ZNSsD2Ev.exit:                                   ; preds = %if.then4.i.i, %invoke.cont.i.i, %invoke.cont18
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %11) #3
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %2) #3
  %_M_p.i.i.i49 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp5, i64 0, i32 0, i32 0
  %15 = load i8*, i8** %_M_p.i.i.i49, align 8, !tbaa !17
  %arrayidx.i.i50 = getelementptr inbounds i8, i8* %15, i64 -24
  %16 = bitcast i8* %arrayidx.i.i50 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %17 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i48, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %17) #3
  %cmp.i.i51 = icmp eq i8* %arrayidx.i.i50, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i51, label %_ZNSsD2Ev.exit61, label %if.then.i.i53, !prof !22

if.then.i.i53:                                    ; preds = %_ZNSsD2Ev.exit
  %_M_refcount.i.i52 = getelementptr inbounds i8, i8* %15, i64 -8
  %18 = bitcast i8* %_M_refcount.i.i52 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i54, label %if.else.i.i.i56

if.then.i.i.i54:                                  ; preds = %if.then.i.i53
  %19 = atomicrmw volatile add i32* %18, i32 -1 acq_rel
  br label %invoke.cont.i.i59

if.else.i.i.i56:                                  ; preds = %if.then.i.i53
  %20 = load i32, i32* %18, align 4, !tbaa !23
  %add.i.i.i.i55 = add nsw i32 %20, -1
  store i32 %add.i.i.i.i55, i32* %18, align 4, !tbaa !23
  br label %invoke.cont.i.i59

invoke.cont.i.i59:                                ; preds = %if.else.i.i.i56, %if.then.i.i.i54
  %retval.0.i.i.i57 = phi i32 [ %19, %if.then.i.i.i54 ], [ %20, %if.else.i.i.i56 ]
  %cmp3.i.i58 = icmp slt i32 %retval.0.i.i.i57, 1
  br i1 %cmp3.i.i58, label %if.then4.i.i60, label %_ZNSsD2Ev.exit61

if.then4.i.i60:                                   ; preds = %invoke.cont.i.i59
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %16, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i48) #3
  br label %_ZNSsD2Ev.exit61

_ZNSsD2Ev.exit61:                                 ; preds = %if.then4.i.i60, %invoke.cont.i.i59, %_ZNSsD2Ev.exit
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %17) #3
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %1) #3
  %_M_p.i.i.i63 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp, i64 0, i32 0, i32 0
  %21 = load i8*, i8** %_M_p.i.i.i63, align 8, !tbaa !17
  %arrayidx.i.i64 = getelementptr inbounds i8, i8* %21, i64 -24
  %22 = bitcast i8* %arrayidx.i.i64 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %23 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i62, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %23) #3
  %cmp.i.i65 = icmp eq i8* %arrayidx.i.i64, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i65, label %_ZNSsD2Ev.exit75, label %if.then.i.i67, !prof !22

if.then.i.i67:                                    ; preds = %_ZNSsD2Ev.exit61
  %_M_refcount.i.i66 = getelementptr inbounds i8, i8* %21, i64 -8
  %24 = bitcast i8* %_M_refcount.i.i66 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i68, label %if.else.i.i.i70

if.then.i.i.i68:                                  ; preds = %if.then.i.i67
  %25 = atomicrmw volatile add i32* %24, i32 -1 acq_rel
  br label %invoke.cont.i.i73

if.else.i.i.i70:                                  ; preds = %if.then.i.i67
  %26 = load i32, i32* %24, align 4, !tbaa !23
  %add.i.i.i.i69 = add nsw i32 %26, -1
  store i32 %add.i.i.i.i69, i32* %24, align 4, !tbaa !23
  br label %invoke.cont.i.i73

invoke.cont.i.i73:                                ; preds = %if.else.i.i.i70, %if.then.i.i.i68
  %retval.0.i.i.i71 = phi i32 [ %25, %if.then.i.i.i68 ], [ %26, %if.else.i.i.i70 ]
  %cmp3.i.i72 = icmp slt i32 %retval.0.i.i.i71, 1
  br i1 %cmp3.i.i72, label %if.then4.i.i74, label %_ZNSsD2Ev.exit75

if.then4.i.i74:                                   ; preds = %invoke.cont.i.i73
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %22, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i62) #3
  br label %_ZNSsD2Ev.exit75

_ZNSsD2Ev.exit75:                                 ; preds = %if.then4.i.i74, %invoke.cont.i.i73, %_ZNSsD2Ev.exit61
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %23) #3
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %0) #3
  br label %if.end

lpad:                                             ; preds = %if.then
  %27 = landingpad { i8*, i32 }
          cleanup
  %28 = extractvalue { i8*, i32 } %27, 0
  %29 = extractvalue { i8*, i32 } %27, 1
  br label %ehcleanup24

lpad7:                                            ; preds = %invoke.cont
  %30 = landingpad { i8*, i32 }
          cleanup
  %31 = extractvalue { i8*, i32 } %30, 0
  %32 = extractvalue { i8*, i32 } %30, 1
  br label %ehcleanup21

lpad11:                                           ; preds = %invoke.cont8
  %33 = landingpad { i8*, i32 }
          cleanup
  %34 = extractvalue { i8*, i32 } %33, 0
  %35 = extractvalue { i8*, i32 } %33, 1
  br label %ehcleanup

lpad13:                                           ; preds = %if.else.i45, %if.then.i44, %invoke.cont14, %invoke.cont12
  %36 = landingpad { i8*, i32 }
          cleanup
  %37 = extractvalue { i8*, i32 } %36, 0
  %38 = extractvalue { i8*, i32 } %36, 1
  %_M_p.i.i.i77 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp9, i64 0, i32 0, i32 0
  %39 = load i8*, i8** %_M_p.i.i.i77, align 8, !tbaa !17
  %arrayidx.i.i78 = getelementptr inbounds i8, i8* %39, i64 -24
  %40 = bitcast i8* %arrayidx.i.i78 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %41 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i76, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %41) #3
  %cmp.i.i79 = icmp eq i8* %arrayidx.i.i78, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i79, label %_ZNSsD2Ev.exit89, label %if.then.i.i81, !prof !22

if.then.i.i81:                                    ; preds = %lpad13
  %_M_refcount.i.i80 = getelementptr inbounds i8, i8* %39, i64 -8
  %42 = bitcast i8* %_M_refcount.i.i80 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i82, label %if.else.i.i.i84

if.then.i.i.i82:                                  ; preds = %if.then.i.i81
  %43 = atomicrmw volatile add i32* %42, i32 -1 acq_rel
  br label %invoke.cont.i.i87

if.else.i.i.i84:                                  ; preds = %if.then.i.i81
  %44 = load i32, i32* %42, align 4, !tbaa !23
  %add.i.i.i.i83 = add nsw i32 %44, -1
  store i32 %add.i.i.i.i83, i32* %42, align 4, !tbaa !23
  br label %invoke.cont.i.i87

invoke.cont.i.i87:                                ; preds = %if.else.i.i.i84, %if.then.i.i.i82
  %retval.0.i.i.i85 = phi i32 [ %43, %if.then.i.i.i82 ], [ %44, %if.else.i.i.i84 ]
  %cmp3.i.i86 = icmp slt i32 %retval.0.i.i.i85, 1
  br i1 %cmp3.i.i86, label %if.then4.i.i88, label %_ZNSsD2Ev.exit89

if.then4.i.i88:                                   ; preds = %invoke.cont.i.i87
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %40, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i76) #3
  br label %_ZNSsD2Ev.exit89

_ZNSsD2Ev.exit89:                                 ; preds = %if.then4.i.i88, %invoke.cont.i.i87, %lpad13
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %41) #3
  br label %ehcleanup

ehcleanup:                                        ; preds = %_ZNSsD2Ev.exit89, %lpad11
  %exn.slot.0 = phi i8* [ %37, %_ZNSsD2Ev.exit89 ], [ %34, %lpad11 ]
  %ehselector.slot.0 = phi i32 [ %38, %_ZNSsD2Ev.exit89 ], [ %35, %lpad11 ]
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %2) #3
  %_M_p.i.i.i94 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp5, i64 0, i32 0, i32 0
  %45 = load i8*, i8** %_M_p.i.i.i94, align 8, !tbaa !17
  %arrayidx.i.i95 = getelementptr inbounds i8, i8* %45, i64 -24
  %46 = bitcast i8* %arrayidx.i.i95 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %47 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i93, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %47) #3
  %cmp.i.i96 = icmp eq i8* %arrayidx.i.i95, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i96, label %_ZNSsD2Ev.exit106, label %if.then.i.i98, !prof !22

if.then.i.i98:                                    ; preds = %ehcleanup
  %_M_refcount.i.i97 = getelementptr inbounds i8, i8* %45, i64 -8
  %48 = bitcast i8* %_M_refcount.i.i97 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i99, label %if.else.i.i.i101

if.then.i.i.i99:                                  ; preds = %if.then.i.i98
  %49 = atomicrmw volatile add i32* %48, i32 -1 acq_rel
  br label %invoke.cont.i.i104

if.else.i.i.i101:                                 ; preds = %if.then.i.i98
  %50 = load i32, i32* %48, align 4, !tbaa !23
  %add.i.i.i.i100 = add nsw i32 %50, -1
  store i32 %add.i.i.i.i100, i32* %48, align 4, !tbaa !23
  br label %invoke.cont.i.i104

invoke.cont.i.i104:                               ; preds = %if.else.i.i.i101, %if.then.i.i.i99
  %retval.0.i.i.i102 = phi i32 [ %49, %if.then.i.i.i99 ], [ %50, %if.else.i.i.i101 ]
  %cmp3.i.i103 = icmp slt i32 %retval.0.i.i.i102, 1
  br i1 %cmp3.i.i103, label %if.then4.i.i105, label %_ZNSsD2Ev.exit106

if.then4.i.i105:                                  ; preds = %invoke.cont.i.i104
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %46, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i93) #3
  br label %_ZNSsD2Ev.exit106

_ZNSsD2Ev.exit106:                                ; preds = %if.then4.i.i105, %invoke.cont.i.i104, %ehcleanup
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %47) #3
  br label %ehcleanup21

ehcleanup21:                                      ; preds = %_ZNSsD2Ev.exit106, %lpad7
  %exn.slot.1 = phi i8* [ %exn.slot.0, %_ZNSsD2Ev.exit106 ], [ %31, %lpad7 ]
  %ehselector.slot.1 = phi i32 [ %ehselector.slot.0, %_ZNSsD2Ev.exit106 ], [ %32, %lpad7 ]
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %1) #3
  %_M_p.i.i.i108 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp, i64 0, i32 0, i32 0
  %51 = load i8*, i8** %_M_p.i.i.i108, align 8, !tbaa !17
  %arrayidx.i.i109 = getelementptr inbounds i8, i8* %51, i64 -24
  %52 = bitcast i8* %arrayidx.i.i109 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %53 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i107, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %53) #3
  %cmp.i.i110 = icmp eq i8* %arrayidx.i.i109, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i110, label %_ZNSsD2Ev.exit120, label %if.then.i.i112, !prof !22

if.then.i.i112:                                   ; preds = %ehcleanup21
  %_M_refcount.i.i111 = getelementptr inbounds i8, i8* %51, i64 -8
  %54 = bitcast i8* %_M_refcount.i.i111 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i113, label %if.else.i.i.i115

if.then.i.i.i113:                                 ; preds = %if.then.i.i112
  %55 = atomicrmw volatile add i32* %54, i32 -1 acq_rel
  br label %invoke.cont.i.i118

if.else.i.i.i115:                                 ; preds = %if.then.i.i112
  %56 = load i32, i32* %54, align 4, !tbaa !23
  %add.i.i.i.i114 = add nsw i32 %56, -1
  store i32 %add.i.i.i.i114, i32* %54, align 4, !tbaa !23
  br label %invoke.cont.i.i118

invoke.cont.i.i118:                               ; preds = %if.else.i.i.i115, %if.then.i.i.i113
  %retval.0.i.i.i116 = phi i32 [ %55, %if.then.i.i.i113 ], [ %56, %if.else.i.i.i115 ]
  %cmp3.i.i117 = icmp slt i32 %retval.0.i.i.i116, 1
  br i1 %cmp3.i.i117, label %if.then4.i.i119, label %_ZNSsD2Ev.exit120

if.then4.i.i119:                                  ; preds = %invoke.cont.i.i118
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %52, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i107) #3
  br label %_ZNSsD2Ev.exit120

_ZNSsD2Ev.exit120:                                ; preds = %if.then4.i.i119, %invoke.cont.i.i118, %ehcleanup21
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %53) #3
  br label %ehcleanup24

ehcleanup24:                                      ; preds = %_ZNSsD2Ev.exit120, %lpad
  %exn.slot.2 = phi i8* [ %exn.slot.1, %_ZNSsD2Ev.exit120 ], [ %28, %lpad ]
  %ehselector.slot.2 = phi i32 [ %ehselector.slot.1, %_ZNSsD2Ev.exit120 ], [ %29, %lpad ]
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %0) #3
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn.slot.2, 0
  %lpad.val36 = insertvalue { i8*, i32 } %lpad.val, i32 %ehselector.slot.2, 1
  resume { i8*, i32 } %lpad.val36

if.end:                                           ; preds = %_ZNSsD2Ev.exit75, %entry
  %cmp = icmp eq i32 %cond, 0
  %n1.n2 = select i1 %cmp, i8* %n1, i8* %n2
  %call28 = call i32 @omp_get_thread_num() #3
  %idxprom29 = sext i32 %call28 to i64
  %arrayidx30 = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f1, i64 0, i64 %idxprom29
  %57 = bitcast %"class.std::basic_ofstream"* %arrayidx30 to %"class.std::basic_ostream"*
  %call1.i134 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %57, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0), i64 2)
  %tobool.i121 = icmp eq i8* %name, null
  br i1 %tobool.i121, label %if.then.i128, label %if.else.i131

if.then.i128:                                     ; preds = %if.end
  %58 = bitcast %"class.std::basic_ofstream"* %arrayidx30 to i8**
  %vtable.i122 = load i8*, i8** %58, align 16, !tbaa !6
  %vbase.offset.ptr.i123 = getelementptr i8, i8* %vtable.i122, i64 -24
  %59 = bitcast i8* %vbase.offset.ptr.i123 to i64*
  %vbase.offset.i124 = load i64, i64* %59, align 8
  %60 = bitcast %"class.std::basic_ofstream"* %arrayidx30 to i8*
  %add.ptr.i125 = getelementptr inbounds i8, i8* %60, i64 %vbase.offset.i124
  %61 = bitcast i8* %add.ptr.i125 to %"class.std::basic_ios"*
  %_M_streambuf_state.i.i.i126 = getelementptr inbounds i8, i8* %add.ptr.i125, i64 32
  %62 = bitcast i8* %_M_streambuf_state.i.i.i126 to i32*
  %63 = load i32, i32* %62, align 8, !tbaa !8
  %or.i.i.i127 = or i32 %63, 1
  call void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %61, i32 %or.i.i.i127)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit132

if.else.i131:                                     ; preds = %if.end
  %call.i.i129 = call i64 @strlen(i8* nonnull %name) #3
  %call1.i130 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %57, i8* nonnull %name, i64 %call.i.i129)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit132

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit132: ; preds = %if.else.i131, %if.then.i128
  %call1.i91 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %57, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %tobool.i = icmp eq i8* %n1.n2, null
  br i1 %tobool.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit132
  %64 = bitcast %"class.std::basic_ofstream"* %arrayidx30 to i8**
  %vtable.i = load i8*, i8** %64, align 16, !tbaa !6
  %vbase.offset.ptr.i = getelementptr i8, i8* %vtable.i, i64 -24
  %65 = bitcast i8* %vbase.offset.ptr.i to i64*
  %vbase.offset.i = load i64, i64* %65, align 8
  %66 = bitcast %"class.std::basic_ofstream"* %arrayidx30 to i8*
  %add.ptr.i = getelementptr inbounds i8, i8* %66, i64 %vbase.offset.i
  %67 = bitcast i8* %add.ptr.i to %"class.std::basic_ios"*
  %_M_streambuf_state.i.i.i = getelementptr inbounds i8, i8* %add.ptr.i, i64 32
  %68 = bitcast i8* %_M_streambuf_state.i.i.i to i32*
  %69 = load i32, i32* %68, align 8, !tbaa !8
  %or.i.i.i = or i32 %69, 1
  call void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %67, i32 %or.i.i.i)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit

if.else.i:                                        ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit132
  %call.i.i39 = call i64 @strlen(i8* nonnull %n1.n2) #3
  %call1.i40 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %57, i8* nonnull %n1.n2, i64 %call.i.i39)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit: ; preds = %if.else.i, %if.then.i
  %call1.i = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %57, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0), i64 1)
  ret void
}

declare dso_local void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"*, i8*, %"class.std::ios_base::Init"* dereferenceable(1)) unnamed_addr #1

declare dso_local %"class.std::basic_filebuf"* @_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode(%"class.std::basic_filebuf"*, i8*, i32) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind readonly
declare dso_local i64 @strlen(i8* nocapture) local_unnamed_addr #10

; Function Attrs: noinline uwtable
define dso_local void @printuBranch(i8* %name, i8* %kernel_type, i8* %run_dir, i8* %n1) #6 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %ref.tmp.i110 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i96 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i79 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i65 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i51 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i = alloca %"class.std::ios_base::Init", align 1
  %agg.tmp = alloca %"class.std::basic_string", align 8
  %ref.tmp = alloca %"class.std::ios_base::Init", align 1
  %agg.tmp5 = alloca %"class.std::basic_string", align 8
  %ref.tmp6 = alloca %"class.std::ios_base::Init", align 1
  %agg.tmp9 = alloca %"class.std::basic_string", align 8
  %ref.tmp10 = alloca %"class.std::ios_base::Init", align 1
  %call = tail call i32 @omp_get_thread_num() #3
  %idxprom = sext i32 %call to i64
  %_M_file.i.i = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f1, i64 0, i64 %idxprom, i32 1, i32 2
  %call.i.i = tail call zeroext i1 @_ZNKSt12__basic_fileIcE7is_openEv(%"class.std::__basic_file"* nonnull %_M_file.i.i) #17
  br i1 %call.i.i, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call2 = tail call i32 @omp_get_thread_num() #3
  %idxprom3 = sext i32 %call2 to i64
  %arrayidx4 = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f1, i64 0, i64 %idxprom3
  %0 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %0) #3
  invoke void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* nonnull %agg.tmp, i8* %run_dir, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.then
  %1 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp6, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %1) #3
  invoke void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* nonnull %agg.tmp5, i8* %kernel_type, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp6)
          to label %invoke.cont8 unwind label %lpad7

invoke.cont8:                                     ; preds = %invoke.cont
  %2 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp10, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %2) #3
  invoke void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* nonnull %agg.tmp9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i64 0, i64 0), %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp10)
          to label %invoke.cont12 unwind label %lpad11

invoke.cont12:                                    ; preds = %invoke.cont8
  %call15 = invoke i8* @_Z12get_dir_nameSsSsSs(%"class.std::basic_string"* nonnull %agg.tmp, %"class.std::basic_string"* nonnull %agg.tmp5, %"class.std::basic_string"* nonnull %agg.tmp9)
          to label %invoke.cont14 unwind label %lpad13

invoke.cont14:                                    ; preds = %invoke.cont12
  %_M_filebuf.i = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f1, i64 0, i64 %idxprom3, i32 1
  %call2.i49 = invoke %"class.std::basic_filebuf"* @_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode(%"class.std::basic_filebuf"* nonnull %_M_filebuf.i, i8* %call15, i32 17)
          to label %call2.i.noexc unwind label %lpad13

call2.i.noexc:                                    ; preds = %invoke.cont14
  %tobool.i44 = icmp eq %"class.std::basic_filebuf"* %call2.i49, null
  %3 = bitcast %"class.std::basic_ofstream"* %arrayidx4 to i8**
  %vtable3.i = load i8*, i8** %3, align 16, !tbaa !6
  %vbase.offset.ptr4.i = getelementptr i8, i8* %vtable3.i, i64 -24
  %4 = bitcast i8* %vbase.offset.ptr4.i to i64*
  %vbase.offset5.i = load i64, i64* %4, align 8
  %5 = bitcast %"class.std::basic_ofstream"* %arrayidx4 to i8*
  %add.ptr6.i = getelementptr inbounds i8, i8* %5, i64 %vbase.offset5.i
  %6 = bitcast i8* %add.ptr6.i to %"class.std::basic_ios"*
  br i1 %tobool.i44, label %if.then.i47, label %if.else.i48

if.then.i47:                                      ; preds = %call2.i.noexc
  %_M_streambuf_state.i.i.i45 = getelementptr inbounds i8, i8* %add.ptr6.i, i64 32
  %7 = bitcast i8* %_M_streambuf_state.i.i.i45 to i32*
  %8 = load i32, i32* %7, align 8, !tbaa !8
  %or.i.i.i46 = or i32 %8, 4
  invoke void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %6, i32 %or.i.i.i46)
          to label %invoke.cont18 unwind label %lpad13

if.else.i48:                                      ; preds = %call2.i.noexc
  invoke void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %6, i32 0)
          to label %invoke.cont18 unwind label %lpad13

invoke.cont18:                                    ; preds = %if.else.i48, %if.then.i47
  %_M_p.i.i.i = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp9, i64 0, i32 0, i32 0
  %9 = load i8*, i8** %_M_p.i.i.i, align 8, !tbaa !17
  %arrayidx.i.i = getelementptr inbounds i8, i8* %9, i64 -24
  %10 = bitcast i8* %arrayidx.i.i to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %11 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %11) #3
  %cmp.i.i = icmp eq i8* %arrayidx.i.i, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i, label %_ZNSsD2Ev.exit, label %if.then.i.i, !prof !22

if.then.i.i:                                      ; preds = %invoke.cont18
  %_M_refcount.i.i = getelementptr inbounds i8, i8* %9, i64 -8
  %12 = bitcast i8* %_M_refcount.i.i to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i, label %if.else.i.i.i

if.then.i.i.i:                                    ; preds = %if.then.i.i
  %13 = atomicrmw volatile add i32* %12, i32 -1 acq_rel
  br label %invoke.cont.i.i

if.else.i.i.i:                                    ; preds = %if.then.i.i
  %14 = load i32, i32* %12, align 4, !tbaa !23
  %add.i.i.i.i = add nsw i32 %14, -1
  store i32 %add.i.i.i.i, i32* %12, align 4, !tbaa !23
  br label %invoke.cont.i.i

invoke.cont.i.i:                                  ; preds = %if.else.i.i.i, %if.then.i.i.i
  %retval.0.i.i.i = phi i32 [ %13, %if.then.i.i.i ], [ %14, %if.else.i.i.i ]
  %cmp3.i.i = icmp slt i32 %retval.0.i.i.i, 1
  br i1 %cmp3.i.i, label %if.then4.i.i, label %_ZNSsD2Ev.exit

if.then4.i.i:                                     ; preds = %invoke.cont.i.i
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %10, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i) #3
  br label %_ZNSsD2Ev.exit

_ZNSsD2Ev.exit:                                   ; preds = %if.then4.i.i, %invoke.cont.i.i, %invoke.cont18
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %11) #3
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %2) #3
  %_M_p.i.i.i52 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp5, i64 0, i32 0, i32 0
  %15 = load i8*, i8** %_M_p.i.i.i52, align 8, !tbaa !17
  %arrayidx.i.i53 = getelementptr inbounds i8, i8* %15, i64 -24
  %16 = bitcast i8* %arrayidx.i.i53 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %17 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i51, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %17) #3
  %cmp.i.i54 = icmp eq i8* %arrayidx.i.i53, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i54, label %_ZNSsD2Ev.exit64, label %if.then.i.i56, !prof !22

if.then.i.i56:                                    ; preds = %_ZNSsD2Ev.exit
  %_M_refcount.i.i55 = getelementptr inbounds i8, i8* %15, i64 -8
  %18 = bitcast i8* %_M_refcount.i.i55 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i57, label %if.else.i.i.i59

if.then.i.i.i57:                                  ; preds = %if.then.i.i56
  %19 = atomicrmw volatile add i32* %18, i32 -1 acq_rel
  br label %invoke.cont.i.i62

if.else.i.i.i59:                                  ; preds = %if.then.i.i56
  %20 = load i32, i32* %18, align 4, !tbaa !23
  %add.i.i.i.i58 = add nsw i32 %20, -1
  store i32 %add.i.i.i.i58, i32* %18, align 4, !tbaa !23
  br label %invoke.cont.i.i62

invoke.cont.i.i62:                                ; preds = %if.else.i.i.i59, %if.then.i.i.i57
  %retval.0.i.i.i60 = phi i32 [ %19, %if.then.i.i.i57 ], [ %20, %if.else.i.i.i59 ]
  %cmp3.i.i61 = icmp slt i32 %retval.0.i.i.i60, 1
  br i1 %cmp3.i.i61, label %if.then4.i.i63, label %_ZNSsD2Ev.exit64

if.then4.i.i63:                                   ; preds = %invoke.cont.i.i62
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %16, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i51) #3
  br label %_ZNSsD2Ev.exit64

_ZNSsD2Ev.exit64:                                 ; preds = %if.then4.i.i63, %invoke.cont.i.i62, %_ZNSsD2Ev.exit
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %17) #3
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %1) #3
  %_M_p.i.i.i66 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp, i64 0, i32 0, i32 0
  %21 = load i8*, i8** %_M_p.i.i.i66, align 8, !tbaa !17
  %arrayidx.i.i67 = getelementptr inbounds i8, i8* %21, i64 -24
  %22 = bitcast i8* %arrayidx.i.i67 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %23 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i65, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %23) #3
  %cmp.i.i68 = icmp eq i8* %arrayidx.i.i67, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i68, label %_ZNSsD2Ev.exit78, label %if.then.i.i70, !prof !22

if.then.i.i70:                                    ; preds = %_ZNSsD2Ev.exit64
  %_M_refcount.i.i69 = getelementptr inbounds i8, i8* %21, i64 -8
  %24 = bitcast i8* %_M_refcount.i.i69 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i71, label %if.else.i.i.i73

if.then.i.i.i71:                                  ; preds = %if.then.i.i70
  %25 = atomicrmw volatile add i32* %24, i32 -1 acq_rel
  br label %invoke.cont.i.i76

if.else.i.i.i73:                                  ; preds = %if.then.i.i70
  %26 = load i32, i32* %24, align 4, !tbaa !23
  %add.i.i.i.i72 = add nsw i32 %26, -1
  store i32 %add.i.i.i.i72, i32* %24, align 4, !tbaa !23
  br label %invoke.cont.i.i76

invoke.cont.i.i76:                                ; preds = %if.else.i.i.i73, %if.then.i.i.i71
  %retval.0.i.i.i74 = phi i32 [ %25, %if.then.i.i.i71 ], [ %26, %if.else.i.i.i73 ]
  %cmp3.i.i75 = icmp slt i32 %retval.0.i.i.i74, 1
  br i1 %cmp3.i.i75, label %if.then4.i.i77, label %_ZNSsD2Ev.exit78

if.then4.i.i77:                                   ; preds = %invoke.cont.i.i76
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %22, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i65) #3
  br label %_ZNSsD2Ev.exit78

_ZNSsD2Ev.exit78:                                 ; preds = %if.then4.i.i77, %invoke.cont.i.i76, %_ZNSsD2Ev.exit64
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %23) #3
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %0) #3
  br label %if.end

lpad:                                             ; preds = %if.then
  %27 = landingpad { i8*, i32 }
          cleanup
  %28 = extractvalue { i8*, i32 } %27, 0
  %29 = extractvalue { i8*, i32 } %27, 1
  br label %ehcleanup24

lpad7:                                            ; preds = %invoke.cont
  %30 = landingpad { i8*, i32 }
          cleanup
  %31 = extractvalue { i8*, i32 } %30, 0
  %32 = extractvalue { i8*, i32 } %30, 1
  br label %ehcleanup21

lpad11:                                           ; preds = %invoke.cont8
  %33 = landingpad { i8*, i32 }
          cleanup
  %34 = extractvalue { i8*, i32 } %33, 0
  %35 = extractvalue { i8*, i32 } %33, 1
  br label %ehcleanup

lpad13:                                           ; preds = %if.else.i48, %if.then.i47, %invoke.cont14, %invoke.cont12
  %36 = landingpad { i8*, i32 }
          cleanup
  %37 = extractvalue { i8*, i32 } %36, 0
  %38 = extractvalue { i8*, i32 } %36, 1
  %_M_p.i.i.i80 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp9, i64 0, i32 0, i32 0
  %39 = load i8*, i8** %_M_p.i.i.i80, align 8, !tbaa !17
  %arrayidx.i.i81 = getelementptr inbounds i8, i8* %39, i64 -24
  %40 = bitcast i8* %arrayidx.i.i81 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %41 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i79, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %41) #3
  %cmp.i.i82 = icmp eq i8* %arrayidx.i.i81, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i82, label %_ZNSsD2Ev.exit92, label %if.then.i.i84, !prof !22

if.then.i.i84:                                    ; preds = %lpad13
  %_M_refcount.i.i83 = getelementptr inbounds i8, i8* %39, i64 -8
  %42 = bitcast i8* %_M_refcount.i.i83 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i85, label %if.else.i.i.i87

if.then.i.i.i85:                                  ; preds = %if.then.i.i84
  %43 = atomicrmw volatile add i32* %42, i32 -1 acq_rel
  br label %invoke.cont.i.i90

if.else.i.i.i87:                                  ; preds = %if.then.i.i84
  %44 = load i32, i32* %42, align 4, !tbaa !23
  %add.i.i.i.i86 = add nsw i32 %44, -1
  store i32 %add.i.i.i.i86, i32* %42, align 4, !tbaa !23
  br label %invoke.cont.i.i90

invoke.cont.i.i90:                                ; preds = %if.else.i.i.i87, %if.then.i.i.i85
  %retval.0.i.i.i88 = phi i32 [ %43, %if.then.i.i.i85 ], [ %44, %if.else.i.i.i87 ]
  %cmp3.i.i89 = icmp slt i32 %retval.0.i.i.i88, 1
  br i1 %cmp3.i.i89, label %if.then4.i.i91, label %_ZNSsD2Ev.exit92

if.then4.i.i91:                                   ; preds = %invoke.cont.i.i90
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %40, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i79) #3
  br label %_ZNSsD2Ev.exit92

_ZNSsD2Ev.exit92:                                 ; preds = %if.then4.i.i91, %invoke.cont.i.i90, %lpad13
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %41) #3
  br label %ehcleanup

ehcleanup:                                        ; preds = %_ZNSsD2Ev.exit92, %lpad11
  %exn.slot.0 = phi i8* [ %37, %_ZNSsD2Ev.exit92 ], [ %34, %lpad11 ]
  %ehselector.slot.0 = phi i32 [ %38, %_ZNSsD2Ev.exit92 ], [ %35, %lpad11 ]
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %2) #3
  %_M_p.i.i.i97 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp5, i64 0, i32 0, i32 0
  %45 = load i8*, i8** %_M_p.i.i.i97, align 8, !tbaa !17
  %arrayidx.i.i98 = getelementptr inbounds i8, i8* %45, i64 -24
  %46 = bitcast i8* %arrayidx.i.i98 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %47 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i96, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %47) #3
  %cmp.i.i99 = icmp eq i8* %arrayidx.i.i98, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i99, label %_ZNSsD2Ev.exit109, label %if.then.i.i101, !prof !22

if.then.i.i101:                                   ; preds = %ehcleanup
  %_M_refcount.i.i100 = getelementptr inbounds i8, i8* %45, i64 -8
  %48 = bitcast i8* %_M_refcount.i.i100 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i102, label %if.else.i.i.i104

if.then.i.i.i102:                                 ; preds = %if.then.i.i101
  %49 = atomicrmw volatile add i32* %48, i32 -1 acq_rel
  br label %invoke.cont.i.i107

if.else.i.i.i104:                                 ; preds = %if.then.i.i101
  %50 = load i32, i32* %48, align 4, !tbaa !23
  %add.i.i.i.i103 = add nsw i32 %50, -1
  store i32 %add.i.i.i.i103, i32* %48, align 4, !tbaa !23
  br label %invoke.cont.i.i107

invoke.cont.i.i107:                               ; preds = %if.else.i.i.i104, %if.then.i.i.i102
  %retval.0.i.i.i105 = phi i32 [ %49, %if.then.i.i.i102 ], [ %50, %if.else.i.i.i104 ]
  %cmp3.i.i106 = icmp slt i32 %retval.0.i.i.i105, 1
  br i1 %cmp3.i.i106, label %if.then4.i.i108, label %_ZNSsD2Ev.exit109

if.then4.i.i108:                                  ; preds = %invoke.cont.i.i107
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %46, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i96) #3
  br label %_ZNSsD2Ev.exit109

_ZNSsD2Ev.exit109:                                ; preds = %if.then4.i.i108, %invoke.cont.i.i107, %ehcleanup
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %47) #3
  br label %ehcleanup21

ehcleanup21:                                      ; preds = %_ZNSsD2Ev.exit109, %lpad7
  %exn.slot.1 = phi i8* [ %exn.slot.0, %_ZNSsD2Ev.exit109 ], [ %31, %lpad7 ]
  %ehselector.slot.1 = phi i32 [ %ehselector.slot.0, %_ZNSsD2Ev.exit109 ], [ %32, %lpad7 ]
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %1) #3
  %_M_p.i.i.i111 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp, i64 0, i32 0, i32 0
  %51 = load i8*, i8** %_M_p.i.i.i111, align 8, !tbaa !17
  %arrayidx.i.i112 = getelementptr inbounds i8, i8* %51, i64 -24
  %52 = bitcast i8* %arrayidx.i.i112 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %53 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i110, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %53) #3
  %cmp.i.i113 = icmp eq i8* %arrayidx.i.i112, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i113, label %_ZNSsD2Ev.exit123, label %if.then.i.i115, !prof !22

if.then.i.i115:                                   ; preds = %ehcleanup21
  %_M_refcount.i.i114 = getelementptr inbounds i8, i8* %51, i64 -8
  %54 = bitcast i8* %_M_refcount.i.i114 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i116, label %if.else.i.i.i118

if.then.i.i.i116:                                 ; preds = %if.then.i.i115
  %55 = atomicrmw volatile add i32* %54, i32 -1 acq_rel
  br label %invoke.cont.i.i121

if.else.i.i.i118:                                 ; preds = %if.then.i.i115
  %56 = load i32, i32* %54, align 4, !tbaa !23
  %add.i.i.i.i117 = add nsw i32 %56, -1
  store i32 %add.i.i.i.i117, i32* %54, align 4, !tbaa !23
  br label %invoke.cont.i.i121

invoke.cont.i.i121:                               ; preds = %if.else.i.i.i118, %if.then.i.i.i116
  %retval.0.i.i.i119 = phi i32 [ %55, %if.then.i.i.i116 ], [ %56, %if.else.i.i.i118 ]
  %cmp3.i.i120 = icmp slt i32 %retval.0.i.i.i119, 1
  br i1 %cmp3.i.i120, label %if.then4.i.i122, label %_ZNSsD2Ev.exit123

if.then4.i.i122:                                  ; preds = %invoke.cont.i.i121
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %52, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i110) #3
  br label %_ZNSsD2Ev.exit123

_ZNSsD2Ev.exit123:                                ; preds = %if.then4.i.i122, %invoke.cont.i.i121, %ehcleanup21
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %53) #3
  br label %ehcleanup24

ehcleanup24:                                      ; preds = %_ZNSsD2Ev.exit123, %lpad
  %exn.slot.2 = phi i8* [ %exn.slot.1, %_ZNSsD2Ev.exit123 ], [ %28, %lpad ]
  %ehselector.slot.2 = phi i32 [ %ehselector.slot.1, %_ZNSsD2Ev.exit123 ], [ %29, %lpad ]
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %0) #3
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn.slot.2, 0
  %lpad.val40 = insertvalue { i8*, i32 } %lpad.val, i32 %ehselector.slot.2, 1
  resume { i8*, i32 } %lpad.val40

if.end:                                           ; preds = %_ZNSsD2Ev.exit78, %entry
  %call26 = call i32 @omp_get_thread_num() #3
  %idxprom27 = sext i32 %call26 to i64
  %_M_file.i.i136 = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f1, i64 0, i64 %idxprom27, i32 1, i32 2
  %call.i.i137 = call zeroext i1 @_ZNKSt12__basic_fileIcE7is_openEv(%"class.std::__basic_file"* nonnull %_M_file.i.i136) #17
  br i1 %call.i.i137, label %if.end31, label %if.then30

if.then30:                                        ; preds = %if.end
  call void @__assert_fail(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i64 0, i64 0), i32 77, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__PRETTY_FUNCTION__.printuBranch, i64 0, i64 0)) #18
  unreachable

if.end31:                                         ; preds = %if.end
  %call32 = call i32 @omp_get_thread_num() #3
  %idxprom33 = sext i32 %call32 to i64
  %arrayidx34 = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f1, i64 0, i64 %idxprom33
  %57 = bitcast %"class.std::basic_ofstream"* %arrayidx34 to %"class.std::basic_ostream"*
  %call1.i139 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %57, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11, i64 0, i64 0), i64 2)
  %tobool.i124 = icmp eq i8* %name, null
  br i1 %tobool.i124, label %if.then.i131, label %if.else.i134

if.then.i131:                                     ; preds = %if.end31
  %58 = bitcast %"class.std::basic_ofstream"* %arrayidx34 to i8**
  %vtable.i125 = load i8*, i8** %58, align 16, !tbaa !6
  %vbase.offset.ptr.i126 = getelementptr i8, i8* %vtable.i125, i64 -24
  %59 = bitcast i8* %vbase.offset.ptr.i126 to i64*
  %vbase.offset.i127 = load i64, i64* %59, align 8
  %60 = bitcast %"class.std::basic_ofstream"* %arrayidx34 to i8*
  %add.ptr.i128 = getelementptr inbounds i8, i8* %60, i64 %vbase.offset.i127
  %61 = bitcast i8* %add.ptr.i128 to %"class.std::basic_ios"*
  %_M_streambuf_state.i.i.i129 = getelementptr inbounds i8, i8* %add.ptr.i128, i64 32
  %62 = bitcast i8* %_M_streambuf_state.i.i.i129 to i32*
  %63 = load i32, i32* %62, align 8, !tbaa !8
  %or.i.i.i130 = or i32 %63, 1
  call void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %61, i32 %or.i.i.i130)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit135

if.else.i134:                                     ; preds = %if.end31
  %call.i.i132 = call i64 @strlen(i8* nonnull %name) #3
  %call1.i133 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %57, i8* nonnull %name, i64 %call.i.i132)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit135

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit135: ; preds = %if.else.i134, %if.then.i131
  %call1.i94 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %57, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %tobool.i = icmp eq i8* %n1, null
  br i1 %tobool.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit135
  %64 = bitcast %"class.std::basic_ofstream"* %arrayidx34 to i8**
  %vtable.i = load i8*, i8** %64, align 16, !tbaa !6
  %vbase.offset.ptr.i = getelementptr i8, i8* %vtable.i, i64 -24
  %65 = bitcast i8* %vbase.offset.ptr.i to i64*
  %vbase.offset.i = load i64, i64* %65, align 8
  %66 = bitcast %"class.std::basic_ofstream"* %arrayidx34 to i8*
  %add.ptr.i = getelementptr inbounds i8, i8* %66, i64 %vbase.offset.i
  %67 = bitcast i8* %add.ptr.i to %"class.std::basic_ios"*
  %_M_streambuf_state.i.i.i = getelementptr inbounds i8, i8* %add.ptr.i, i64 32
  %68 = bitcast i8* %_M_streambuf_state.i.i.i to i32*
  %69 = load i32, i32* %68, align 8, !tbaa !8
  %or.i.i.i = or i32 %69, 1
  call void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %67, i32 %or.i.i.i)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit

if.else.i:                                        ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit135
  %call.i.i42 = call i64 @strlen(i8* nonnull %n1) #3
  %call1.i43 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %57, i8* nonnull %n1, i64 %call.i.i42)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit: ; preds = %if.else.i, %if.then.i
  %call1.i = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %57, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0), i64 1)
  ret void
}

; Function Attrs: noinline uwtable
define dso_local void @printMem(i8* %name, i8* %kernel_type, i8* %run_dir, i1 zeroext %type, i64 %addr, i32 %size) #6 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %ref.tmp.i129 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i115 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i98 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i84 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i70 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i = alloca %"class.std::ios_base::Init", align 1
  %agg.tmp = alloca %"class.std::basic_string", align 8
  %ref.tmp = alloca %"class.std::ios_base::Init", align 1
  %agg.tmp9 = alloca %"class.std::basic_string", align 8
  %ref.tmp10 = alloca %"class.std::ios_base::Init", align 1
  %agg.tmp13 = alloca %"class.std::basic_string", align 8
  %ref.tmp14 = alloca %"class.std::ios_base::Init", align 1
  %0 = load i8, i8* @expert_mode, align 1, !tbaa !2, !range !24
  %tobool = icmp eq i8 %0, 0
  br i1 %tobool, label %if.then, label %if.end2

if.then:                                          ; preds = %entry
  %1 = load i64, i64* @remaining_mem_accesses, align 8, !tbaa !25
  %cmp = icmp slt i64 %1, 1
  br i1 %cmp, label %if.then1, label %if.end

if.then1:                                         ; preds = %if.then
  %call = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.12, i64 0, i64 0))
  tail call void @__assert_fail(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i64 0, i64 0), i32 90, i8* getelementptr inbounds ([60 x i8], [60 x i8]* @__PRETTY_FUNCTION__.printMem, i64 0, i64 0)) #18
  unreachable

if.end:                                           ; preds = %if.then
  %dec = add nsw i64 %1, -1
  store i64 %dec, i64* @remaining_mem_accesses, align 8, !tbaa !25
  br label %if.end2

if.end2:                                          ; preds = %if.end, %entry
  %call3 = tail call i32 @omp_get_thread_num() #3
  %idxprom = sext i32 %call3 to i64
  %_M_file.i.i = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f2, i64 0, i64 %idxprom, i32 1, i32 2
  %call.i.i = tail call zeroext i1 @_ZNKSt12__basic_fileIcE7is_openEv(%"class.std::__basic_file"* nonnull %_M_file.i.i) #17
  br i1 %call.i.i, label %if.end30, label %if.then5

if.then5:                                         ; preds = %if.end2
  %call6 = tail call i32 @omp_get_thread_num() #3
  %idxprom7 = sext i32 %call6 to i64
  %arrayidx8 = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f2, i64 0, i64 %idxprom7
  %2 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %2) #3
  invoke void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* nonnull %agg.tmp, i8* %run_dir, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.then5
  %3 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp10, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %3) #3
  invoke void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* nonnull %agg.tmp9, i8* %kernel_type, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp10)
          to label %invoke.cont12 unwind label %lpad11

invoke.cont12:                                    ; preds = %invoke.cont
  %4 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp14, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %4) #3
  invoke void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* nonnull %agg.tmp13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.13, i64 0, i64 0), %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp14)
          to label %invoke.cont16 unwind label %lpad15

invoke.cont16:                                    ; preds = %invoke.cont12
  %call19 = invoke i8* @_Z12get_dir_nameSsSsSs(%"class.std::basic_string"* nonnull %agg.tmp, %"class.std::basic_string"* nonnull %agg.tmp9, %"class.std::basic_string"* nonnull %agg.tmp13)
          to label %invoke.cont18 unwind label %lpad17

invoke.cont18:                                    ; preds = %invoke.cont16
  %_M_filebuf.i = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f2, i64 0, i64 %idxprom7, i32 1
  %call2.i68 = invoke %"class.std::basic_filebuf"* @_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode(%"class.std::basic_filebuf"* nonnull %_M_filebuf.i, i8* %call19, i32 17)
          to label %call2.i.noexc unwind label %lpad17

call2.i.noexc:                                    ; preds = %invoke.cont18
  %tobool.i = icmp eq %"class.std::basic_filebuf"* %call2.i68, null
  %5 = bitcast %"class.std::basic_ofstream"* %arrayidx8 to i8**
  %vtable3.i = load i8*, i8** %5, align 16, !tbaa !6
  %vbase.offset.ptr4.i = getelementptr i8, i8* %vtable3.i, i64 -24
  %6 = bitcast i8* %vbase.offset.ptr4.i to i64*
  %vbase.offset5.i = load i64, i64* %6, align 8
  %7 = bitcast %"class.std::basic_ofstream"* %arrayidx8 to i8*
  %add.ptr6.i = getelementptr inbounds i8, i8* %7, i64 %vbase.offset5.i
  %8 = bitcast i8* %add.ptr6.i to %"class.std::basic_ios"*
  br i1 %tobool.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %call2.i.noexc
  %_M_streambuf_state.i.i.i = getelementptr inbounds i8, i8* %add.ptr6.i, i64 32
  %9 = bitcast i8* %_M_streambuf_state.i.i.i to i32*
  %10 = load i32, i32* %9, align 8, !tbaa !8
  %or.i.i.i = or i32 %10, 4
  invoke void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %8, i32 %or.i.i.i)
          to label %invoke.cont22 unwind label %lpad17

if.else.i:                                        ; preds = %call2.i.noexc
  invoke void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %8, i32 0)
          to label %invoke.cont22 unwind label %lpad17

invoke.cont22:                                    ; preds = %if.else.i, %if.then.i
  %_M_p.i.i.i = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp13, i64 0, i32 0, i32 0
  %11 = load i8*, i8** %_M_p.i.i.i, align 8, !tbaa !17
  %arrayidx.i.i = getelementptr inbounds i8, i8* %11, i64 -24
  %12 = bitcast i8* %arrayidx.i.i to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %13 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %13) #3
  %cmp.i.i = icmp eq i8* %arrayidx.i.i, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i, label %_ZNSsD2Ev.exit, label %if.then.i.i, !prof !22

if.then.i.i:                                      ; preds = %invoke.cont22
  %_M_refcount.i.i = getelementptr inbounds i8, i8* %11, i64 -8
  %14 = bitcast i8* %_M_refcount.i.i to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i, label %if.else.i.i.i

if.then.i.i.i:                                    ; preds = %if.then.i.i
  %15 = atomicrmw volatile add i32* %14, i32 -1 acq_rel
  br label %invoke.cont.i.i

if.else.i.i.i:                                    ; preds = %if.then.i.i
  %16 = load i32, i32* %14, align 4, !tbaa !23
  %add.i.i.i.i = add nsw i32 %16, -1
  store i32 %add.i.i.i.i, i32* %14, align 4, !tbaa !23
  br label %invoke.cont.i.i

invoke.cont.i.i:                                  ; preds = %if.else.i.i.i, %if.then.i.i.i
  %retval.0.i.i.i = phi i32 [ %15, %if.then.i.i.i ], [ %16, %if.else.i.i.i ]
  %cmp3.i.i = icmp slt i32 %retval.0.i.i.i, 1
  br i1 %cmp3.i.i, label %if.then4.i.i, label %_ZNSsD2Ev.exit

if.then4.i.i:                                     ; preds = %invoke.cont.i.i
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %12, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i) #3
  br label %_ZNSsD2Ev.exit

_ZNSsD2Ev.exit:                                   ; preds = %if.then4.i.i, %invoke.cont.i.i, %invoke.cont22
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %13) #3
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %4) #3
  %_M_p.i.i.i71 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp9, i64 0, i32 0, i32 0
  %17 = load i8*, i8** %_M_p.i.i.i71, align 8, !tbaa !17
  %arrayidx.i.i72 = getelementptr inbounds i8, i8* %17, i64 -24
  %18 = bitcast i8* %arrayidx.i.i72 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %19 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i70, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %19) #3
  %cmp.i.i73 = icmp eq i8* %arrayidx.i.i72, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i73, label %_ZNSsD2Ev.exit83, label %if.then.i.i75, !prof !22

if.then.i.i75:                                    ; preds = %_ZNSsD2Ev.exit
  %_M_refcount.i.i74 = getelementptr inbounds i8, i8* %17, i64 -8
  %20 = bitcast i8* %_M_refcount.i.i74 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i76, label %if.else.i.i.i78

if.then.i.i.i76:                                  ; preds = %if.then.i.i75
  %21 = atomicrmw volatile add i32* %20, i32 -1 acq_rel
  br label %invoke.cont.i.i81

if.else.i.i.i78:                                  ; preds = %if.then.i.i75
  %22 = load i32, i32* %20, align 4, !tbaa !23
  %add.i.i.i.i77 = add nsw i32 %22, -1
  store i32 %add.i.i.i.i77, i32* %20, align 4, !tbaa !23
  br label %invoke.cont.i.i81

invoke.cont.i.i81:                                ; preds = %if.else.i.i.i78, %if.then.i.i.i76
  %retval.0.i.i.i79 = phi i32 [ %21, %if.then.i.i.i76 ], [ %22, %if.else.i.i.i78 ]
  %cmp3.i.i80 = icmp slt i32 %retval.0.i.i.i79, 1
  br i1 %cmp3.i.i80, label %if.then4.i.i82, label %_ZNSsD2Ev.exit83

if.then4.i.i82:                                   ; preds = %invoke.cont.i.i81
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %18, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i70) #3
  br label %_ZNSsD2Ev.exit83

_ZNSsD2Ev.exit83:                                 ; preds = %if.then4.i.i82, %invoke.cont.i.i81, %_ZNSsD2Ev.exit
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %19) #3
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %3) #3
  %_M_p.i.i.i85 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp, i64 0, i32 0, i32 0
  %23 = load i8*, i8** %_M_p.i.i.i85, align 8, !tbaa !17
  %arrayidx.i.i86 = getelementptr inbounds i8, i8* %23, i64 -24
  %24 = bitcast i8* %arrayidx.i.i86 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %25 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i84, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %25) #3
  %cmp.i.i87 = icmp eq i8* %arrayidx.i.i86, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i87, label %_ZNSsD2Ev.exit97, label %if.then.i.i89, !prof !22

if.then.i.i89:                                    ; preds = %_ZNSsD2Ev.exit83
  %_M_refcount.i.i88 = getelementptr inbounds i8, i8* %23, i64 -8
  %26 = bitcast i8* %_M_refcount.i.i88 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i90, label %if.else.i.i.i92

if.then.i.i.i90:                                  ; preds = %if.then.i.i89
  %27 = atomicrmw volatile add i32* %26, i32 -1 acq_rel
  br label %invoke.cont.i.i95

if.else.i.i.i92:                                  ; preds = %if.then.i.i89
  %28 = load i32, i32* %26, align 4, !tbaa !23
  %add.i.i.i.i91 = add nsw i32 %28, -1
  store i32 %add.i.i.i.i91, i32* %26, align 4, !tbaa !23
  br label %invoke.cont.i.i95

invoke.cont.i.i95:                                ; preds = %if.else.i.i.i92, %if.then.i.i.i90
  %retval.0.i.i.i93 = phi i32 [ %27, %if.then.i.i.i90 ], [ %28, %if.else.i.i.i92 ]
  %cmp3.i.i94 = icmp slt i32 %retval.0.i.i.i93, 1
  br i1 %cmp3.i.i94, label %if.then4.i.i96, label %_ZNSsD2Ev.exit97

if.then4.i.i96:                                   ; preds = %invoke.cont.i.i95
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %24, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i84) #3
  br label %_ZNSsD2Ev.exit97

_ZNSsD2Ev.exit97:                                 ; preds = %if.then4.i.i96, %invoke.cont.i.i95, %_ZNSsD2Ev.exit83
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %25) #3
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %2) #3
  br label %if.end30

lpad:                                             ; preds = %if.then5
  %29 = landingpad { i8*, i32 }
          cleanup
  %30 = extractvalue { i8*, i32 } %29, 0
  %31 = extractvalue { i8*, i32 } %29, 1
  br label %ehcleanup28

lpad11:                                           ; preds = %invoke.cont
  %32 = landingpad { i8*, i32 }
          cleanup
  %33 = extractvalue { i8*, i32 } %32, 0
  %34 = extractvalue { i8*, i32 } %32, 1
  br label %ehcleanup25

lpad15:                                           ; preds = %invoke.cont12
  %35 = landingpad { i8*, i32 }
          cleanup
  %36 = extractvalue { i8*, i32 } %35, 0
  %37 = extractvalue { i8*, i32 } %35, 1
  br label %ehcleanup

lpad17:                                           ; preds = %if.else.i, %if.then.i, %invoke.cont18, %invoke.cont16
  %38 = landingpad { i8*, i32 }
          cleanup
  %39 = extractvalue { i8*, i32 } %38, 0
  %40 = extractvalue { i8*, i32 } %38, 1
  %_M_p.i.i.i99 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp13, i64 0, i32 0, i32 0
  %41 = load i8*, i8** %_M_p.i.i.i99, align 8, !tbaa !17
  %arrayidx.i.i100 = getelementptr inbounds i8, i8* %41, i64 -24
  %42 = bitcast i8* %arrayidx.i.i100 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %43 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i98, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %43) #3
  %cmp.i.i101 = icmp eq i8* %arrayidx.i.i100, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i101, label %_ZNSsD2Ev.exit111, label %if.then.i.i103, !prof !22

if.then.i.i103:                                   ; preds = %lpad17
  %_M_refcount.i.i102 = getelementptr inbounds i8, i8* %41, i64 -8
  %44 = bitcast i8* %_M_refcount.i.i102 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i104, label %if.else.i.i.i106

if.then.i.i.i104:                                 ; preds = %if.then.i.i103
  %45 = atomicrmw volatile add i32* %44, i32 -1 acq_rel
  br label %invoke.cont.i.i109

if.else.i.i.i106:                                 ; preds = %if.then.i.i103
  %46 = load i32, i32* %44, align 4, !tbaa !23
  %add.i.i.i.i105 = add nsw i32 %46, -1
  store i32 %add.i.i.i.i105, i32* %44, align 4, !tbaa !23
  br label %invoke.cont.i.i109

invoke.cont.i.i109:                               ; preds = %if.else.i.i.i106, %if.then.i.i.i104
  %retval.0.i.i.i107 = phi i32 [ %45, %if.then.i.i.i104 ], [ %46, %if.else.i.i.i106 ]
  %cmp3.i.i108 = icmp slt i32 %retval.0.i.i.i107, 1
  br i1 %cmp3.i.i108, label %if.then4.i.i110, label %_ZNSsD2Ev.exit111

if.then4.i.i110:                                  ; preds = %invoke.cont.i.i109
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %42, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i98) #3
  br label %_ZNSsD2Ev.exit111

_ZNSsD2Ev.exit111:                                ; preds = %if.then4.i.i110, %invoke.cont.i.i109, %lpad17
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %43) #3
  br label %ehcleanup

ehcleanup:                                        ; preds = %_ZNSsD2Ev.exit111, %lpad15
  %exn.slot.0 = phi i8* [ %39, %_ZNSsD2Ev.exit111 ], [ %36, %lpad15 ]
  %ehselector.slot.0 = phi i32 [ %40, %_ZNSsD2Ev.exit111 ], [ %37, %lpad15 ]
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %4) #3
  %_M_p.i.i.i116 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp9, i64 0, i32 0, i32 0
  %47 = load i8*, i8** %_M_p.i.i.i116, align 8, !tbaa !17
  %arrayidx.i.i117 = getelementptr inbounds i8, i8* %47, i64 -24
  %48 = bitcast i8* %arrayidx.i.i117 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %49 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i115, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %49) #3
  %cmp.i.i118 = icmp eq i8* %arrayidx.i.i117, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i118, label %_ZNSsD2Ev.exit128, label %if.then.i.i120, !prof !22

if.then.i.i120:                                   ; preds = %ehcleanup
  %_M_refcount.i.i119 = getelementptr inbounds i8, i8* %47, i64 -8
  %50 = bitcast i8* %_M_refcount.i.i119 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i121, label %if.else.i.i.i123

if.then.i.i.i121:                                 ; preds = %if.then.i.i120
  %51 = atomicrmw volatile add i32* %50, i32 -1 acq_rel
  br label %invoke.cont.i.i126

if.else.i.i.i123:                                 ; preds = %if.then.i.i120
  %52 = load i32, i32* %50, align 4, !tbaa !23
  %add.i.i.i.i122 = add nsw i32 %52, -1
  store i32 %add.i.i.i.i122, i32* %50, align 4, !tbaa !23
  br label %invoke.cont.i.i126

invoke.cont.i.i126:                               ; preds = %if.else.i.i.i123, %if.then.i.i.i121
  %retval.0.i.i.i124 = phi i32 [ %51, %if.then.i.i.i121 ], [ %52, %if.else.i.i.i123 ]
  %cmp3.i.i125 = icmp slt i32 %retval.0.i.i.i124, 1
  br i1 %cmp3.i.i125, label %if.then4.i.i127, label %_ZNSsD2Ev.exit128

if.then4.i.i127:                                  ; preds = %invoke.cont.i.i126
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %48, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i115) #3
  br label %_ZNSsD2Ev.exit128

_ZNSsD2Ev.exit128:                                ; preds = %if.then4.i.i127, %invoke.cont.i.i126, %ehcleanup
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %49) #3
  br label %ehcleanup25

ehcleanup25:                                      ; preds = %_ZNSsD2Ev.exit128, %lpad11
  %exn.slot.1 = phi i8* [ %exn.slot.0, %_ZNSsD2Ev.exit128 ], [ %33, %lpad11 ]
  %ehselector.slot.1 = phi i32 [ %ehselector.slot.0, %_ZNSsD2Ev.exit128 ], [ %34, %lpad11 ]
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %3) #3
  %_M_p.i.i.i130 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp, i64 0, i32 0, i32 0
  %53 = load i8*, i8** %_M_p.i.i.i130, align 8, !tbaa !17
  %arrayidx.i.i131 = getelementptr inbounds i8, i8* %53, i64 -24
  %54 = bitcast i8* %arrayidx.i.i131 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %55 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i129, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %55) #3
  %cmp.i.i132 = icmp eq i8* %arrayidx.i.i131, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i132, label %_ZNSsD2Ev.exit142, label %if.then.i.i134, !prof !22

if.then.i.i134:                                   ; preds = %ehcleanup25
  %_M_refcount.i.i133 = getelementptr inbounds i8, i8* %53, i64 -8
  %56 = bitcast i8* %_M_refcount.i.i133 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i135, label %if.else.i.i.i137

if.then.i.i.i135:                                 ; preds = %if.then.i.i134
  %57 = atomicrmw volatile add i32* %56, i32 -1 acq_rel
  br label %invoke.cont.i.i140

if.else.i.i.i137:                                 ; preds = %if.then.i.i134
  %58 = load i32, i32* %56, align 4, !tbaa !23
  %add.i.i.i.i136 = add nsw i32 %58, -1
  store i32 %add.i.i.i.i136, i32* %56, align 4, !tbaa !23
  br label %invoke.cont.i.i140

invoke.cont.i.i140:                               ; preds = %if.else.i.i.i137, %if.then.i.i.i135
  %retval.0.i.i.i138 = phi i32 [ %57, %if.then.i.i.i135 ], [ %58, %if.else.i.i.i137 ]
  %cmp3.i.i139 = icmp slt i32 %retval.0.i.i.i138, 1
  br i1 %cmp3.i.i139, label %if.then4.i.i141, label %_ZNSsD2Ev.exit142

if.then4.i.i141:                                  ; preds = %invoke.cont.i.i140
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %54, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i129) #3
  br label %_ZNSsD2Ev.exit142

_ZNSsD2Ev.exit142:                                ; preds = %if.then4.i.i141, %invoke.cont.i.i140, %ehcleanup25
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %55) #3
  br label %ehcleanup28

ehcleanup28:                                      ; preds = %_ZNSsD2Ev.exit142, %lpad
  %exn.slot.2 = phi i8* [ %exn.slot.1, %_ZNSsD2Ev.exit142 ], [ %30, %lpad ]
  %ehselector.slot.2 = phi i32 [ %ehselector.slot.1, %_ZNSsD2Ev.exit142 ], [ %31, %lpad ]
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %2) #3
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn.slot.2, 0
  %lpad.val60 = insertvalue { i8*, i32 } %lpad.val, i32 %ehselector.slot.2, 1
  resume { i8*, i32 } %lpad.val60

if.end30:                                         ; preds = %_ZNSsD2Ev.exit97, %if.end2
  %call48 = call i32 @omp_get_thread_num() #3
  %idxprom49 = sext i32 %call48 to i64
  %arrayidx50 = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f2, i64 0, i64 %idxprom49
  %59 = bitcast %"class.std::basic_ofstream"* %arrayidx50 to %"class.std::basic_ostream"*
  br i1 %type, label %if.then47, label %if.then33

if.then33:                                        ; preds = %if.end30
  %call1.i151 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %59, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.14, i64 0, i64 0), i64 2)
  %tobool.i153 = icmp eq i8* %name, null
  br i1 %tobool.i153, label %if.then.i160, label %if.else.i163

if.then.i160:                                     ; preds = %if.then33
  %60 = bitcast %"class.std::basic_ofstream"* %arrayidx50 to i8**
  %vtable.i154 = load i8*, i8** %60, align 16, !tbaa !6
  %vbase.offset.ptr.i155 = getelementptr i8, i8* %vtable.i154, i64 -24
  %61 = bitcast i8* %vbase.offset.ptr.i155 to i64*
  %vbase.offset.i156 = load i64, i64* %61, align 8
  %62 = bitcast %"class.std::basic_ofstream"* %arrayidx50 to i8*
  %add.ptr.i157 = getelementptr inbounds i8, i8* %62, i64 %vbase.offset.i156
  %63 = bitcast i8* %add.ptr.i157 to %"class.std::basic_ios"*
  %_M_streambuf_state.i.i.i158 = getelementptr inbounds i8, i8* %add.ptr.i157, i64 32
  %64 = bitcast i8* %_M_streambuf_state.i.i.i158 to i32*
  %65 = load i32, i32* %64, align 8, !tbaa !8
  %or.i.i.i159 = or i32 %65, 1
  call void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %63, i32 %or.i.i.i159)
  br label %if.end59

if.else.i163:                                     ; preds = %if.then33
  %call.i.i161 = call i64 @strlen(i8* nonnull %name) #3
  %call1.i162 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %59, i8* nonnull %name, i64 %call.i.i161)
  br label %if.end59

if.then47:                                        ; preds = %if.end30
  %call1.i176 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %59, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.15, i64 0, i64 0), i64 2)
  %tobool.i143 = icmp eq i8* %name, null
  br i1 %tobool.i143, label %if.then.i146, label %if.else.i149

if.then.i146:                                     ; preds = %if.then47
  %66 = bitcast %"class.std::basic_ofstream"* %arrayidx50 to i8**
  %vtable.i = load i8*, i8** %66, align 16, !tbaa !6
  %vbase.offset.ptr.i = getelementptr i8, i8* %vtable.i, i64 -24
  %67 = bitcast i8* %vbase.offset.ptr.i to i64*
  %vbase.offset.i = load i64, i64* %67, align 8
  %68 = bitcast %"class.std::basic_ofstream"* %arrayidx50 to i8*
  %add.ptr.i = getelementptr inbounds i8, i8* %68, i64 %vbase.offset.i
  %69 = bitcast i8* %add.ptr.i to %"class.std::basic_ios"*
  %_M_streambuf_state.i.i.i144 = getelementptr inbounds i8, i8* %add.ptr.i, i64 32
  %70 = bitcast i8* %_M_streambuf_state.i.i.i144 to i32*
  %71 = load i32, i32* %70, align 8, !tbaa !8
  %or.i.i.i145 = or i32 %71, 1
  call void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %69, i32 %or.i.i.i145)
  br label %if.end59

if.else.i149:                                     ; preds = %if.then47
  %call.i.i147 = call i64 @strlen(i8* nonnull %name) #3
  %call1.i148 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %59, i8* nonnull %name, i64 %call.i.i147)
  br label %if.end59

if.end59:                                         ; preds = %if.else.i149, %if.then.i146, %if.else.i163, %if.then.i160
  %call1.i113 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %59, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %call.i = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIxEERSoT_(%"class.std::basic_ostream"* nonnull %59, i64 %addr)
  %call1.i67 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call.i, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %call56 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull %call.i, i32 %size)
  %call1.i = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call56, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0), i64 1)
  ret void
}

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIxEERSoT_(%"class.std::basic_ostream"*, i64) local_unnamed_addr #1

; Function Attrs: noinline uwtable
define dso_local void @print_matmul(i8* %acc_kernel_name, i8* %kernel_type, i8* %run_dir, i8* %node_id, i32 %rowsA, i32 %colsA, i32 %rowsB, i32 %colsB, i32 %batch_size) #6 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %ref.tmp.i111 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i94 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i80 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i63 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i49 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i = alloca %"class.std::ios_base::Init", align 1
  %agg.tmp = alloca %"class.std::basic_string", align 8
  %ref.tmp = alloca %"class.std::ios_base::Init", align 1
  %agg.tmp5 = alloca %"class.std::basic_string", align 8
  %ref.tmp6 = alloca %"class.std::ios_base::Init", align 1
  %agg.tmp9 = alloca %"class.std::basic_string", align 8
  %ref.tmp10 = alloca %"class.std::ios_base::Init", align 1
  %call = tail call i32 @omp_get_thread_num() #3
  %idxprom = sext i32 %call to i64
  %_M_file.i.i = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f3, i64 0, i64 %idxprom, i32 1, i32 2
  %call.i.i = tail call zeroext i1 @_ZNKSt12__basic_fileIcE7is_openEv(%"class.std::__basic_file"* nonnull %_M_file.i.i) #17
  br i1 %call.i.i, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call2 = tail call i32 @omp_get_thread_num() #3
  %idxprom3 = sext i32 %call2 to i64
  %arrayidx4 = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f3, i64 0, i64 %idxprom3
  %0 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %0) #3
  invoke void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* nonnull %agg.tmp, i8* %run_dir, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.then
  %1 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp6, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %1) #3
  invoke void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* nonnull %agg.tmp5, i8* %kernel_type, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp6)
          to label %invoke.cont8 unwind label %lpad7

invoke.cont8:                                     ; preds = %invoke.cont
  %2 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp10, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %2) #3
  invoke void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* nonnull %agg.tmp9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.16, i64 0, i64 0), %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp10)
          to label %invoke.cont12 unwind label %lpad11

invoke.cont12:                                    ; preds = %invoke.cont8
  %call15 = invoke i8* @_Z12get_dir_nameSsSsSs(%"class.std::basic_string"* nonnull %agg.tmp, %"class.std::basic_string"* nonnull %agg.tmp5, %"class.std::basic_string"* nonnull %agg.tmp9)
          to label %invoke.cont14 unwind label %lpad13

invoke.cont14:                                    ; preds = %invoke.cont12
  %_M_filebuf.i = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f3, i64 0, i64 %idxprom3, i32 1
  %call2.i47 = invoke %"class.std::basic_filebuf"* @_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode(%"class.std::basic_filebuf"* nonnull %_M_filebuf.i, i8* %call15, i32 17)
          to label %call2.i.noexc unwind label %lpad13

call2.i.noexc:                                    ; preds = %invoke.cont14
  %tobool.i = icmp eq %"class.std::basic_filebuf"* %call2.i47, null
  %3 = bitcast %"class.std::basic_ofstream"* %arrayidx4 to i8**
  %vtable3.i = load i8*, i8** %3, align 16, !tbaa !6
  %vbase.offset.ptr4.i = getelementptr i8, i8* %vtable3.i, i64 -24
  %4 = bitcast i8* %vbase.offset.ptr4.i to i64*
  %vbase.offset5.i = load i64, i64* %4, align 8
  %5 = bitcast %"class.std::basic_ofstream"* %arrayidx4 to i8*
  %add.ptr6.i = getelementptr inbounds i8, i8* %5, i64 %vbase.offset5.i
  %6 = bitcast i8* %add.ptr6.i to %"class.std::basic_ios"*
  br i1 %tobool.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %call2.i.noexc
  %_M_streambuf_state.i.i.i = getelementptr inbounds i8, i8* %add.ptr6.i, i64 32
  %7 = bitcast i8* %_M_streambuf_state.i.i.i to i32*
  %8 = load i32, i32* %7, align 8, !tbaa !8
  %or.i.i.i = or i32 %8, 4
  invoke void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %6, i32 %or.i.i.i)
          to label %invoke.cont18 unwind label %lpad13

if.else.i:                                        ; preds = %call2.i.noexc
  invoke void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %6, i32 0)
          to label %invoke.cont18 unwind label %lpad13

invoke.cont18:                                    ; preds = %if.else.i, %if.then.i
  %_M_p.i.i.i = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp9, i64 0, i32 0, i32 0
  %9 = load i8*, i8** %_M_p.i.i.i, align 8, !tbaa !17
  %arrayidx.i.i = getelementptr inbounds i8, i8* %9, i64 -24
  %10 = bitcast i8* %arrayidx.i.i to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %11 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %11) #3
  %cmp.i.i = icmp eq i8* %arrayidx.i.i, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i, label %_ZNSsD2Ev.exit, label %if.then.i.i, !prof !22

if.then.i.i:                                      ; preds = %invoke.cont18
  %_M_refcount.i.i = getelementptr inbounds i8, i8* %9, i64 -8
  %12 = bitcast i8* %_M_refcount.i.i to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i, label %if.else.i.i.i

if.then.i.i.i:                                    ; preds = %if.then.i.i
  %13 = atomicrmw volatile add i32* %12, i32 -1 acq_rel
  br label %invoke.cont.i.i

if.else.i.i.i:                                    ; preds = %if.then.i.i
  %14 = load i32, i32* %12, align 4, !tbaa !23
  %add.i.i.i.i = add nsw i32 %14, -1
  store i32 %add.i.i.i.i, i32* %12, align 4, !tbaa !23
  br label %invoke.cont.i.i

invoke.cont.i.i:                                  ; preds = %if.else.i.i.i, %if.then.i.i.i
  %retval.0.i.i.i = phi i32 [ %13, %if.then.i.i.i ], [ %14, %if.else.i.i.i ]
  %cmp3.i.i = icmp slt i32 %retval.0.i.i.i, 1
  br i1 %cmp3.i.i, label %if.then4.i.i, label %_ZNSsD2Ev.exit

if.then4.i.i:                                     ; preds = %invoke.cont.i.i
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %10, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i) #3
  br label %_ZNSsD2Ev.exit

_ZNSsD2Ev.exit:                                   ; preds = %if.then4.i.i, %invoke.cont.i.i, %invoke.cont18
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %11) #3
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %2) #3
  %_M_p.i.i.i50 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp5, i64 0, i32 0, i32 0
  %15 = load i8*, i8** %_M_p.i.i.i50, align 8, !tbaa !17
  %arrayidx.i.i51 = getelementptr inbounds i8, i8* %15, i64 -24
  %16 = bitcast i8* %arrayidx.i.i51 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %17 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i49, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %17) #3
  %cmp.i.i52 = icmp eq i8* %arrayidx.i.i51, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i52, label %_ZNSsD2Ev.exit62, label %if.then.i.i54, !prof !22

if.then.i.i54:                                    ; preds = %_ZNSsD2Ev.exit
  %_M_refcount.i.i53 = getelementptr inbounds i8, i8* %15, i64 -8
  %18 = bitcast i8* %_M_refcount.i.i53 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i55, label %if.else.i.i.i57

if.then.i.i.i55:                                  ; preds = %if.then.i.i54
  %19 = atomicrmw volatile add i32* %18, i32 -1 acq_rel
  br label %invoke.cont.i.i60

if.else.i.i.i57:                                  ; preds = %if.then.i.i54
  %20 = load i32, i32* %18, align 4, !tbaa !23
  %add.i.i.i.i56 = add nsw i32 %20, -1
  store i32 %add.i.i.i.i56, i32* %18, align 4, !tbaa !23
  br label %invoke.cont.i.i60

invoke.cont.i.i60:                                ; preds = %if.else.i.i.i57, %if.then.i.i.i55
  %retval.0.i.i.i58 = phi i32 [ %19, %if.then.i.i.i55 ], [ %20, %if.else.i.i.i57 ]
  %cmp3.i.i59 = icmp slt i32 %retval.0.i.i.i58, 1
  br i1 %cmp3.i.i59, label %if.then4.i.i61, label %_ZNSsD2Ev.exit62

if.then4.i.i61:                                   ; preds = %invoke.cont.i.i60
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %16, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i49) #3
  br label %_ZNSsD2Ev.exit62

_ZNSsD2Ev.exit62:                                 ; preds = %if.then4.i.i61, %invoke.cont.i.i60, %_ZNSsD2Ev.exit
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %17) #3
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %1) #3
  %_M_p.i.i.i64 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp, i64 0, i32 0, i32 0
  %21 = load i8*, i8** %_M_p.i.i.i64, align 8, !tbaa !17
  %arrayidx.i.i65 = getelementptr inbounds i8, i8* %21, i64 -24
  %22 = bitcast i8* %arrayidx.i.i65 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %23 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i63, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %23) #3
  %cmp.i.i66 = icmp eq i8* %arrayidx.i.i65, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i66, label %_ZNSsD2Ev.exit76, label %if.then.i.i68, !prof !22

if.then.i.i68:                                    ; preds = %_ZNSsD2Ev.exit62
  %_M_refcount.i.i67 = getelementptr inbounds i8, i8* %21, i64 -8
  %24 = bitcast i8* %_M_refcount.i.i67 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i69, label %if.else.i.i.i71

if.then.i.i.i69:                                  ; preds = %if.then.i.i68
  %25 = atomicrmw volatile add i32* %24, i32 -1 acq_rel
  br label %invoke.cont.i.i74

if.else.i.i.i71:                                  ; preds = %if.then.i.i68
  %26 = load i32, i32* %24, align 4, !tbaa !23
  %add.i.i.i.i70 = add nsw i32 %26, -1
  store i32 %add.i.i.i.i70, i32* %24, align 4, !tbaa !23
  br label %invoke.cont.i.i74

invoke.cont.i.i74:                                ; preds = %if.else.i.i.i71, %if.then.i.i.i69
  %retval.0.i.i.i72 = phi i32 [ %25, %if.then.i.i.i69 ], [ %26, %if.else.i.i.i71 ]
  %cmp3.i.i73 = icmp slt i32 %retval.0.i.i.i72, 1
  br i1 %cmp3.i.i73, label %if.then4.i.i75, label %_ZNSsD2Ev.exit76

if.then4.i.i75:                                   ; preds = %invoke.cont.i.i74
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %22, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i63) #3
  br label %_ZNSsD2Ev.exit76

_ZNSsD2Ev.exit76:                                 ; preds = %if.then4.i.i75, %invoke.cont.i.i74, %_ZNSsD2Ev.exit62
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %23) #3
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %0) #3
  br label %if.end

lpad:                                             ; preds = %if.then
  %27 = landingpad { i8*, i32 }
          cleanup
  %28 = extractvalue { i8*, i32 } %27, 0
  %29 = extractvalue { i8*, i32 } %27, 1
  br label %ehcleanup24

lpad7:                                            ; preds = %invoke.cont
  %30 = landingpad { i8*, i32 }
          cleanup
  %31 = extractvalue { i8*, i32 } %30, 0
  %32 = extractvalue { i8*, i32 } %30, 1
  br label %ehcleanup21

lpad11:                                           ; preds = %invoke.cont8
  %33 = landingpad { i8*, i32 }
          cleanup
  %34 = extractvalue { i8*, i32 } %33, 0
  %35 = extractvalue { i8*, i32 } %33, 1
  br label %ehcleanup

lpad13:                                           ; preds = %if.else.i, %if.then.i, %invoke.cont14, %invoke.cont12
  %36 = landingpad { i8*, i32 }
          cleanup
  %37 = extractvalue { i8*, i32 } %36, 0
  %38 = extractvalue { i8*, i32 } %36, 1
  %_M_p.i.i.i81 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp9, i64 0, i32 0, i32 0
  %39 = load i8*, i8** %_M_p.i.i.i81, align 8, !tbaa !17
  %arrayidx.i.i82 = getelementptr inbounds i8, i8* %39, i64 -24
  %40 = bitcast i8* %arrayidx.i.i82 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %41 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i80, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %41) #3
  %cmp.i.i83 = icmp eq i8* %arrayidx.i.i82, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i83, label %_ZNSsD2Ev.exit93, label %if.then.i.i85, !prof !22

if.then.i.i85:                                    ; preds = %lpad13
  %_M_refcount.i.i84 = getelementptr inbounds i8, i8* %39, i64 -8
  %42 = bitcast i8* %_M_refcount.i.i84 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i86, label %if.else.i.i.i88

if.then.i.i.i86:                                  ; preds = %if.then.i.i85
  %43 = atomicrmw volatile add i32* %42, i32 -1 acq_rel
  br label %invoke.cont.i.i91

if.else.i.i.i88:                                  ; preds = %if.then.i.i85
  %44 = load i32, i32* %42, align 4, !tbaa !23
  %add.i.i.i.i87 = add nsw i32 %44, -1
  store i32 %add.i.i.i.i87, i32* %42, align 4, !tbaa !23
  br label %invoke.cont.i.i91

invoke.cont.i.i91:                                ; preds = %if.else.i.i.i88, %if.then.i.i.i86
  %retval.0.i.i.i89 = phi i32 [ %43, %if.then.i.i.i86 ], [ %44, %if.else.i.i.i88 ]
  %cmp3.i.i90 = icmp slt i32 %retval.0.i.i.i89, 1
  br i1 %cmp3.i.i90, label %if.then4.i.i92, label %_ZNSsD2Ev.exit93

if.then4.i.i92:                                   ; preds = %invoke.cont.i.i91
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %40, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i80) #3
  br label %_ZNSsD2Ev.exit93

_ZNSsD2Ev.exit93:                                 ; preds = %if.then4.i.i92, %invoke.cont.i.i91, %lpad13
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %41) #3
  br label %ehcleanup

ehcleanup:                                        ; preds = %_ZNSsD2Ev.exit93, %lpad11
  %exn.slot.0 = phi i8* [ %37, %_ZNSsD2Ev.exit93 ], [ %34, %lpad11 ]
  %ehselector.slot.0 = phi i32 [ %38, %_ZNSsD2Ev.exit93 ], [ %35, %lpad11 ]
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %2) #3
  %_M_p.i.i.i95 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp5, i64 0, i32 0, i32 0
  %45 = load i8*, i8** %_M_p.i.i.i95, align 8, !tbaa !17
  %arrayidx.i.i96 = getelementptr inbounds i8, i8* %45, i64 -24
  %46 = bitcast i8* %arrayidx.i.i96 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %47 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i94, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %47) #3
  %cmp.i.i97 = icmp eq i8* %arrayidx.i.i96, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i97, label %_ZNSsD2Ev.exit107, label %if.then.i.i99, !prof !22

if.then.i.i99:                                    ; preds = %ehcleanup
  %_M_refcount.i.i98 = getelementptr inbounds i8, i8* %45, i64 -8
  %48 = bitcast i8* %_M_refcount.i.i98 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i100, label %if.else.i.i.i102

if.then.i.i.i100:                                 ; preds = %if.then.i.i99
  %49 = atomicrmw volatile add i32* %48, i32 -1 acq_rel
  br label %invoke.cont.i.i105

if.else.i.i.i102:                                 ; preds = %if.then.i.i99
  %50 = load i32, i32* %48, align 4, !tbaa !23
  %add.i.i.i.i101 = add nsw i32 %50, -1
  store i32 %add.i.i.i.i101, i32* %48, align 4, !tbaa !23
  br label %invoke.cont.i.i105

invoke.cont.i.i105:                               ; preds = %if.else.i.i.i102, %if.then.i.i.i100
  %retval.0.i.i.i103 = phi i32 [ %49, %if.then.i.i.i100 ], [ %50, %if.else.i.i.i102 ]
  %cmp3.i.i104 = icmp slt i32 %retval.0.i.i.i103, 1
  br i1 %cmp3.i.i104, label %if.then4.i.i106, label %_ZNSsD2Ev.exit107

if.then4.i.i106:                                  ; preds = %invoke.cont.i.i105
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %46, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i94) #3
  br label %_ZNSsD2Ev.exit107

_ZNSsD2Ev.exit107:                                ; preds = %if.then4.i.i106, %invoke.cont.i.i105, %ehcleanup
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %47) #3
  br label %ehcleanup21

ehcleanup21:                                      ; preds = %_ZNSsD2Ev.exit107, %lpad7
  %exn.slot.1 = phi i8* [ %exn.slot.0, %_ZNSsD2Ev.exit107 ], [ %31, %lpad7 ]
  %ehselector.slot.1 = phi i32 [ %ehselector.slot.0, %_ZNSsD2Ev.exit107 ], [ %32, %lpad7 ]
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %1) #3
  %_M_p.i.i.i112 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp, i64 0, i32 0, i32 0
  %51 = load i8*, i8** %_M_p.i.i.i112, align 8, !tbaa !17
  %arrayidx.i.i113 = getelementptr inbounds i8, i8* %51, i64 -24
  %52 = bitcast i8* %arrayidx.i.i113 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %53 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i111, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %53) #3
  %cmp.i.i114 = icmp eq i8* %arrayidx.i.i113, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i114, label %_ZNSsD2Ev.exit124, label %if.then.i.i116, !prof !22

if.then.i.i116:                                   ; preds = %ehcleanup21
  %_M_refcount.i.i115 = getelementptr inbounds i8, i8* %51, i64 -8
  %54 = bitcast i8* %_M_refcount.i.i115 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i117, label %if.else.i.i.i119

if.then.i.i.i117:                                 ; preds = %if.then.i.i116
  %55 = atomicrmw volatile add i32* %54, i32 -1 acq_rel
  br label %invoke.cont.i.i122

if.else.i.i.i119:                                 ; preds = %if.then.i.i116
  %56 = load i32, i32* %54, align 4, !tbaa !23
  %add.i.i.i.i118 = add nsw i32 %56, -1
  store i32 %add.i.i.i.i118, i32* %54, align 4, !tbaa !23
  br label %invoke.cont.i.i122

invoke.cont.i.i122:                               ; preds = %if.else.i.i.i119, %if.then.i.i.i117
  %retval.0.i.i.i120 = phi i32 [ %55, %if.then.i.i.i117 ], [ %56, %if.else.i.i.i119 ]
  %cmp3.i.i121 = icmp slt i32 %retval.0.i.i.i120, 1
  br i1 %cmp3.i.i121, label %if.then4.i.i123, label %_ZNSsD2Ev.exit124

if.then4.i.i123:                                  ; preds = %invoke.cont.i.i122
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %52, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i111) #3
  br label %_ZNSsD2Ev.exit124

_ZNSsD2Ev.exit124:                                ; preds = %if.then4.i.i123, %invoke.cont.i.i122, %ehcleanup21
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %53) #3
  br label %ehcleanup24

ehcleanup24:                                      ; preds = %_ZNSsD2Ev.exit124, %lpad
  %exn.slot.2 = phi i8* [ %exn.slot.1, %_ZNSsD2Ev.exit124 ], [ %28, %lpad ]
  %ehselector.slot.2 = phi i32 [ %ehselector.slot.1, %_ZNSsD2Ev.exit124 ], [ %29, %lpad ]
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %0) #3
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn.slot.2, 0
  %lpad.val43 = insertvalue { i8*, i32 } %lpad.val, i32 %ehselector.slot.2, 1
  resume { i8*, i32 } %lpad.val43

if.end:                                           ; preds = %_ZNSsD2Ev.exit76, %entry
  %call26 = call i32 @omp_get_thread_num() #3
  %idxprom27 = sext i32 %call26 to i64
  %arrayidx28 = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f3, i64 0, i64 %idxprom27
  %57 = bitcast %"class.std::basic_ofstream"* %arrayidx28 to %"class.std::basic_ostream"*
  %tobool.i125 = icmp eq i8* %acc_kernel_name, null
  br i1 %tobool.i125, label %if.then.i128, label %if.else.i131

if.then.i128:                                     ; preds = %if.end
  %58 = bitcast %"class.std::basic_ofstream"* %arrayidx28 to i8**
  %vtable.i = load i8*, i8** %58, align 16, !tbaa !6
  %vbase.offset.ptr.i = getelementptr i8, i8* %vtable.i, i64 -24
  %59 = bitcast i8* %vbase.offset.ptr.i to i64*
  %vbase.offset.i = load i64, i64* %59, align 8
  %60 = bitcast %"class.std::basic_ofstream"* %arrayidx28 to i8*
  %add.ptr.i = getelementptr inbounds i8, i8* %60, i64 %vbase.offset.i
  %61 = bitcast i8* %add.ptr.i to %"class.std::basic_ios"*
  %_M_streambuf_state.i.i.i126 = getelementptr inbounds i8, i8* %add.ptr.i, i64 32
  %62 = bitcast i8* %_M_streambuf_state.i.i.i126 to i32*
  %63 = load i32, i32* %62, align 8, !tbaa !8
  %or.i.i.i127 = or i32 %63, 1
  call void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %61, i32 %or.i.i.i127)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit

if.else.i131:                                     ; preds = %if.end
  %call.i.i129 = call i64 @strlen(i8* nonnull %acc_kernel_name) #3
  %call1.i130 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %57, i8* nonnull %acc_kernel_name, i64 %call.i.i129)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit: ; preds = %if.else.i131, %if.then.i128
  %call1.i133 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %57, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %tobool.i135 = icmp eq i8* %node_id, null
  br i1 %tobool.i135, label %if.then.i142, label %if.else.i145

if.then.i142:                                     ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit
  %64 = bitcast %"class.std::basic_ofstream"* %arrayidx28 to i8**
  %vtable.i136 = load i8*, i8** %64, align 16, !tbaa !6
  %vbase.offset.ptr.i137 = getelementptr i8, i8* %vtable.i136, i64 -24
  %65 = bitcast i8* %vbase.offset.ptr.i137 to i64*
  %vbase.offset.i138 = load i64, i64* %65, align 8
  %66 = bitcast %"class.std::basic_ofstream"* %arrayidx28 to i8*
  %add.ptr.i139 = getelementptr inbounds i8, i8* %66, i64 %vbase.offset.i138
  %67 = bitcast i8* %add.ptr.i139 to %"class.std::basic_ios"*
  %_M_streambuf_state.i.i.i140 = getelementptr inbounds i8, i8* %add.ptr.i139, i64 32
  %68 = bitcast i8* %_M_streambuf_state.i.i.i140 to i32*
  %69 = load i32, i32* %68, align 8, !tbaa !8
  %or.i.i.i141 = or i32 %69, 1
  call void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %67, i32 %or.i.i.i141)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit146

if.else.i145:                                     ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit
  %call.i.i143 = call i64 @strlen(i8* nonnull %node_id) #3
  %call1.i144 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %57, i8* nonnull %node_id, i64 %call.i.i143)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit146

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit146: ; preds = %if.else.i145, %if.then.i142
  %call1.i148 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %57, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %call33 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull %57, i32 %rowsA)
  %call1.i151 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call33, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %call35 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull %call33, i32 %colsA)
  %call1.i109 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call35, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %call37 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull %call35, i32 %rowsB)
  %call1.i78 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call37, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %call39 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull %call37, i32 %colsB)
  %call1.i46 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call39, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %call41 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull %call39, i32 %batch_size)
  %call1.i = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call41, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0), i64 1)
  ret void
}

; Function Attrs: noinline uwtable
define dso_local void @print_sdp(i8* %acc_kernel_name, i8* %kernel_type, i8* %run_dir, i8* %node_id, i32 %working_mode, i32 %size) #6 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %ref.tmp.i109 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i88 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i74 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i57 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i43 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i = alloca %"class.std::ios_base::Init", align 1
  %agg.tmp = alloca %"class.std::basic_string", align 8
  %ref.tmp = alloca %"class.std::ios_base::Init", align 1
  %agg.tmp5 = alloca %"class.std::basic_string", align 8
  %ref.tmp6 = alloca %"class.std::ios_base::Init", align 1
  %agg.tmp9 = alloca %"class.std::basic_string", align 8
  %ref.tmp10 = alloca %"class.std::ios_base::Init", align 1
  %call = tail call i32 @omp_get_thread_num() #3
  %idxprom = sext i32 %call to i64
  %_M_file.i.i = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f3, i64 0, i64 %idxprom, i32 1, i32 2
  %call.i.i = tail call zeroext i1 @_ZNKSt12__basic_fileIcE7is_openEv(%"class.std::__basic_file"* nonnull %_M_file.i.i) #17
  br i1 %call.i.i, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call2 = tail call i32 @omp_get_thread_num() #3
  %idxprom3 = sext i32 %call2 to i64
  %arrayidx4 = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f3, i64 0, i64 %idxprom3
  %0 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %0) #3
  invoke void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* nonnull %agg.tmp, i8* %run_dir, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.then
  %1 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp6, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %1) #3
  invoke void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* nonnull %agg.tmp5, i8* %kernel_type, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp6)
          to label %invoke.cont8 unwind label %lpad7

invoke.cont8:                                     ; preds = %invoke.cont
  %2 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp10, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %2) #3
  invoke void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* nonnull %agg.tmp9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.16, i64 0, i64 0), %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp10)
          to label %invoke.cont12 unwind label %lpad11

invoke.cont12:                                    ; preds = %invoke.cont8
  %call15 = invoke i8* @_Z12get_dir_nameSsSsSs(%"class.std::basic_string"* nonnull %agg.tmp, %"class.std::basic_string"* nonnull %agg.tmp5, %"class.std::basic_string"* nonnull %agg.tmp9)
          to label %invoke.cont14 unwind label %lpad13

invoke.cont14:                                    ; preds = %invoke.cont12
  %_M_filebuf.i = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f3, i64 0, i64 %idxprom3, i32 1
  %call2.i41 = invoke %"class.std::basic_filebuf"* @_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode(%"class.std::basic_filebuf"* nonnull %_M_filebuf.i, i8* %call15, i32 17)
          to label %call2.i.noexc unwind label %lpad13

call2.i.noexc:                                    ; preds = %invoke.cont14
  %tobool.i = icmp eq %"class.std::basic_filebuf"* %call2.i41, null
  %3 = bitcast %"class.std::basic_ofstream"* %arrayidx4 to i8**
  %vtable3.i = load i8*, i8** %3, align 16, !tbaa !6
  %vbase.offset.ptr4.i = getelementptr i8, i8* %vtable3.i, i64 -24
  %4 = bitcast i8* %vbase.offset.ptr4.i to i64*
  %vbase.offset5.i = load i64, i64* %4, align 8
  %5 = bitcast %"class.std::basic_ofstream"* %arrayidx4 to i8*
  %add.ptr6.i = getelementptr inbounds i8, i8* %5, i64 %vbase.offset5.i
  %6 = bitcast i8* %add.ptr6.i to %"class.std::basic_ios"*
  br i1 %tobool.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %call2.i.noexc
  %_M_streambuf_state.i.i.i = getelementptr inbounds i8, i8* %add.ptr6.i, i64 32
  %7 = bitcast i8* %_M_streambuf_state.i.i.i to i32*
  %8 = load i32, i32* %7, align 8, !tbaa !8
  %or.i.i.i = or i32 %8, 4
  invoke void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %6, i32 %or.i.i.i)
          to label %invoke.cont18 unwind label %lpad13

if.else.i:                                        ; preds = %call2.i.noexc
  invoke void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %6, i32 0)
          to label %invoke.cont18 unwind label %lpad13

invoke.cont18:                                    ; preds = %if.else.i, %if.then.i
  %_M_p.i.i.i = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp9, i64 0, i32 0, i32 0
  %9 = load i8*, i8** %_M_p.i.i.i, align 8, !tbaa !17
  %arrayidx.i.i = getelementptr inbounds i8, i8* %9, i64 -24
  %10 = bitcast i8* %arrayidx.i.i to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %11 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %11) #3
  %cmp.i.i = icmp eq i8* %arrayidx.i.i, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i, label %_ZNSsD2Ev.exit, label %if.then.i.i, !prof !22

if.then.i.i:                                      ; preds = %invoke.cont18
  %_M_refcount.i.i = getelementptr inbounds i8, i8* %9, i64 -8
  %12 = bitcast i8* %_M_refcount.i.i to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i, label %if.else.i.i.i

if.then.i.i.i:                                    ; preds = %if.then.i.i
  %13 = atomicrmw volatile add i32* %12, i32 -1 acq_rel
  br label %invoke.cont.i.i

if.else.i.i.i:                                    ; preds = %if.then.i.i
  %14 = load i32, i32* %12, align 4, !tbaa !23
  %add.i.i.i.i = add nsw i32 %14, -1
  store i32 %add.i.i.i.i, i32* %12, align 4, !tbaa !23
  br label %invoke.cont.i.i

invoke.cont.i.i:                                  ; preds = %if.else.i.i.i, %if.then.i.i.i
  %retval.0.i.i.i = phi i32 [ %13, %if.then.i.i.i ], [ %14, %if.else.i.i.i ]
  %cmp3.i.i = icmp slt i32 %retval.0.i.i.i, 1
  br i1 %cmp3.i.i, label %if.then4.i.i, label %_ZNSsD2Ev.exit

if.then4.i.i:                                     ; preds = %invoke.cont.i.i
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %10, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i) #3
  br label %_ZNSsD2Ev.exit

_ZNSsD2Ev.exit:                                   ; preds = %if.then4.i.i, %invoke.cont.i.i, %invoke.cont18
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %11) #3
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %2) #3
  %_M_p.i.i.i44 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp5, i64 0, i32 0, i32 0
  %15 = load i8*, i8** %_M_p.i.i.i44, align 8, !tbaa !17
  %arrayidx.i.i45 = getelementptr inbounds i8, i8* %15, i64 -24
  %16 = bitcast i8* %arrayidx.i.i45 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %17 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i43, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %17) #3
  %cmp.i.i46 = icmp eq i8* %arrayidx.i.i45, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i46, label %_ZNSsD2Ev.exit56, label %if.then.i.i48, !prof !22

if.then.i.i48:                                    ; preds = %_ZNSsD2Ev.exit
  %_M_refcount.i.i47 = getelementptr inbounds i8, i8* %15, i64 -8
  %18 = bitcast i8* %_M_refcount.i.i47 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i49, label %if.else.i.i.i51

if.then.i.i.i49:                                  ; preds = %if.then.i.i48
  %19 = atomicrmw volatile add i32* %18, i32 -1 acq_rel
  br label %invoke.cont.i.i54

if.else.i.i.i51:                                  ; preds = %if.then.i.i48
  %20 = load i32, i32* %18, align 4, !tbaa !23
  %add.i.i.i.i50 = add nsw i32 %20, -1
  store i32 %add.i.i.i.i50, i32* %18, align 4, !tbaa !23
  br label %invoke.cont.i.i54

invoke.cont.i.i54:                                ; preds = %if.else.i.i.i51, %if.then.i.i.i49
  %retval.0.i.i.i52 = phi i32 [ %19, %if.then.i.i.i49 ], [ %20, %if.else.i.i.i51 ]
  %cmp3.i.i53 = icmp slt i32 %retval.0.i.i.i52, 1
  br i1 %cmp3.i.i53, label %if.then4.i.i55, label %_ZNSsD2Ev.exit56

if.then4.i.i55:                                   ; preds = %invoke.cont.i.i54
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %16, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i43) #3
  br label %_ZNSsD2Ev.exit56

_ZNSsD2Ev.exit56:                                 ; preds = %if.then4.i.i55, %invoke.cont.i.i54, %_ZNSsD2Ev.exit
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %17) #3
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %1) #3
  %_M_p.i.i.i58 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp, i64 0, i32 0, i32 0
  %21 = load i8*, i8** %_M_p.i.i.i58, align 8, !tbaa !17
  %arrayidx.i.i59 = getelementptr inbounds i8, i8* %21, i64 -24
  %22 = bitcast i8* %arrayidx.i.i59 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %23 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i57, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %23) #3
  %cmp.i.i60 = icmp eq i8* %arrayidx.i.i59, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i60, label %_ZNSsD2Ev.exit70, label %if.then.i.i62, !prof !22

if.then.i.i62:                                    ; preds = %_ZNSsD2Ev.exit56
  %_M_refcount.i.i61 = getelementptr inbounds i8, i8* %21, i64 -8
  %24 = bitcast i8* %_M_refcount.i.i61 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i63, label %if.else.i.i.i65

if.then.i.i.i63:                                  ; preds = %if.then.i.i62
  %25 = atomicrmw volatile add i32* %24, i32 -1 acq_rel
  br label %invoke.cont.i.i68

if.else.i.i.i65:                                  ; preds = %if.then.i.i62
  %26 = load i32, i32* %24, align 4, !tbaa !23
  %add.i.i.i.i64 = add nsw i32 %26, -1
  store i32 %add.i.i.i.i64, i32* %24, align 4, !tbaa !23
  br label %invoke.cont.i.i68

invoke.cont.i.i68:                                ; preds = %if.else.i.i.i65, %if.then.i.i.i63
  %retval.0.i.i.i66 = phi i32 [ %25, %if.then.i.i.i63 ], [ %26, %if.else.i.i.i65 ]
  %cmp3.i.i67 = icmp slt i32 %retval.0.i.i.i66, 1
  br i1 %cmp3.i.i67, label %if.then4.i.i69, label %_ZNSsD2Ev.exit70

if.then4.i.i69:                                   ; preds = %invoke.cont.i.i68
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %22, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i57) #3
  br label %_ZNSsD2Ev.exit70

_ZNSsD2Ev.exit70:                                 ; preds = %if.then4.i.i69, %invoke.cont.i.i68, %_ZNSsD2Ev.exit56
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %23) #3
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %0) #3
  br label %if.end

lpad:                                             ; preds = %if.then
  %27 = landingpad { i8*, i32 }
          cleanup
  %28 = extractvalue { i8*, i32 } %27, 0
  %29 = extractvalue { i8*, i32 } %27, 1
  br label %ehcleanup24

lpad7:                                            ; preds = %invoke.cont
  %30 = landingpad { i8*, i32 }
          cleanup
  %31 = extractvalue { i8*, i32 } %30, 0
  %32 = extractvalue { i8*, i32 } %30, 1
  br label %ehcleanup21

lpad11:                                           ; preds = %invoke.cont8
  %33 = landingpad { i8*, i32 }
          cleanup
  %34 = extractvalue { i8*, i32 } %33, 0
  %35 = extractvalue { i8*, i32 } %33, 1
  br label %ehcleanup

lpad13:                                           ; preds = %if.else.i, %if.then.i, %invoke.cont14, %invoke.cont12
  %36 = landingpad { i8*, i32 }
          cleanup
  %37 = extractvalue { i8*, i32 } %36, 0
  %38 = extractvalue { i8*, i32 } %36, 1
  %_M_p.i.i.i75 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp9, i64 0, i32 0, i32 0
  %39 = load i8*, i8** %_M_p.i.i.i75, align 8, !tbaa !17
  %arrayidx.i.i76 = getelementptr inbounds i8, i8* %39, i64 -24
  %40 = bitcast i8* %arrayidx.i.i76 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %41 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i74, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %41) #3
  %cmp.i.i77 = icmp eq i8* %arrayidx.i.i76, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i77, label %_ZNSsD2Ev.exit87, label %if.then.i.i79, !prof !22

if.then.i.i79:                                    ; preds = %lpad13
  %_M_refcount.i.i78 = getelementptr inbounds i8, i8* %39, i64 -8
  %42 = bitcast i8* %_M_refcount.i.i78 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i80, label %if.else.i.i.i82

if.then.i.i.i80:                                  ; preds = %if.then.i.i79
  %43 = atomicrmw volatile add i32* %42, i32 -1 acq_rel
  br label %invoke.cont.i.i85

if.else.i.i.i82:                                  ; preds = %if.then.i.i79
  %44 = load i32, i32* %42, align 4, !tbaa !23
  %add.i.i.i.i81 = add nsw i32 %44, -1
  store i32 %add.i.i.i.i81, i32* %42, align 4, !tbaa !23
  br label %invoke.cont.i.i85

invoke.cont.i.i85:                                ; preds = %if.else.i.i.i82, %if.then.i.i.i80
  %retval.0.i.i.i83 = phi i32 [ %43, %if.then.i.i.i80 ], [ %44, %if.else.i.i.i82 ]
  %cmp3.i.i84 = icmp slt i32 %retval.0.i.i.i83, 1
  br i1 %cmp3.i.i84, label %if.then4.i.i86, label %_ZNSsD2Ev.exit87

if.then4.i.i86:                                   ; preds = %invoke.cont.i.i85
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %40, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i74) #3
  br label %_ZNSsD2Ev.exit87

_ZNSsD2Ev.exit87:                                 ; preds = %if.then4.i.i86, %invoke.cont.i.i85, %lpad13
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %41) #3
  br label %ehcleanup

ehcleanup:                                        ; preds = %_ZNSsD2Ev.exit87, %lpad11
  %exn.slot.0 = phi i8* [ %37, %_ZNSsD2Ev.exit87 ], [ %34, %lpad11 ]
  %ehselector.slot.0 = phi i32 [ %38, %_ZNSsD2Ev.exit87 ], [ %35, %lpad11 ]
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %2) #3
  %_M_p.i.i.i89 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp5, i64 0, i32 0, i32 0
  %45 = load i8*, i8** %_M_p.i.i.i89, align 8, !tbaa !17
  %arrayidx.i.i90 = getelementptr inbounds i8, i8* %45, i64 -24
  %46 = bitcast i8* %arrayidx.i.i90 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %47 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i88, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %47) #3
  %cmp.i.i91 = icmp eq i8* %arrayidx.i.i90, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i91, label %_ZNSsD2Ev.exit101, label %if.then.i.i93, !prof !22

if.then.i.i93:                                    ; preds = %ehcleanup
  %_M_refcount.i.i92 = getelementptr inbounds i8, i8* %45, i64 -8
  %48 = bitcast i8* %_M_refcount.i.i92 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i94, label %if.else.i.i.i96

if.then.i.i.i94:                                  ; preds = %if.then.i.i93
  %49 = atomicrmw volatile add i32* %48, i32 -1 acq_rel
  br label %invoke.cont.i.i99

if.else.i.i.i96:                                  ; preds = %if.then.i.i93
  %50 = load i32, i32* %48, align 4, !tbaa !23
  %add.i.i.i.i95 = add nsw i32 %50, -1
  store i32 %add.i.i.i.i95, i32* %48, align 4, !tbaa !23
  br label %invoke.cont.i.i99

invoke.cont.i.i99:                                ; preds = %if.else.i.i.i96, %if.then.i.i.i94
  %retval.0.i.i.i97 = phi i32 [ %49, %if.then.i.i.i94 ], [ %50, %if.else.i.i.i96 ]
  %cmp3.i.i98 = icmp slt i32 %retval.0.i.i.i97, 1
  br i1 %cmp3.i.i98, label %if.then4.i.i100, label %_ZNSsD2Ev.exit101

if.then4.i.i100:                                  ; preds = %invoke.cont.i.i99
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %46, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i88) #3
  br label %_ZNSsD2Ev.exit101

_ZNSsD2Ev.exit101:                                ; preds = %if.then4.i.i100, %invoke.cont.i.i99, %ehcleanup
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %47) #3
  br label %ehcleanup21

ehcleanup21:                                      ; preds = %_ZNSsD2Ev.exit101, %lpad7
  %exn.slot.1 = phi i8* [ %exn.slot.0, %_ZNSsD2Ev.exit101 ], [ %31, %lpad7 ]
  %ehselector.slot.1 = phi i32 [ %ehselector.slot.0, %_ZNSsD2Ev.exit101 ], [ %32, %lpad7 ]
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %1) #3
  %_M_p.i.i.i110 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp, i64 0, i32 0, i32 0
  %51 = load i8*, i8** %_M_p.i.i.i110, align 8, !tbaa !17
  %arrayidx.i.i111 = getelementptr inbounds i8, i8* %51, i64 -24
  %52 = bitcast i8* %arrayidx.i.i111 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %53 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i109, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %53) #3
  %cmp.i.i112 = icmp eq i8* %arrayidx.i.i111, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i112, label %_ZNSsD2Ev.exit122, label %if.then.i.i114, !prof !22

if.then.i.i114:                                   ; preds = %ehcleanup21
  %_M_refcount.i.i113 = getelementptr inbounds i8, i8* %51, i64 -8
  %54 = bitcast i8* %_M_refcount.i.i113 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i115, label %if.else.i.i.i117

if.then.i.i.i115:                                 ; preds = %if.then.i.i114
  %55 = atomicrmw volatile add i32* %54, i32 -1 acq_rel
  br label %invoke.cont.i.i120

if.else.i.i.i117:                                 ; preds = %if.then.i.i114
  %56 = load i32, i32* %54, align 4, !tbaa !23
  %add.i.i.i.i116 = add nsw i32 %56, -1
  store i32 %add.i.i.i.i116, i32* %54, align 4, !tbaa !23
  br label %invoke.cont.i.i120

invoke.cont.i.i120:                               ; preds = %if.else.i.i.i117, %if.then.i.i.i115
  %retval.0.i.i.i118 = phi i32 [ %55, %if.then.i.i.i115 ], [ %56, %if.else.i.i.i117 ]
  %cmp3.i.i119 = icmp slt i32 %retval.0.i.i.i118, 1
  br i1 %cmp3.i.i119, label %if.then4.i.i121, label %_ZNSsD2Ev.exit122

if.then4.i.i121:                                  ; preds = %invoke.cont.i.i120
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %52, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i109) #3
  br label %_ZNSsD2Ev.exit122

_ZNSsD2Ev.exit122:                                ; preds = %if.then4.i.i121, %invoke.cont.i.i120, %ehcleanup21
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %53) #3
  br label %ehcleanup24

ehcleanup24:                                      ; preds = %_ZNSsD2Ev.exit122, %lpad
  %exn.slot.2 = phi i8* [ %exn.slot.1, %_ZNSsD2Ev.exit122 ], [ %28, %lpad ]
  %ehselector.slot.2 = phi i32 [ %ehselector.slot.1, %_ZNSsD2Ev.exit122 ], [ %29, %lpad ]
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %0) #3
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn.slot.2, 0
  %lpad.val37 = insertvalue { i8*, i32 } %lpad.val, i32 %ehselector.slot.2, 1
  resume { i8*, i32 } %lpad.val37

if.end:                                           ; preds = %_ZNSsD2Ev.exit70, %entry
  %call26 = call i32 @omp_get_thread_num() #3
  %idxprom27 = sext i32 %call26 to i64
  %arrayidx28 = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f3, i64 0, i64 %idxprom27
  %57 = bitcast %"class.std::basic_ofstream"* %arrayidx28 to %"class.std::basic_ostream"*
  %tobool.i123 = icmp eq i8* %acc_kernel_name, null
  br i1 %tobool.i123, label %if.then.i130, label %if.else.i133

if.then.i130:                                     ; preds = %if.end
  %58 = bitcast %"class.std::basic_ofstream"* %arrayidx28 to i8**
  %vtable.i124 = load i8*, i8** %58, align 16, !tbaa !6
  %vbase.offset.ptr.i125 = getelementptr i8, i8* %vtable.i124, i64 -24
  %59 = bitcast i8* %vbase.offset.ptr.i125 to i64*
  %vbase.offset.i126 = load i64, i64* %59, align 8
  %60 = bitcast %"class.std::basic_ofstream"* %arrayidx28 to i8*
  %add.ptr.i127 = getelementptr inbounds i8, i8* %60, i64 %vbase.offset.i126
  %61 = bitcast i8* %add.ptr.i127 to %"class.std::basic_ios"*
  %_M_streambuf_state.i.i.i128 = getelementptr inbounds i8, i8* %add.ptr.i127, i64 32
  %62 = bitcast i8* %_M_streambuf_state.i.i.i128 to i32*
  %63 = load i32, i32* %62, align 8, !tbaa !8
  %or.i.i.i129 = or i32 %63, 1
  call void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %61, i32 %or.i.i.i129)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit134

if.else.i133:                                     ; preds = %if.end
  %call.i.i131 = call i64 @strlen(i8* nonnull %acc_kernel_name) #3
  %call1.i132 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %57, i8* nonnull %acc_kernel_name, i64 %call.i.i131)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit134

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit134: ; preds = %if.else.i133, %if.then.i130
  %call1.i136 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %57, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %tobool.i102 = icmp eq i8* %node_id, null
  br i1 %tobool.i102, label %if.then.i105, label %if.else.i108

if.then.i105:                                     ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit134
  %64 = bitcast %"class.std::basic_ofstream"* %arrayidx28 to i8**
  %vtable.i = load i8*, i8** %64, align 16, !tbaa !6
  %vbase.offset.ptr.i = getelementptr i8, i8* %vtable.i, i64 -24
  %65 = bitcast i8* %vbase.offset.ptr.i to i64*
  %vbase.offset.i = load i64, i64* %65, align 8
  %66 = bitcast %"class.std::basic_ofstream"* %arrayidx28 to i8*
  %add.ptr.i = getelementptr inbounds i8, i8* %66, i64 %vbase.offset.i
  %67 = bitcast i8* %add.ptr.i to %"class.std::basic_ios"*
  %_M_streambuf_state.i.i.i103 = getelementptr inbounds i8, i8* %add.ptr.i, i64 32
  %68 = bitcast i8* %_M_streambuf_state.i.i.i103 to i32*
  %69 = load i32, i32* %68, align 8, !tbaa !8
  %or.i.i.i104 = or i32 %69, 1
  call void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %67, i32 %or.i.i.i104)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit

if.else.i108:                                     ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit134
  %call.i.i106 = call i64 @strlen(i8* nonnull %node_id) #3
  %call1.i107 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %57, i8* nonnull %node_id, i64 %call.i.i106)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit: ; preds = %if.else.i108, %if.then.i105
  %call1.i72 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %57, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %call33 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull %57, i32 %working_mode)
  %call1.i40 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call33, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %call35 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull %call33, i32 %size)
  %call1.i = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call35, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0), i64 1)
  ret void
}

; Function Attrs: noinline uwtable
define dso_local void @print_conv2d_layer(i8* %acc_kernel_name, i8* %kernel_type, i8* %run_dir, i8* %node_id, i32 %batch, i32 %in_channels, i32 %in_height, i32 %in_width, i32 %out_channels, i32 %filter_height, i32 %filter_width, i1 zeroext %zero_pad, i32 %vert_conv_stride, i32 %horiz_conv_stride, i1 zeroext %pooling, i32 %pool_height, i32 %pool_width, i32 %vertical_pool_stride, i32 %horizontal_pool_stride) #6 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %ref.tmp.i133 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i116 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i102 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i85 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i71 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i = alloca %"class.std::ios_base::Init", align 1
  %agg.tmp = alloca %"class.std::basic_string", align 8
  %ref.tmp = alloca %"class.std::ios_base::Init", align 1
  %agg.tmp6 = alloca %"class.std::basic_string", align 8
  %ref.tmp7 = alloca %"class.std::ios_base::Init", align 1
  %agg.tmp10 = alloca %"class.std::basic_string", align 8
  %ref.tmp11 = alloca %"class.std::ios_base::Init", align 1
  %call = tail call i32 @omp_get_thread_num() #3
  %idxprom = sext i32 %call to i64
  %_M_file.i.i = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f3, i64 0, i64 %idxprom, i32 1, i32 2
  %call.i.i = tail call zeroext i1 @_ZNKSt12__basic_fileIcE7is_openEv(%"class.std::__basic_file"* nonnull %_M_file.i.i) #17
  br i1 %call.i.i, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call3 = tail call i32 @omp_get_thread_num() #3
  %idxprom4 = sext i32 %call3 to i64
  %arrayidx5 = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f3, i64 0, i64 %idxprom4
  %0 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %0) #3
  invoke void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* nonnull %agg.tmp, i8* %run_dir, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.then
  %1 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp7, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %1) #3
  invoke void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* nonnull %agg.tmp6, i8* %kernel_type, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp7)
          to label %invoke.cont9 unwind label %lpad8

invoke.cont9:                                     ; preds = %invoke.cont
  %2 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp11, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %2) #3
  invoke void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* nonnull %agg.tmp10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.16, i64 0, i64 0), %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp11)
          to label %invoke.cont13 unwind label %lpad12

invoke.cont13:                                    ; preds = %invoke.cont9
  %call16 = invoke i8* @_Z12get_dir_nameSsSsSs(%"class.std::basic_string"* nonnull %agg.tmp, %"class.std::basic_string"* nonnull %agg.tmp6, %"class.std::basic_string"* nonnull %agg.tmp10)
          to label %invoke.cont15 unwind label %lpad14

invoke.cont15:                                    ; preds = %invoke.cont13
  %_M_filebuf.i = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f3, i64 0, i64 %idxprom4, i32 1
  %call2.i69 = invoke %"class.std::basic_filebuf"* @_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode(%"class.std::basic_filebuf"* nonnull %_M_filebuf.i, i8* %call16, i32 17)
          to label %call2.i.noexc unwind label %lpad14

call2.i.noexc:                                    ; preds = %invoke.cont15
  %tobool.i = icmp eq %"class.std::basic_filebuf"* %call2.i69, null
  %3 = bitcast %"class.std::basic_ofstream"* %arrayidx5 to i8**
  %vtable3.i = load i8*, i8** %3, align 16, !tbaa !6
  %vbase.offset.ptr4.i = getelementptr i8, i8* %vtable3.i, i64 -24
  %4 = bitcast i8* %vbase.offset.ptr4.i to i64*
  %vbase.offset5.i = load i64, i64* %4, align 8
  %5 = bitcast %"class.std::basic_ofstream"* %arrayidx5 to i8*
  %add.ptr6.i = getelementptr inbounds i8, i8* %5, i64 %vbase.offset5.i
  %6 = bitcast i8* %add.ptr6.i to %"class.std::basic_ios"*
  br i1 %tobool.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %call2.i.noexc
  %_M_streambuf_state.i.i.i = getelementptr inbounds i8, i8* %add.ptr6.i, i64 32
  %7 = bitcast i8* %_M_streambuf_state.i.i.i to i32*
  %8 = load i32, i32* %7, align 8, !tbaa !8
  %or.i.i.i = or i32 %8, 4
  invoke void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %6, i32 %or.i.i.i)
          to label %invoke.cont19 unwind label %lpad14

if.else.i:                                        ; preds = %call2.i.noexc
  invoke void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %6, i32 0)
          to label %invoke.cont19 unwind label %lpad14

invoke.cont19:                                    ; preds = %if.else.i, %if.then.i
  %_M_p.i.i.i = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp10, i64 0, i32 0, i32 0
  %9 = load i8*, i8** %_M_p.i.i.i, align 8, !tbaa !17
  %arrayidx.i.i = getelementptr inbounds i8, i8* %9, i64 -24
  %10 = bitcast i8* %arrayidx.i.i to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %11 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %11) #3
  %cmp.i.i = icmp eq i8* %arrayidx.i.i, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i, label %_ZNSsD2Ev.exit, label %if.then.i.i, !prof !22

if.then.i.i:                                      ; preds = %invoke.cont19
  %_M_refcount.i.i = getelementptr inbounds i8, i8* %9, i64 -8
  %12 = bitcast i8* %_M_refcount.i.i to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i, label %if.else.i.i.i

if.then.i.i.i:                                    ; preds = %if.then.i.i
  %13 = atomicrmw volatile add i32* %12, i32 -1 acq_rel
  br label %invoke.cont.i.i

if.else.i.i.i:                                    ; preds = %if.then.i.i
  %14 = load i32, i32* %12, align 4, !tbaa !23
  %add.i.i.i.i = add nsw i32 %14, -1
  store i32 %add.i.i.i.i, i32* %12, align 4, !tbaa !23
  br label %invoke.cont.i.i

invoke.cont.i.i:                                  ; preds = %if.else.i.i.i, %if.then.i.i.i
  %retval.0.i.i.i = phi i32 [ %13, %if.then.i.i.i ], [ %14, %if.else.i.i.i ]
  %cmp3.i.i = icmp slt i32 %retval.0.i.i.i, 1
  br i1 %cmp3.i.i, label %if.then4.i.i, label %_ZNSsD2Ev.exit

if.then4.i.i:                                     ; preds = %invoke.cont.i.i
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %10, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i) #3
  br label %_ZNSsD2Ev.exit

_ZNSsD2Ev.exit:                                   ; preds = %if.then4.i.i, %invoke.cont.i.i, %invoke.cont19
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %11) #3
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %2) #3
  %_M_p.i.i.i72 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp6, i64 0, i32 0, i32 0
  %15 = load i8*, i8** %_M_p.i.i.i72, align 8, !tbaa !17
  %arrayidx.i.i73 = getelementptr inbounds i8, i8* %15, i64 -24
  %16 = bitcast i8* %arrayidx.i.i73 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %17 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i71, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %17) #3
  %cmp.i.i74 = icmp eq i8* %arrayidx.i.i73, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i74, label %_ZNSsD2Ev.exit84, label %if.then.i.i76, !prof !22

if.then.i.i76:                                    ; preds = %_ZNSsD2Ev.exit
  %_M_refcount.i.i75 = getelementptr inbounds i8, i8* %15, i64 -8
  %18 = bitcast i8* %_M_refcount.i.i75 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i77, label %if.else.i.i.i79

if.then.i.i.i77:                                  ; preds = %if.then.i.i76
  %19 = atomicrmw volatile add i32* %18, i32 -1 acq_rel
  br label %invoke.cont.i.i82

if.else.i.i.i79:                                  ; preds = %if.then.i.i76
  %20 = load i32, i32* %18, align 4, !tbaa !23
  %add.i.i.i.i78 = add nsw i32 %20, -1
  store i32 %add.i.i.i.i78, i32* %18, align 4, !tbaa !23
  br label %invoke.cont.i.i82

invoke.cont.i.i82:                                ; preds = %if.else.i.i.i79, %if.then.i.i.i77
  %retval.0.i.i.i80 = phi i32 [ %19, %if.then.i.i.i77 ], [ %20, %if.else.i.i.i79 ]
  %cmp3.i.i81 = icmp slt i32 %retval.0.i.i.i80, 1
  br i1 %cmp3.i.i81, label %if.then4.i.i83, label %_ZNSsD2Ev.exit84

if.then4.i.i83:                                   ; preds = %invoke.cont.i.i82
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %16, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i71) #3
  br label %_ZNSsD2Ev.exit84

_ZNSsD2Ev.exit84:                                 ; preds = %if.then4.i.i83, %invoke.cont.i.i82, %_ZNSsD2Ev.exit
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %17) #3
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %1) #3
  %_M_p.i.i.i86 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp, i64 0, i32 0, i32 0
  %21 = load i8*, i8** %_M_p.i.i.i86, align 8, !tbaa !17
  %arrayidx.i.i87 = getelementptr inbounds i8, i8* %21, i64 -24
  %22 = bitcast i8* %arrayidx.i.i87 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %23 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i85, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %23) #3
  %cmp.i.i88 = icmp eq i8* %arrayidx.i.i87, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i88, label %_ZNSsD2Ev.exit98, label %if.then.i.i90, !prof !22

if.then.i.i90:                                    ; preds = %_ZNSsD2Ev.exit84
  %_M_refcount.i.i89 = getelementptr inbounds i8, i8* %21, i64 -8
  %24 = bitcast i8* %_M_refcount.i.i89 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i91, label %if.else.i.i.i93

if.then.i.i.i91:                                  ; preds = %if.then.i.i90
  %25 = atomicrmw volatile add i32* %24, i32 -1 acq_rel
  br label %invoke.cont.i.i96

if.else.i.i.i93:                                  ; preds = %if.then.i.i90
  %26 = load i32, i32* %24, align 4, !tbaa !23
  %add.i.i.i.i92 = add nsw i32 %26, -1
  store i32 %add.i.i.i.i92, i32* %24, align 4, !tbaa !23
  br label %invoke.cont.i.i96

invoke.cont.i.i96:                                ; preds = %if.else.i.i.i93, %if.then.i.i.i91
  %retval.0.i.i.i94 = phi i32 [ %25, %if.then.i.i.i91 ], [ %26, %if.else.i.i.i93 ]
  %cmp3.i.i95 = icmp slt i32 %retval.0.i.i.i94, 1
  br i1 %cmp3.i.i95, label %if.then4.i.i97, label %_ZNSsD2Ev.exit98

if.then4.i.i97:                                   ; preds = %invoke.cont.i.i96
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %22, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i85) #3
  br label %_ZNSsD2Ev.exit98

_ZNSsD2Ev.exit98:                                 ; preds = %if.then4.i.i97, %invoke.cont.i.i96, %_ZNSsD2Ev.exit84
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %23) #3
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %0) #3
  br label %if.end

lpad:                                             ; preds = %if.then
  %27 = landingpad { i8*, i32 }
          cleanup
  %28 = extractvalue { i8*, i32 } %27, 0
  %29 = extractvalue { i8*, i32 } %27, 1
  br label %ehcleanup25

lpad8:                                            ; preds = %invoke.cont
  %30 = landingpad { i8*, i32 }
          cleanup
  %31 = extractvalue { i8*, i32 } %30, 0
  %32 = extractvalue { i8*, i32 } %30, 1
  br label %ehcleanup22

lpad12:                                           ; preds = %invoke.cont9
  %33 = landingpad { i8*, i32 }
          cleanup
  %34 = extractvalue { i8*, i32 } %33, 0
  %35 = extractvalue { i8*, i32 } %33, 1
  br label %ehcleanup

lpad14:                                           ; preds = %if.else.i, %if.then.i, %invoke.cont15, %invoke.cont13
  %36 = landingpad { i8*, i32 }
          cleanup
  %37 = extractvalue { i8*, i32 } %36, 0
  %38 = extractvalue { i8*, i32 } %36, 1
  %_M_p.i.i.i103 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp10, i64 0, i32 0, i32 0
  %39 = load i8*, i8** %_M_p.i.i.i103, align 8, !tbaa !17
  %arrayidx.i.i104 = getelementptr inbounds i8, i8* %39, i64 -24
  %40 = bitcast i8* %arrayidx.i.i104 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %41 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i102, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %41) #3
  %cmp.i.i105 = icmp eq i8* %arrayidx.i.i104, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i105, label %_ZNSsD2Ev.exit115, label %if.then.i.i107, !prof !22

if.then.i.i107:                                   ; preds = %lpad14
  %_M_refcount.i.i106 = getelementptr inbounds i8, i8* %39, i64 -8
  %42 = bitcast i8* %_M_refcount.i.i106 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i108, label %if.else.i.i.i110

if.then.i.i.i108:                                 ; preds = %if.then.i.i107
  %43 = atomicrmw volatile add i32* %42, i32 -1 acq_rel
  br label %invoke.cont.i.i113

if.else.i.i.i110:                                 ; preds = %if.then.i.i107
  %44 = load i32, i32* %42, align 4, !tbaa !23
  %add.i.i.i.i109 = add nsw i32 %44, -1
  store i32 %add.i.i.i.i109, i32* %42, align 4, !tbaa !23
  br label %invoke.cont.i.i113

invoke.cont.i.i113:                               ; preds = %if.else.i.i.i110, %if.then.i.i.i108
  %retval.0.i.i.i111 = phi i32 [ %43, %if.then.i.i.i108 ], [ %44, %if.else.i.i.i110 ]
  %cmp3.i.i112 = icmp slt i32 %retval.0.i.i.i111, 1
  br i1 %cmp3.i.i112, label %if.then4.i.i114, label %_ZNSsD2Ev.exit115

if.then4.i.i114:                                  ; preds = %invoke.cont.i.i113
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %40, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i102) #3
  br label %_ZNSsD2Ev.exit115

_ZNSsD2Ev.exit115:                                ; preds = %if.then4.i.i114, %invoke.cont.i.i113, %lpad14
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %41) #3
  br label %ehcleanup

ehcleanup:                                        ; preds = %_ZNSsD2Ev.exit115, %lpad12
  %exn.slot.0 = phi i8* [ %37, %_ZNSsD2Ev.exit115 ], [ %34, %lpad12 ]
  %ehselector.slot.0 = phi i32 [ %38, %_ZNSsD2Ev.exit115 ], [ %35, %lpad12 ]
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %2) #3
  %_M_p.i.i.i117 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp6, i64 0, i32 0, i32 0
  %45 = load i8*, i8** %_M_p.i.i.i117, align 8, !tbaa !17
  %arrayidx.i.i118 = getelementptr inbounds i8, i8* %45, i64 -24
  %46 = bitcast i8* %arrayidx.i.i118 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %47 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i116, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %47) #3
  %cmp.i.i119 = icmp eq i8* %arrayidx.i.i118, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i119, label %_ZNSsD2Ev.exit129, label %if.then.i.i121, !prof !22

if.then.i.i121:                                   ; preds = %ehcleanup
  %_M_refcount.i.i120 = getelementptr inbounds i8, i8* %45, i64 -8
  %48 = bitcast i8* %_M_refcount.i.i120 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i122, label %if.else.i.i.i124

if.then.i.i.i122:                                 ; preds = %if.then.i.i121
  %49 = atomicrmw volatile add i32* %48, i32 -1 acq_rel
  br label %invoke.cont.i.i127

if.else.i.i.i124:                                 ; preds = %if.then.i.i121
  %50 = load i32, i32* %48, align 4, !tbaa !23
  %add.i.i.i.i123 = add nsw i32 %50, -1
  store i32 %add.i.i.i.i123, i32* %48, align 4, !tbaa !23
  br label %invoke.cont.i.i127

invoke.cont.i.i127:                               ; preds = %if.else.i.i.i124, %if.then.i.i.i122
  %retval.0.i.i.i125 = phi i32 [ %49, %if.then.i.i.i122 ], [ %50, %if.else.i.i.i124 ]
  %cmp3.i.i126 = icmp slt i32 %retval.0.i.i.i125, 1
  br i1 %cmp3.i.i126, label %if.then4.i.i128, label %_ZNSsD2Ev.exit129

if.then4.i.i128:                                  ; preds = %invoke.cont.i.i127
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %46, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i116) #3
  br label %_ZNSsD2Ev.exit129

_ZNSsD2Ev.exit129:                                ; preds = %if.then4.i.i128, %invoke.cont.i.i127, %ehcleanup
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %47) #3
  br label %ehcleanup22

ehcleanup22:                                      ; preds = %_ZNSsD2Ev.exit129, %lpad8
  %exn.slot.1 = phi i8* [ %exn.slot.0, %_ZNSsD2Ev.exit129 ], [ %31, %lpad8 ]
  %ehselector.slot.1 = phi i32 [ %ehselector.slot.0, %_ZNSsD2Ev.exit129 ], [ %32, %lpad8 ]
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %1) #3
  %_M_p.i.i.i134 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp, i64 0, i32 0, i32 0
  %51 = load i8*, i8** %_M_p.i.i.i134, align 8, !tbaa !17
  %arrayidx.i.i135 = getelementptr inbounds i8, i8* %51, i64 -24
  %52 = bitcast i8* %arrayidx.i.i135 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %53 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i133, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %53) #3
  %cmp.i.i136 = icmp eq i8* %arrayidx.i.i135, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i136, label %_ZNSsD2Ev.exit146, label %if.then.i.i138, !prof !22

if.then.i.i138:                                   ; preds = %ehcleanup22
  %_M_refcount.i.i137 = getelementptr inbounds i8, i8* %51, i64 -8
  %54 = bitcast i8* %_M_refcount.i.i137 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i139, label %if.else.i.i.i141

if.then.i.i.i139:                                 ; preds = %if.then.i.i138
  %55 = atomicrmw volatile add i32* %54, i32 -1 acq_rel
  br label %invoke.cont.i.i144

if.else.i.i.i141:                                 ; preds = %if.then.i.i138
  %56 = load i32, i32* %54, align 4, !tbaa !23
  %add.i.i.i.i140 = add nsw i32 %56, -1
  store i32 %add.i.i.i.i140, i32* %54, align 4, !tbaa !23
  br label %invoke.cont.i.i144

invoke.cont.i.i144:                               ; preds = %if.else.i.i.i141, %if.then.i.i.i139
  %retval.0.i.i.i142 = phi i32 [ %55, %if.then.i.i.i139 ], [ %56, %if.else.i.i.i141 ]
  %cmp3.i.i143 = icmp slt i32 %retval.0.i.i.i142, 1
  br i1 %cmp3.i.i143, label %if.then4.i.i145, label %_ZNSsD2Ev.exit146

if.then4.i.i145:                                  ; preds = %invoke.cont.i.i144
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %52, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i133) #3
  br label %_ZNSsD2Ev.exit146

_ZNSsD2Ev.exit146:                                ; preds = %if.then4.i.i145, %invoke.cont.i.i144, %ehcleanup22
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %53) #3
  br label %ehcleanup25

ehcleanup25:                                      ; preds = %_ZNSsD2Ev.exit146, %lpad
  %exn.slot.2 = phi i8* [ %exn.slot.1, %_ZNSsD2Ev.exit146 ], [ %28, %lpad ]
  %ehselector.slot.2 = phi i32 [ %ehselector.slot.1, %_ZNSsD2Ev.exit146 ], [ %29, %lpad ]
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %0) #3
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn.slot.2, 0
  %lpad.val65 = insertvalue { i8*, i32 } %lpad.val, i32 %ehselector.slot.2, 1
  resume { i8*, i32 } %lpad.val65

if.end:                                           ; preds = %_ZNSsD2Ev.exit98, %entry
  %call27 = call i32 @omp_get_thread_num() #3
  %idxprom28 = sext i32 %call27 to i64
  %arrayidx29 = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f3, i64 0, i64 %idxprom28
  %57 = bitcast %"class.std::basic_ofstream"* %arrayidx29 to %"class.std::basic_ostream"*
  %tobool.i147 = icmp eq i8* %acc_kernel_name, null
  br i1 %tobool.i147, label %if.then.i150, label %if.else.i153

if.then.i150:                                     ; preds = %if.end
  %58 = bitcast %"class.std::basic_ofstream"* %arrayidx29 to i8**
  %vtable.i = load i8*, i8** %58, align 16, !tbaa !6
  %vbase.offset.ptr.i = getelementptr i8, i8* %vtable.i, i64 -24
  %59 = bitcast i8* %vbase.offset.ptr.i to i64*
  %vbase.offset.i = load i64, i64* %59, align 8
  %60 = bitcast %"class.std::basic_ofstream"* %arrayidx29 to i8*
  %add.ptr.i = getelementptr inbounds i8, i8* %60, i64 %vbase.offset.i
  %61 = bitcast i8* %add.ptr.i to %"class.std::basic_ios"*
  %_M_streambuf_state.i.i.i148 = getelementptr inbounds i8, i8* %add.ptr.i, i64 32
  %62 = bitcast i8* %_M_streambuf_state.i.i.i148 to i32*
  %63 = load i32, i32* %62, align 8, !tbaa !8
  %or.i.i.i149 = or i32 %63, 1
  call void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %61, i32 %or.i.i.i149)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit

if.else.i153:                                     ; preds = %if.end
  %call.i.i151 = call i64 @strlen(i8* nonnull %acc_kernel_name) #3
  %call1.i152 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %57, i8* nonnull %acc_kernel_name, i64 %call.i.i151)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit: ; preds = %if.else.i153, %if.then.i150
  %call1.i155 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %57, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %tobool.i157 = icmp eq i8* %node_id, null
  br i1 %tobool.i157, label %if.then.i164, label %if.else.i167

if.then.i164:                                     ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit
  %64 = bitcast %"class.std::basic_ofstream"* %arrayidx29 to i8**
  %vtable.i158 = load i8*, i8** %64, align 16, !tbaa !6
  %vbase.offset.ptr.i159 = getelementptr i8, i8* %vtable.i158, i64 -24
  %65 = bitcast i8* %vbase.offset.ptr.i159 to i64*
  %vbase.offset.i160 = load i64, i64* %65, align 8
  %66 = bitcast %"class.std::basic_ofstream"* %arrayidx29 to i8*
  %add.ptr.i161 = getelementptr inbounds i8, i8* %66, i64 %vbase.offset.i160
  %67 = bitcast i8* %add.ptr.i161 to %"class.std::basic_ios"*
  %_M_streambuf_state.i.i.i162 = getelementptr inbounds i8, i8* %add.ptr.i161, i64 32
  %68 = bitcast i8* %_M_streambuf_state.i.i.i162 to i32*
  %69 = load i32, i32* %68, align 8, !tbaa !8
  %or.i.i.i163 = or i32 %69, 1
  call void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %67, i32 %or.i.i.i163)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit168

if.else.i167:                                     ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit
  %call.i.i165 = call i64 @strlen(i8* nonnull %node_id) #3
  %call1.i166 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %57, i8* nonnull %node_id, i64 %call.i.i165)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit168

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit168: ; preds = %if.else.i167, %if.then.i164
  %call1.i170 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %57, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %call34 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull %57, i32 %batch)
  %call1.i173 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call34, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %call36 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull %call34, i32 %in_channels)
  %call1.i176 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call36, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %call38 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull %call36, i32 %in_height)
  %call1.i179 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call38, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %call40 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull %call38, i32 %in_width)
  %call1.i182 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call40, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %call42 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull %call40, i32 %out_channels)
  %call1.i185 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call42, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %call44 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull %call42, i32 %filter_height)
  %call1.i188 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call44, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %call46 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull %call44, i32 %filter_width)
  %call1.i191 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call46, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %call.i = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIbEERSoT_(%"class.std::basic_ostream"* nonnull %call46, i1 zeroext %zero_pad)
  %call1.i194 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call.i, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %call50 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull %call.i, i32 %vert_conv_stride)
  %call1.i197 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call50, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %call52 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull %call50, i32 %horiz_conv_stride)
  %call1.i200 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call52, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %call.i202 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIbEERSoT_(%"class.std::basic_ostream"* nonnull %call52, i1 zeroext %pooling)
  %call1.i204 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call.i202, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %call57 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull %call.i202, i32 %pool_height)
  %call1.i131 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call57, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %call59 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull %call57, i32 %pool_width)
  %call1.i100 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call59, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %call61 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull %call59, i32 %vertical_pool_stride)
  %call1.i68 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call61, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %call63 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull %call61, i32 %horizontal_pool_stride)
  %call1.i = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call63, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0), i64 1)
  ret void
}

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIbEERSoT_(%"class.std::basic_ostream"*, i1 zeroext) local_unnamed_addr #1

; Function Attrs: noinline uwtable
define dso_local void @print_dense_layer(i8* %acc_kernel_name, i8* %kernel_type, i8* %run_dir, i8* %node_id, i32 %batch, i32 %in_channels, i32 %out_channels) #6 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %ref.tmp.i107 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i90 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i76 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i59 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i45 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i = alloca %"class.std::ios_base::Init", align 1
  %agg.tmp = alloca %"class.std::basic_string", align 8
  %ref.tmp = alloca %"class.std::ios_base::Init", align 1
  %agg.tmp5 = alloca %"class.std::basic_string", align 8
  %ref.tmp6 = alloca %"class.std::ios_base::Init", align 1
  %agg.tmp9 = alloca %"class.std::basic_string", align 8
  %ref.tmp10 = alloca %"class.std::ios_base::Init", align 1
  %call = tail call i32 @omp_get_thread_num() #3
  %idxprom = sext i32 %call to i64
  %_M_file.i.i = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f3, i64 0, i64 %idxprom, i32 1, i32 2
  %call.i.i = tail call zeroext i1 @_ZNKSt12__basic_fileIcE7is_openEv(%"class.std::__basic_file"* nonnull %_M_file.i.i) #17
  br i1 %call.i.i, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call2 = tail call i32 @omp_get_thread_num() #3
  %idxprom3 = sext i32 %call2 to i64
  %arrayidx4 = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f3, i64 0, i64 %idxprom3
  %0 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %0) #3
  invoke void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* nonnull %agg.tmp, i8* %run_dir, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.then
  %1 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp6, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %1) #3
  invoke void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* nonnull %agg.tmp5, i8* %kernel_type, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp6)
          to label %invoke.cont8 unwind label %lpad7

invoke.cont8:                                     ; preds = %invoke.cont
  %2 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp10, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %2) #3
  invoke void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* nonnull %agg.tmp9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.16, i64 0, i64 0), %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp10)
          to label %invoke.cont12 unwind label %lpad11

invoke.cont12:                                    ; preds = %invoke.cont8
  %call15 = invoke i8* @_Z12get_dir_nameSsSsSs(%"class.std::basic_string"* nonnull %agg.tmp, %"class.std::basic_string"* nonnull %agg.tmp5, %"class.std::basic_string"* nonnull %agg.tmp9)
          to label %invoke.cont14 unwind label %lpad13

invoke.cont14:                                    ; preds = %invoke.cont12
  %_M_filebuf.i = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f3, i64 0, i64 %idxprom3, i32 1
  %call2.i43 = invoke %"class.std::basic_filebuf"* @_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode(%"class.std::basic_filebuf"* nonnull %_M_filebuf.i, i8* %call15, i32 17)
          to label %call2.i.noexc unwind label %lpad13

call2.i.noexc:                                    ; preds = %invoke.cont14
  %tobool.i = icmp eq %"class.std::basic_filebuf"* %call2.i43, null
  %3 = bitcast %"class.std::basic_ofstream"* %arrayidx4 to i8**
  %vtable3.i = load i8*, i8** %3, align 16, !tbaa !6
  %vbase.offset.ptr4.i = getelementptr i8, i8* %vtable3.i, i64 -24
  %4 = bitcast i8* %vbase.offset.ptr4.i to i64*
  %vbase.offset5.i = load i64, i64* %4, align 8
  %5 = bitcast %"class.std::basic_ofstream"* %arrayidx4 to i8*
  %add.ptr6.i = getelementptr inbounds i8, i8* %5, i64 %vbase.offset5.i
  %6 = bitcast i8* %add.ptr6.i to %"class.std::basic_ios"*
  br i1 %tobool.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %call2.i.noexc
  %_M_streambuf_state.i.i.i = getelementptr inbounds i8, i8* %add.ptr6.i, i64 32
  %7 = bitcast i8* %_M_streambuf_state.i.i.i to i32*
  %8 = load i32, i32* %7, align 8, !tbaa !8
  %or.i.i.i = or i32 %8, 4
  invoke void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %6, i32 %or.i.i.i)
          to label %invoke.cont18 unwind label %lpad13

if.else.i:                                        ; preds = %call2.i.noexc
  invoke void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %6, i32 0)
          to label %invoke.cont18 unwind label %lpad13

invoke.cont18:                                    ; preds = %if.else.i, %if.then.i
  %_M_p.i.i.i = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp9, i64 0, i32 0, i32 0
  %9 = load i8*, i8** %_M_p.i.i.i, align 8, !tbaa !17
  %arrayidx.i.i = getelementptr inbounds i8, i8* %9, i64 -24
  %10 = bitcast i8* %arrayidx.i.i to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %11 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %11) #3
  %cmp.i.i = icmp eq i8* %arrayidx.i.i, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i, label %_ZNSsD2Ev.exit, label %if.then.i.i, !prof !22

if.then.i.i:                                      ; preds = %invoke.cont18
  %_M_refcount.i.i = getelementptr inbounds i8, i8* %9, i64 -8
  %12 = bitcast i8* %_M_refcount.i.i to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i, label %if.else.i.i.i

if.then.i.i.i:                                    ; preds = %if.then.i.i
  %13 = atomicrmw volatile add i32* %12, i32 -1 acq_rel
  br label %invoke.cont.i.i

if.else.i.i.i:                                    ; preds = %if.then.i.i
  %14 = load i32, i32* %12, align 4, !tbaa !23
  %add.i.i.i.i = add nsw i32 %14, -1
  store i32 %add.i.i.i.i, i32* %12, align 4, !tbaa !23
  br label %invoke.cont.i.i

invoke.cont.i.i:                                  ; preds = %if.else.i.i.i, %if.then.i.i.i
  %retval.0.i.i.i = phi i32 [ %13, %if.then.i.i.i ], [ %14, %if.else.i.i.i ]
  %cmp3.i.i = icmp slt i32 %retval.0.i.i.i, 1
  br i1 %cmp3.i.i, label %if.then4.i.i, label %_ZNSsD2Ev.exit

if.then4.i.i:                                     ; preds = %invoke.cont.i.i
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %10, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i) #3
  br label %_ZNSsD2Ev.exit

_ZNSsD2Ev.exit:                                   ; preds = %if.then4.i.i, %invoke.cont.i.i, %invoke.cont18
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %11) #3
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %2) #3
  %_M_p.i.i.i46 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp5, i64 0, i32 0, i32 0
  %15 = load i8*, i8** %_M_p.i.i.i46, align 8, !tbaa !17
  %arrayidx.i.i47 = getelementptr inbounds i8, i8* %15, i64 -24
  %16 = bitcast i8* %arrayidx.i.i47 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %17 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i45, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %17) #3
  %cmp.i.i48 = icmp eq i8* %arrayidx.i.i47, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i48, label %_ZNSsD2Ev.exit58, label %if.then.i.i50, !prof !22

if.then.i.i50:                                    ; preds = %_ZNSsD2Ev.exit
  %_M_refcount.i.i49 = getelementptr inbounds i8, i8* %15, i64 -8
  %18 = bitcast i8* %_M_refcount.i.i49 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i51, label %if.else.i.i.i53

if.then.i.i.i51:                                  ; preds = %if.then.i.i50
  %19 = atomicrmw volatile add i32* %18, i32 -1 acq_rel
  br label %invoke.cont.i.i56

if.else.i.i.i53:                                  ; preds = %if.then.i.i50
  %20 = load i32, i32* %18, align 4, !tbaa !23
  %add.i.i.i.i52 = add nsw i32 %20, -1
  store i32 %add.i.i.i.i52, i32* %18, align 4, !tbaa !23
  br label %invoke.cont.i.i56

invoke.cont.i.i56:                                ; preds = %if.else.i.i.i53, %if.then.i.i.i51
  %retval.0.i.i.i54 = phi i32 [ %19, %if.then.i.i.i51 ], [ %20, %if.else.i.i.i53 ]
  %cmp3.i.i55 = icmp slt i32 %retval.0.i.i.i54, 1
  br i1 %cmp3.i.i55, label %if.then4.i.i57, label %_ZNSsD2Ev.exit58

if.then4.i.i57:                                   ; preds = %invoke.cont.i.i56
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %16, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i45) #3
  br label %_ZNSsD2Ev.exit58

_ZNSsD2Ev.exit58:                                 ; preds = %if.then4.i.i57, %invoke.cont.i.i56, %_ZNSsD2Ev.exit
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %17) #3
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %1) #3
  %_M_p.i.i.i60 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp, i64 0, i32 0, i32 0
  %21 = load i8*, i8** %_M_p.i.i.i60, align 8, !tbaa !17
  %arrayidx.i.i61 = getelementptr inbounds i8, i8* %21, i64 -24
  %22 = bitcast i8* %arrayidx.i.i61 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %23 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i59, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %23) #3
  %cmp.i.i62 = icmp eq i8* %arrayidx.i.i61, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i62, label %_ZNSsD2Ev.exit72, label %if.then.i.i64, !prof !22

if.then.i.i64:                                    ; preds = %_ZNSsD2Ev.exit58
  %_M_refcount.i.i63 = getelementptr inbounds i8, i8* %21, i64 -8
  %24 = bitcast i8* %_M_refcount.i.i63 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i65, label %if.else.i.i.i67

if.then.i.i.i65:                                  ; preds = %if.then.i.i64
  %25 = atomicrmw volatile add i32* %24, i32 -1 acq_rel
  br label %invoke.cont.i.i70

if.else.i.i.i67:                                  ; preds = %if.then.i.i64
  %26 = load i32, i32* %24, align 4, !tbaa !23
  %add.i.i.i.i66 = add nsw i32 %26, -1
  store i32 %add.i.i.i.i66, i32* %24, align 4, !tbaa !23
  br label %invoke.cont.i.i70

invoke.cont.i.i70:                                ; preds = %if.else.i.i.i67, %if.then.i.i.i65
  %retval.0.i.i.i68 = phi i32 [ %25, %if.then.i.i.i65 ], [ %26, %if.else.i.i.i67 ]
  %cmp3.i.i69 = icmp slt i32 %retval.0.i.i.i68, 1
  br i1 %cmp3.i.i69, label %if.then4.i.i71, label %_ZNSsD2Ev.exit72

if.then4.i.i71:                                   ; preds = %invoke.cont.i.i70
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %22, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i59) #3
  br label %_ZNSsD2Ev.exit72

_ZNSsD2Ev.exit72:                                 ; preds = %if.then4.i.i71, %invoke.cont.i.i70, %_ZNSsD2Ev.exit58
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %23) #3
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %0) #3
  br label %if.end

lpad:                                             ; preds = %if.then
  %27 = landingpad { i8*, i32 }
          cleanup
  %28 = extractvalue { i8*, i32 } %27, 0
  %29 = extractvalue { i8*, i32 } %27, 1
  br label %ehcleanup24

lpad7:                                            ; preds = %invoke.cont
  %30 = landingpad { i8*, i32 }
          cleanup
  %31 = extractvalue { i8*, i32 } %30, 0
  %32 = extractvalue { i8*, i32 } %30, 1
  br label %ehcleanup21

lpad11:                                           ; preds = %invoke.cont8
  %33 = landingpad { i8*, i32 }
          cleanup
  %34 = extractvalue { i8*, i32 } %33, 0
  %35 = extractvalue { i8*, i32 } %33, 1
  br label %ehcleanup

lpad13:                                           ; preds = %if.else.i, %if.then.i, %invoke.cont14, %invoke.cont12
  %36 = landingpad { i8*, i32 }
          cleanup
  %37 = extractvalue { i8*, i32 } %36, 0
  %38 = extractvalue { i8*, i32 } %36, 1
  %_M_p.i.i.i77 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp9, i64 0, i32 0, i32 0
  %39 = load i8*, i8** %_M_p.i.i.i77, align 8, !tbaa !17
  %arrayidx.i.i78 = getelementptr inbounds i8, i8* %39, i64 -24
  %40 = bitcast i8* %arrayidx.i.i78 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %41 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i76, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %41) #3
  %cmp.i.i79 = icmp eq i8* %arrayidx.i.i78, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i79, label %_ZNSsD2Ev.exit89, label %if.then.i.i81, !prof !22

if.then.i.i81:                                    ; preds = %lpad13
  %_M_refcount.i.i80 = getelementptr inbounds i8, i8* %39, i64 -8
  %42 = bitcast i8* %_M_refcount.i.i80 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i82, label %if.else.i.i.i84

if.then.i.i.i82:                                  ; preds = %if.then.i.i81
  %43 = atomicrmw volatile add i32* %42, i32 -1 acq_rel
  br label %invoke.cont.i.i87

if.else.i.i.i84:                                  ; preds = %if.then.i.i81
  %44 = load i32, i32* %42, align 4, !tbaa !23
  %add.i.i.i.i83 = add nsw i32 %44, -1
  store i32 %add.i.i.i.i83, i32* %42, align 4, !tbaa !23
  br label %invoke.cont.i.i87

invoke.cont.i.i87:                                ; preds = %if.else.i.i.i84, %if.then.i.i.i82
  %retval.0.i.i.i85 = phi i32 [ %43, %if.then.i.i.i82 ], [ %44, %if.else.i.i.i84 ]
  %cmp3.i.i86 = icmp slt i32 %retval.0.i.i.i85, 1
  br i1 %cmp3.i.i86, label %if.then4.i.i88, label %_ZNSsD2Ev.exit89

if.then4.i.i88:                                   ; preds = %invoke.cont.i.i87
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %40, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i76) #3
  br label %_ZNSsD2Ev.exit89

_ZNSsD2Ev.exit89:                                 ; preds = %if.then4.i.i88, %invoke.cont.i.i87, %lpad13
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %41) #3
  br label %ehcleanup

ehcleanup:                                        ; preds = %_ZNSsD2Ev.exit89, %lpad11
  %exn.slot.0 = phi i8* [ %37, %_ZNSsD2Ev.exit89 ], [ %34, %lpad11 ]
  %ehselector.slot.0 = phi i32 [ %38, %_ZNSsD2Ev.exit89 ], [ %35, %lpad11 ]
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %2) #3
  %_M_p.i.i.i91 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp5, i64 0, i32 0, i32 0
  %45 = load i8*, i8** %_M_p.i.i.i91, align 8, !tbaa !17
  %arrayidx.i.i92 = getelementptr inbounds i8, i8* %45, i64 -24
  %46 = bitcast i8* %arrayidx.i.i92 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %47 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i90, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %47) #3
  %cmp.i.i93 = icmp eq i8* %arrayidx.i.i92, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i93, label %_ZNSsD2Ev.exit103, label %if.then.i.i95, !prof !22

if.then.i.i95:                                    ; preds = %ehcleanup
  %_M_refcount.i.i94 = getelementptr inbounds i8, i8* %45, i64 -8
  %48 = bitcast i8* %_M_refcount.i.i94 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i96, label %if.else.i.i.i98

if.then.i.i.i96:                                  ; preds = %if.then.i.i95
  %49 = atomicrmw volatile add i32* %48, i32 -1 acq_rel
  br label %invoke.cont.i.i101

if.else.i.i.i98:                                  ; preds = %if.then.i.i95
  %50 = load i32, i32* %48, align 4, !tbaa !23
  %add.i.i.i.i97 = add nsw i32 %50, -1
  store i32 %add.i.i.i.i97, i32* %48, align 4, !tbaa !23
  br label %invoke.cont.i.i101

invoke.cont.i.i101:                               ; preds = %if.else.i.i.i98, %if.then.i.i.i96
  %retval.0.i.i.i99 = phi i32 [ %49, %if.then.i.i.i96 ], [ %50, %if.else.i.i.i98 ]
  %cmp3.i.i100 = icmp slt i32 %retval.0.i.i.i99, 1
  br i1 %cmp3.i.i100, label %if.then4.i.i102, label %_ZNSsD2Ev.exit103

if.then4.i.i102:                                  ; preds = %invoke.cont.i.i101
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %46, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i90) #3
  br label %_ZNSsD2Ev.exit103

_ZNSsD2Ev.exit103:                                ; preds = %if.then4.i.i102, %invoke.cont.i.i101, %ehcleanup
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %47) #3
  br label %ehcleanup21

ehcleanup21:                                      ; preds = %_ZNSsD2Ev.exit103, %lpad7
  %exn.slot.1 = phi i8* [ %exn.slot.0, %_ZNSsD2Ev.exit103 ], [ %31, %lpad7 ]
  %ehselector.slot.1 = phi i32 [ %ehselector.slot.0, %_ZNSsD2Ev.exit103 ], [ %32, %lpad7 ]
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %1) #3
  %_M_p.i.i.i108 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp, i64 0, i32 0, i32 0
  %51 = load i8*, i8** %_M_p.i.i.i108, align 8, !tbaa !17
  %arrayidx.i.i109 = getelementptr inbounds i8, i8* %51, i64 -24
  %52 = bitcast i8* %arrayidx.i.i109 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %53 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i107, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %53) #3
  %cmp.i.i110 = icmp eq i8* %arrayidx.i.i109, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i110, label %_ZNSsD2Ev.exit120, label %if.then.i.i112, !prof !22

if.then.i.i112:                                   ; preds = %ehcleanup21
  %_M_refcount.i.i111 = getelementptr inbounds i8, i8* %51, i64 -8
  %54 = bitcast i8* %_M_refcount.i.i111 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i113, label %if.else.i.i.i115

if.then.i.i.i113:                                 ; preds = %if.then.i.i112
  %55 = atomicrmw volatile add i32* %54, i32 -1 acq_rel
  br label %invoke.cont.i.i118

if.else.i.i.i115:                                 ; preds = %if.then.i.i112
  %56 = load i32, i32* %54, align 4, !tbaa !23
  %add.i.i.i.i114 = add nsw i32 %56, -1
  store i32 %add.i.i.i.i114, i32* %54, align 4, !tbaa !23
  br label %invoke.cont.i.i118

invoke.cont.i.i118:                               ; preds = %if.else.i.i.i115, %if.then.i.i.i113
  %retval.0.i.i.i116 = phi i32 [ %55, %if.then.i.i.i113 ], [ %56, %if.else.i.i.i115 ]
  %cmp3.i.i117 = icmp slt i32 %retval.0.i.i.i116, 1
  br i1 %cmp3.i.i117, label %if.then4.i.i119, label %_ZNSsD2Ev.exit120

if.then4.i.i119:                                  ; preds = %invoke.cont.i.i118
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %52, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i107) #3
  br label %_ZNSsD2Ev.exit120

_ZNSsD2Ev.exit120:                                ; preds = %if.then4.i.i119, %invoke.cont.i.i118, %ehcleanup21
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %53) #3
  br label %ehcleanup24

ehcleanup24:                                      ; preds = %_ZNSsD2Ev.exit120, %lpad
  %exn.slot.2 = phi i8* [ %exn.slot.1, %_ZNSsD2Ev.exit120 ], [ %28, %lpad ]
  %ehselector.slot.2 = phi i32 [ %ehselector.slot.1, %_ZNSsD2Ev.exit120 ], [ %29, %lpad ]
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %0) #3
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn.slot.2, 0
  %lpad.val39 = insertvalue { i8*, i32 } %lpad.val, i32 %ehselector.slot.2, 1
  resume { i8*, i32 } %lpad.val39

if.end:                                           ; preds = %_ZNSsD2Ev.exit72, %entry
  %call26 = call i32 @omp_get_thread_num() #3
  %idxprom27 = sext i32 %call26 to i64
  %arrayidx28 = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f3, i64 0, i64 %idxprom27
  %57 = bitcast %"class.std::basic_ofstream"* %arrayidx28 to %"class.std::basic_ostream"*
  %tobool.i121 = icmp eq i8* %acc_kernel_name, null
  br i1 %tobool.i121, label %if.then.i124, label %if.else.i127

if.then.i124:                                     ; preds = %if.end
  %58 = bitcast %"class.std::basic_ofstream"* %arrayidx28 to i8**
  %vtable.i = load i8*, i8** %58, align 16, !tbaa !6
  %vbase.offset.ptr.i = getelementptr i8, i8* %vtable.i, i64 -24
  %59 = bitcast i8* %vbase.offset.ptr.i to i64*
  %vbase.offset.i = load i64, i64* %59, align 8
  %60 = bitcast %"class.std::basic_ofstream"* %arrayidx28 to i8*
  %add.ptr.i = getelementptr inbounds i8, i8* %60, i64 %vbase.offset.i
  %61 = bitcast i8* %add.ptr.i to %"class.std::basic_ios"*
  %_M_streambuf_state.i.i.i122 = getelementptr inbounds i8, i8* %add.ptr.i, i64 32
  %62 = bitcast i8* %_M_streambuf_state.i.i.i122 to i32*
  %63 = load i32, i32* %62, align 8, !tbaa !8
  %or.i.i.i123 = or i32 %63, 1
  call void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %61, i32 %or.i.i.i123)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit

if.else.i127:                                     ; preds = %if.end
  %call.i.i125 = call i64 @strlen(i8* nonnull %acc_kernel_name) #3
  %call1.i126 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %57, i8* nonnull %acc_kernel_name, i64 %call.i.i125)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit: ; preds = %if.else.i127, %if.then.i124
  %call1.i129 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %57, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %tobool.i131 = icmp eq i8* %node_id, null
  br i1 %tobool.i131, label %if.then.i138, label %if.else.i141

if.then.i138:                                     ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit
  %64 = bitcast %"class.std::basic_ofstream"* %arrayidx28 to i8**
  %vtable.i132 = load i8*, i8** %64, align 16, !tbaa !6
  %vbase.offset.ptr.i133 = getelementptr i8, i8* %vtable.i132, i64 -24
  %65 = bitcast i8* %vbase.offset.ptr.i133 to i64*
  %vbase.offset.i134 = load i64, i64* %65, align 8
  %66 = bitcast %"class.std::basic_ofstream"* %arrayidx28 to i8*
  %add.ptr.i135 = getelementptr inbounds i8, i8* %66, i64 %vbase.offset.i134
  %67 = bitcast i8* %add.ptr.i135 to %"class.std::basic_ios"*
  %_M_streambuf_state.i.i.i136 = getelementptr inbounds i8, i8* %add.ptr.i135, i64 32
  %68 = bitcast i8* %_M_streambuf_state.i.i.i136 to i32*
  %69 = load i32, i32* %68, align 8, !tbaa !8
  %or.i.i.i137 = or i32 %69, 1
  call void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %67, i32 %or.i.i.i137)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit142

if.else.i141:                                     ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit
  %call.i.i139 = call i64 @strlen(i8* nonnull %node_id) #3
  %call1.i140 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %57, i8* nonnull %node_id, i64 %call.i.i139)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit142

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit142: ; preds = %if.else.i141, %if.then.i138
  %call1.i105 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %57, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %call33 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull %57, i32 %batch)
  %call1.i74 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call33, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %call35 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull %call33, i32 %in_channels)
  %call1.i42 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call35, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
  %call37 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull %call35, i32 %out_channels)
  %call1.i = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %call37, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0), i64 1)
  ret void
}

; Function Attrs: noinline uwtable
define dso_local void @printSw(i8* %name, i8* %kernel_type, i8* %run_dir, i32 %value, i8* %def, i32 %n, ...) #6 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %ref.tmp.i183 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i160 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i146 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i129 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i115 = alloca %"class.std::ios_base::Init", align 1
  %ref.tmp.i = alloca %"class.std::ios_base::Init", align 1
  %agg.tmp = alloca %"class.std::basic_string", align 8
  %ref.tmp = alloca %"class.std::ios_base::Init", align 1
  %agg.tmp5 = alloca %"class.std::basic_string", align 8
  %ref.tmp6 = alloca %"class.std::ios_base::Init", align 1
  %agg.tmp9 = alloca %"class.std::basic_string", align 8
  %ref.tmp10 = alloca %"class.std::ios_base::Init", align 1
  %vl = alloca [1 x %struct.__va_list_tag], align 16
  %call = tail call i32 @omp_get_thread_num() #3
  %idxprom = sext i32 %call to i64
  %_M_file.i.i = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f1, i64 0, i64 %idxprom, i32 1, i32 2
  %call.i.i = tail call zeroext i1 @_ZNKSt12__basic_fileIcE7is_openEv(%"class.std::__basic_file"* nonnull %_M_file.i.i) #17
  br i1 %call.i.i, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call2 = tail call i32 @omp_get_thread_num() #3
  %idxprom3 = sext i32 %call2 to i64
  %arrayidx4 = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f1, i64 0, i64 %idxprom3
  %0 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %0) #3
  invoke void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* nonnull %agg.tmp, i8* %run_dir, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.then
  %1 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp6, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %1) #3
  invoke void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* nonnull %agg.tmp5, i8* %kernel_type, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp6)
          to label %invoke.cont8 unwind label %lpad7

invoke.cont8:                                     ; preds = %invoke.cont
  %2 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp10, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %2) #3
  invoke void @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* nonnull %agg.tmp9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i64 0, i64 0), %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp10)
          to label %invoke.cont12 unwind label %lpad11

invoke.cont12:                                    ; preds = %invoke.cont8
  %call15 = invoke i8* @_Z12get_dir_nameSsSsSs(%"class.std::basic_string"* nonnull %agg.tmp, %"class.std::basic_string"* nonnull %agg.tmp5, %"class.std::basic_string"* nonnull %agg.tmp9)
          to label %invoke.cont14 unwind label %lpad13

invoke.cont14:                                    ; preds = %invoke.cont12
  %_M_filebuf.i = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f1, i64 0, i64 %idxprom3, i32 1
  %call2.i112 = invoke %"class.std::basic_filebuf"* @_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode(%"class.std::basic_filebuf"* nonnull %_M_filebuf.i, i8* %call15, i32 17)
          to label %call2.i.noexc unwind label %lpad13

call2.i.noexc:                                    ; preds = %invoke.cont14
  %tobool.i = icmp eq %"class.std::basic_filebuf"* %call2.i112, null
  %3 = bitcast %"class.std::basic_ofstream"* %arrayidx4 to i8**
  %vtable3.i = load i8*, i8** %3, align 16, !tbaa !6
  %vbase.offset.ptr4.i = getelementptr i8, i8* %vtable3.i, i64 -24
  %4 = bitcast i8* %vbase.offset.ptr4.i to i64*
  %vbase.offset5.i = load i64, i64* %4, align 8
  %5 = bitcast %"class.std::basic_ofstream"* %arrayidx4 to i8*
  %add.ptr6.i = getelementptr inbounds i8, i8* %5, i64 %vbase.offset5.i
  %6 = bitcast i8* %add.ptr6.i to %"class.std::basic_ios"*
  br i1 %tobool.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %call2.i.noexc
  %_M_streambuf_state.i.i.i = getelementptr inbounds i8, i8* %add.ptr6.i, i64 32
  %7 = bitcast i8* %_M_streambuf_state.i.i.i to i32*
  %8 = load i32, i32* %7, align 8, !tbaa !8
  %or.i.i.i = or i32 %8, 4
  invoke void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %6, i32 %or.i.i.i)
          to label %invoke.cont18 unwind label %lpad13

if.else.i:                                        ; preds = %call2.i.noexc
  invoke void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %6, i32 0)
          to label %invoke.cont18 unwind label %lpad13

invoke.cont18:                                    ; preds = %if.else.i, %if.then.i
  %_M_p.i.i.i = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp9, i64 0, i32 0, i32 0
  %9 = load i8*, i8** %_M_p.i.i.i, align 8, !tbaa !17
  %arrayidx.i.i = getelementptr inbounds i8, i8* %9, i64 -24
  %10 = bitcast i8* %arrayidx.i.i to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %11 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %11) #3
  %cmp.i.i = icmp eq i8* %arrayidx.i.i, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i, label %_ZNSsD2Ev.exit, label %if.then.i.i, !prof !22

if.then.i.i:                                      ; preds = %invoke.cont18
  %_M_refcount.i.i = getelementptr inbounds i8, i8* %9, i64 -8
  %12 = bitcast i8* %_M_refcount.i.i to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i114, label %if.else.i.i.i

if.then.i.i.i114:                                 ; preds = %if.then.i.i
  %13 = atomicrmw volatile add i32* %12, i32 -1 acq_rel
  br label %invoke.cont.i.i

if.else.i.i.i:                                    ; preds = %if.then.i.i
  %14 = load i32, i32* %12, align 4, !tbaa !23
  %add.i.i.i.i = add nsw i32 %14, -1
  store i32 %add.i.i.i.i, i32* %12, align 4, !tbaa !23
  br label %invoke.cont.i.i

invoke.cont.i.i:                                  ; preds = %if.else.i.i.i, %if.then.i.i.i114
  %retval.0.i.i.i = phi i32 [ %13, %if.then.i.i.i114 ], [ %14, %if.else.i.i.i ]
  %cmp3.i.i = icmp slt i32 %retval.0.i.i.i, 1
  br i1 %cmp3.i.i, label %if.then4.i.i, label %_ZNSsD2Ev.exit

if.then4.i.i:                                     ; preds = %invoke.cont.i.i
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %10, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i) #3
  br label %_ZNSsD2Ev.exit

_ZNSsD2Ev.exit:                                   ; preds = %if.then4.i.i, %invoke.cont.i.i, %invoke.cont18
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %11) #3
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %2) #3
  %_M_p.i.i.i116 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp5, i64 0, i32 0, i32 0
  %15 = load i8*, i8** %_M_p.i.i.i116, align 8, !tbaa !17
  %arrayidx.i.i117 = getelementptr inbounds i8, i8* %15, i64 -24
  %16 = bitcast i8* %arrayidx.i.i117 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %17 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i115, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %17) #3
  %cmp.i.i118 = icmp eq i8* %arrayidx.i.i117, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i118, label %_ZNSsD2Ev.exit128, label %if.then.i.i120, !prof !22

if.then.i.i120:                                   ; preds = %_ZNSsD2Ev.exit
  %_M_refcount.i.i119 = getelementptr inbounds i8, i8* %15, i64 -8
  %18 = bitcast i8* %_M_refcount.i.i119 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i121, label %if.else.i.i.i123

if.then.i.i.i121:                                 ; preds = %if.then.i.i120
  %19 = atomicrmw volatile add i32* %18, i32 -1 acq_rel
  br label %invoke.cont.i.i126

if.else.i.i.i123:                                 ; preds = %if.then.i.i120
  %20 = load i32, i32* %18, align 4, !tbaa !23
  %add.i.i.i.i122 = add nsw i32 %20, -1
  store i32 %add.i.i.i.i122, i32* %18, align 4, !tbaa !23
  br label %invoke.cont.i.i126

invoke.cont.i.i126:                               ; preds = %if.else.i.i.i123, %if.then.i.i.i121
  %retval.0.i.i.i124 = phi i32 [ %19, %if.then.i.i.i121 ], [ %20, %if.else.i.i.i123 ]
  %cmp3.i.i125 = icmp slt i32 %retval.0.i.i.i124, 1
  br i1 %cmp3.i.i125, label %if.then4.i.i127, label %_ZNSsD2Ev.exit128

if.then4.i.i127:                                  ; preds = %invoke.cont.i.i126
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %16, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i115) #3
  br label %_ZNSsD2Ev.exit128

_ZNSsD2Ev.exit128:                                ; preds = %if.then4.i.i127, %invoke.cont.i.i126, %_ZNSsD2Ev.exit
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %17) #3
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %1) #3
  %_M_p.i.i.i130 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp, i64 0, i32 0, i32 0
  %21 = load i8*, i8** %_M_p.i.i.i130, align 8, !tbaa !17
  %arrayidx.i.i131 = getelementptr inbounds i8, i8* %21, i64 -24
  %22 = bitcast i8* %arrayidx.i.i131 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %23 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i129, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %23) #3
  %cmp.i.i132 = icmp eq i8* %arrayidx.i.i131, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i132, label %_ZNSsD2Ev.exit142, label %if.then.i.i134, !prof !22

if.then.i.i134:                                   ; preds = %_ZNSsD2Ev.exit128
  %_M_refcount.i.i133 = getelementptr inbounds i8, i8* %21, i64 -8
  %24 = bitcast i8* %_M_refcount.i.i133 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i135, label %if.else.i.i.i137

if.then.i.i.i135:                                 ; preds = %if.then.i.i134
  %25 = atomicrmw volatile add i32* %24, i32 -1 acq_rel
  br label %invoke.cont.i.i140

if.else.i.i.i137:                                 ; preds = %if.then.i.i134
  %26 = load i32, i32* %24, align 4, !tbaa !23
  %add.i.i.i.i136 = add nsw i32 %26, -1
  store i32 %add.i.i.i.i136, i32* %24, align 4, !tbaa !23
  br label %invoke.cont.i.i140

invoke.cont.i.i140:                               ; preds = %if.else.i.i.i137, %if.then.i.i.i135
  %retval.0.i.i.i138 = phi i32 [ %25, %if.then.i.i.i135 ], [ %26, %if.else.i.i.i137 ]
  %cmp3.i.i139 = icmp slt i32 %retval.0.i.i.i138, 1
  br i1 %cmp3.i.i139, label %if.then4.i.i141, label %_ZNSsD2Ev.exit142

if.then4.i.i141:                                  ; preds = %invoke.cont.i.i140
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %22, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i129) #3
  br label %_ZNSsD2Ev.exit142

_ZNSsD2Ev.exit142:                                ; preds = %if.then4.i.i141, %invoke.cont.i.i140, %_ZNSsD2Ev.exit128
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %23) #3
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %0) #3
  br label %if.end

lpad:                                             ; preds = %if.then
  %27 = landingpad { i8*, i32 }
          cleanup
  %28 = extractvalue { i8*, i32 } %27, 0
  %29 = extractvalue { i8*, i32 } %27, 1
  br label %ehcleanup24

lpad7:                                            ; preds = %invoke.cont
  %30 = landingpad { i8*, i32 }
          cleanup
  %31 = extractvalue { i8*, i32 } %30, 0
  %32 = extractvalue { i8*, i32 } %30, 1
  br label %ehcleanup21

lpad11:                                           ; preds = %invoke.cont8
  %33 = landingpad { i8*, i32 }
          cleanup
  %34 = extractvalue { i8*, i32 } %33, 0
  %35 = extractvalue { i8*, i32 } %33, 1
  br label %ehcleanup

lpad13:                                           ; preds = %if.else.i, %if.then.i, %invoke.cont14, %invoke.cont12
  %36 = landingpad { i8*, i32 }
          cleanup
  %37 = extractvalue { i8*, i32 } %36, 0
  %38 = extractvalue { i8*, i32 } %36, 1
  %_M_p.i.i.i147 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp9, i64 0, i32 0, i32 0
  %39 = load i8*, i8** %_M_p.i.i.i147, align 8, !tbaa !17
  %arrayidx.i.i148 = getelementptr inbounds i8, i8* %39, i64 -24
  %40 = bitcast i8* %arrayidx.i.i148 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %41 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i146, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %41) #3
  %cmp.i.i149 = icmp eq i8* %arrayidx.i.i148, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i149, label %_ZNSsD2Ev.exit159, label %if.then.i.i151, !prof !22

if.then.i.i151:                                   ; preds = %lpad13
  %_M_refcount.i.i150 = getelementptr inbounds i8, i8* %39, i64 -8
  %42 = bitcast i8* %_M_refcount.i.i150 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i152, label %if.else.i.i.i154

if.then.i.i.i152:                                 ; preds = %if.then.i.i151
  %43 = atomicrmw volatile add i32* %42, i32 -1 acq_rel
  br label %invoke.cont.i.i157

if.else.i.i.i154:                                 ; preds = %if.then.i.i151
  %44 = load i32, i32* %42, align 4, !tbaa !23
  %add.i.i.i.i153 = add nsw i32 %44, -1
  store i32 %add.i.i.i.i153, i32* %42, align 4, !tbaa !23
  br label %invoke.cont.i.i157

invoke.cont.i.i157:                               ; preds = %if.else.i.i.i154, %if.then.i.i.i152
  %retval.0.i.i.i155 = phi i32 [ %43, %if.then.i.i.i152 ], [ %44, %if.else.i.i.i154 ]
  %cmp3.i.i156 = icmp slt i32 %retval.0.i.i.i155, 1
  br i1 %cmp3.i.i156, label %if.then4.i.i158, label %_ZNSsD2Ev.exit159

if.then4.i.i158:                                  ; preds = %invoke.cont.i.i157
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %40, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i146) #3
  br label %_ZNSsD2Ev.exit159

_ZNSsD2Ev.exit159:                                ; preds = %if.then4.i.i158, %invoke.cont.i.i157, %lpad13
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %41) #3
  br label %ehcleanup

ehcleanup:                                        ; preds = %_ZNSsD2Ev.exit159, %lpad11
  %exn.slot.0 = phi i8* [ %37, %_ZNSsD2Ev.exit159 ], [ %34, %lpad11 ]
  %ehselector.slot.0 = phi i32 [ %38, %_ZNSsD2Ev.exit159 ], [ %35, %lpad11 ]
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %2) #3
  %_M_p.i.i.i161 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp5, i64 0, i32 0, i32 0
  %45 = load i8*, i8** %_M_p.i.i.i161, align 8, !tbaa !17
  %arrayidx.i.i162 = getelementptr inbounds i8, i8* %45, i64 -24
  %46 = bitcast i8* %arrayidx.i.i162 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %47 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i160, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %47) #3
  %cmp.i.i163 = icmp eq i8* %arrayidx.i.i162, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i163, label %_ZNSsD2Ev.exit173, label %if.then.i.i165, !prof !22

if.then.i.i165:                                   ; preds = %ehcleanup
  %_M_refcount.i.i164 = getelementptr inbounds i8, i8* %45, i64 -8
  %48 = bitcast i8* %_M_refcount.i.i164 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i166, label %if.else.i.i.i168

if.then.i.i.i166:                                 ; preds = %if.then.i.i165
  %49 = atomicrmw volatile add i32* %48, i32 -1 acq_rel
  br label %invoke.cont.i.i171

if.else.i.i.i168:                                 ; preds = %if.then.i.i165
  %50 = load i32, i32* %48, align 4, !tbaa !23
  %add.i.i.i.i167 = add nsw i32 %50, -1
  store i32 %add.i.i.i.i167, i32* %48, align 4, !tbaa !23
  br label %invoke.cont.i.i171

invoke.cont.i.i171:                               ; preds = %if.else.i.i.i168, %if.then.i.i.i166
  %retval.0.i.i.i169 = phi i32 [ %49, %if.then.i.i.i166 ], [ %50, %if.else.i.i.i168 ]
  %cmp3.i.i170 = icmp slt i32 %retval.0.i.i.i169, 1
  br i1 %cmp3.i.i170, label %if.then4.i.i172, label %_ZNSsD2Ev.exit173

if.then4.i.i172:                                  ; preds = %invoke.cont.i.i171
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %46, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i160) #3
  br label %_ZNSsD2Ev.exit173

_ZNSsD2Ev.exit173:                                ; preds = %if.then4.i.i172, %invoke.cont.i.i171, %ehcleanup
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %47) #3
  br label %ehcleanup21

ehcleanup21:                                      ; preds = %_ZNSsD2Ev.exit173, %lpad7
  %exn.slot.1 = phi i8* [ %exn.slot.0, %_ZNSsD2Ev.exit173 ], [ %31, %lpad7 ]
  %ehselector.slot.1 = phi i32 [ %ehselector.slot.0, %_ZNSsD2Ev.exit173 ], [ %32, %lpad7 ]
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %1) #3
  %_M_p.i.i.i184 = getelementptr inbounds %"class.std::basic_string", %"class.std::basic_string"* %agg.tmp, i64 0, i32 0, i32 0
  %51 = load i8*, i8** %_M_p.i.i.i184, align 8, !tbaa !17
  %arrayidx.i.i185 = getelementptr inbounds i8, i8* %51, i64 -24
  %52 = bitcast i8* %arrayidx.i.i185 to %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"*
  %53 = getelementptr inbounds %"class.std::ios_base::Init", %"class.std::ios_base::Init"* %ref.tmp.i183, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %53) #3
  %cmp.i.i186 = icmp eq i8* %arrayidx.i.i185, bitcast ([0 x i64]* @_ZNSs4_Rep20_S_empty_rep_storageE to i8*)
  br i1 %cmp.i.i186, label %_ZNSsD2Ev.exit196, label %if.then.i.i188, !prof !22

if.then.i.i188:                                   ; preds = %ehcleanup21
  %_M_refcount.i.i187 = getelementptr inbounds i8, i8* %51, i64 -8
  %54 = bitcast i8* %_M_refcount.i.i187 to i32*
  br i1 icmp ne (i8* bitcast (i32 (i32*, void (i8*)*)* @__pthread_key_create to i8*), i8* null), label %if.then.i.i.i189, label %if.else.i.i.i191

if.then.i.i.i189:                                 ; preds = %if.then.i.i188
  %55 = atomicrmw volatile add i32* %54, i32 -1 acq_rel
  br label %invoke.cont.i.i194

if.else.i.i.i191:                                 ; preds = %if.then.i.i188
  %56 = load i32, i32* %54, align 4, !tbaa !23
  %add.i.i.i.i190 = add nsw i32 %56, -1
  store i32 %add.i.i.i.i190, i32* %54, align 4, !tbaa !23
  br label %invoke.cont.i.i194

invoke.cont.i.i194:                               ; preds = %if.else.i.i.i191, %if.then.i.i.i189
  %retval.0.i.i.i192 = phi i32 [ %55, %if.then.i.i.i189 ], [ %56, %if.else.i.i.i191 ]
  %cmp3.i.i193 = icmp slt i32 %retval.0.i.i.i192, 1
  br i1 %cmp3.i.i193, label %if.then4.i.i195, label %_ZNSsD2Ev.exit196

if.then4.i.i195:                                  ; preds = %invoke.cont.i.i194
  call void @_ZNSs4_Rep10_M_destroyERKSaIcE(%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Rep"* nonnull %52, %"class.std::ios_base::Init"* nonnull dereferenceable(1) %ref.tmp.i183) #3
  br label %_ZNSsD2Ev.exit196

_ZNSsD2Ev.exit196:                                ; preds = %if.then4.i.i195, %invoke.cont.i.i194, %ehcleanup21
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %53) #3
  br label %ehcleanup24

ehcleanup24:                                      ; preds = %_ZNSsD2Ev.exit196, %lpad
  %exn.slot.2 = phi i8* [ %exn.slot.1, %_ZNSsD2Ev.exit196 ], [ %28, %lpad ]
  %ehselector.slot.2 = phi i32 [ %ehselector.slot.1, %_ZNSsD2Ev.exit196 ], [ %29, %lpad ]
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %0) #3
  br label %eh.resume

if.end:                                           ; preds = %_ZNSsD2Ev.exit142, %entry
  %57 = bitcast [1 x %struct.__va_list_tag]* %vl to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %57) #3
  call void @llvm.va_start(i8* nonnull %57)
  %cmp350 = icmp sgt i32 %n, 0
  br i1 %cmp350, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %if.end
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %vl, i64 0, i64 0, i32 0
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %vl, i64 0, i64 0, i32 2
  %58 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %vl, i64 0, i64 0, i32 3
  br label %for.body

for.cond.cleanup.loopexit:                        ; preds = %invoke.cont42
  %vals.sroa.11.1.le = ptrtoint i32* %vals.sroa.11.1.in to i64
  %strs.sroa.10.1.le = ptrtoint i8** %strs.sroa.10.1.in to i64
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %if.end
  %strs.sroa.0.0.lcssa = phi i64 [ 0, %if.end ], [ %strs.sroa.0.1, %for.cond.cleanup.loopexit ]
  %strs.sroa.10.0.lcssa = phi i64 [ 0, %if.end ], [ %strs.sroa.10.1.le, %for.cond.cleanup.loopexit ]
  %vals.sroa.11.0.lcssa = phi i64 [ 0, %if.end ], [ %vals.sroa.11.1.le, %for.cond.cleanup.loopexit ]
  %vals.sroa.0.0.lcssa = phi i64 [ 0, %if.end ], [ %vals.sroa.0.1, %for.cond.cleanup.loopexit ]
  call void @llvm.va_end(i8* nonnull %57)
  %sub.ptr.sub.i = sub i64 %vals.sroa.11.0.lcssa, %vals.sroa.0.0.lcssa
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, 2
  %cmp51348 = icmp eq i64 %sub.ptr.sub.i, 0
  br i1 %cmp51348, label %cleanup, label %invoke.cont56.lr.ph

invoke.cont56.lr.ph:                              ; preds = %for.cond.cleanup
  %59 = inttoptr i64 %vals.sroa.0.0.lcssa to i32*
  br label %invoke.cont56

for.body:                                         ; preds = %invoke.cont42, %for.body.lr.ph
  %i.0360 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %invoke.cont42 ]
  %vals.sroa.0.0359 = phi i64 [ 0, %for.body.lr.ph ], [ %vals.sroa.0.1, %invoke.cont42 ]
  %vals.sroa.11.0358 = phi i64 [ 0, %for.body.lr.ph ], [ %vals.sroa.11.1, %invoke.cont42 ]
  %strs.sroa.16.0357 = phi i8** [ null, %for.body.lr.ph ], [ %strs.sroa.16.1, %invoke.cont42 ]
  %strs.sroa.10.0356 = phi i64 [ 0, %for.body.lr.ph ], [ %strs.sroa.10.1, %invoke.cont42 ]
  %strs.sroa.0.0352 = phi i64 [ 0, %for.body.lr.ph ], [ %strs.sroa.0.1, %invoke.cont42 ]
  %vals.sroa.17.0351 = phi i32* [ null, %for.body.lr.ph ], [ %vals.sroa.17.1, %invoke.cont42 ]
  %gp_offset = load i32, i32* %gp_offset_p, align 16
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.end, label %vaarg.end.thread

vaarg.end.thread:                                 ; preds = %for.body
  %overflow_arg_area = load i8*, i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8, i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  %vaarg.addr366 = bitcast i8* %overflow_arg_area to i32*
  %60 = load i32, i32* %vaarg.addr366, align 4
  br label %vaarg.in_mem34

vaarg.end:                                        ; preds = %for.body
  %reg_save_area = load i8*, i8** %58, align 16
  %61 = sext i32 %gp_offset to i64
  %62 = getelementptr i8, i8* %reg_save_area, i64 %61
  %63 = add i32 %gp_offset, 8
  store i32 %63, i32* %gp_offset_p, align 16
  %vaarg.addr = bitcast i8* %62 to i32*
  %64 = load i32, i32* %vaarg.addr, align 4
  %fits_in_gp31 = icmp ult i32 %63, 41
  br i1 %fits_in_gp31, label %vaarg.in_reg32, label %vaarg.in_mem34

vaarg.in_reg32:                                   ; preds = %vaarg.end
  %reg_save_area33 = load i8*, i8** %58, align 16
  %65 = sext i32 %63 to i64
  %66 = getelementptr i8, i8* %reg_save_area33, i64 %65
  %67 = add i32 %gp_offset, 16
  store i32 %67, i32* %gp_offset_p, align 16
  br label %vaarg.end38

vaarg.in_mem34:                                   ; preds = %vaarg.end, %vaarg.end.thread
  %68 = phi i32 [ %60, %vaarg.end.thread ], [ %64, %vaarg.end ]
  %overflow_arg_area36 = load i8*, i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next37 = getelementptr i8, i8* %overflow_arg_area36, i64 8
  store i8* %overflow_arg_area.next37, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end38

vaarg.end38:                                      ; preds = %vaarg.in_mem34, %vaarg.in_reg32
  %69 = phi i32 [ %64, %vaarg.in_reg32 ], [ %68, %vaarg.in_mem34 ]
  %vaarg.addr39.in = phi i8* [ %66, %vaarg.in_reg32 ], [ %overflow_arg_area36, %vaarg.in_mem34 ]
  %70 = bitcast i8* %vaarg.addr39.in to i64*
  %71 = load i64, i64* %70, align 8
  %72 = inttoptr i64 %vals.sroa.11.0358 to i32*
  %cmp.i = icmp eq i32* %vals.sroa.17.0351, %72
  br i1 %cmp.i, label %if.else.i203, label %if.then.i202

if.then.i202:                                     ; preds = %vaarg.end38
  store i32 %69, i32* %72, align 4, !tbaa !23
  %incdec.ptr.i = getelementptr inbounds i32, i32* %72, i64 1
  br label %invoke.cont41

if.else.i203:                                     ; preds = %vaarg.end38
  %sub.ptr.sub.i21.i.i.i = sub i64 %vals.sroa.11.0358, %vals.sroa.0.0359
  %sub.ptr.div.i22.i.i.i = ashr exact i64 %sub.ptr.sub.i21.i.i.i, 2
  %cmp.i.i.i.i = icmp eq i64 %sub.ptr.sub.i21.i.i.i, 0
  %.sroa.speculated.i.i.i = select i1 %cmp.i.i.i.i, i64 1, i64 %sub.ptr.div.i22.i.i.i
  %add.i.i.i = add nsw i64 %.sroa.speculated.i.i.i, %sub.ptr.div.i22.i.i.i
  %cmp7.i.i.i = icmp ult i64 %add.i.i.i, %sub.ptr.div.i22.i.i.i
  %cmp9.i.i.i = icmp ugt i64 %add.i.i.i, 4611686018427387903
  %or.cond.i.i.i = or i1 %cmp7.i.i.i, %cmp9.i.i.i
  %cond.i.i.i = select i1 %or.cond.i.i.i, i64 4611686018427387903, i64 %add.i.i.i
  %cmp.i67.i.i = icmp eq i64 %cond.i.i.i, 0
  br i1 %cmp.i67.i.i, label %invoke.cont.i.i204, label %_ZNSt16allocator_traitsISaIiEE8allocateERS0_m.exit.i.i.i

_ZNSt16allocator_traitsISaIiEE8allocateERS0_m.exit.i.i.i: ; preds = %if.else.i203
  %mul.i.i.i.i.i = shl i64 %cond.i.i.i, 2
  %call2.i.i.i.i.i205 = invoke i8* @_Znwm(i64 %mul.i.i.i.i.i)
          to label %call2.i.i.i.i.i.noexc unwind label %lpad40

call2.i.i.i.i.i.noexc:                            ; preds = %_ZNSt16allocator_traitsISaIiEE8allocateERS0_m.exit.i.i.i
  %73 = bitcast i8* %call2.i.i.i.i.i205 to i32*
  br label %invoke.cont.i.i204

invoke.cont.i.i204:                               ; preds = %call2.i.i.i.i.i.noexc, %if.else.i203
  %74 = phi i8* [ %call2.i.i.i.i.i205, %call2.i.i.i.i.i.noexc ], [ null, %if.else.i203 ]
  %cond.i68.i.i = phi i32* [ %73, %call2.i.i.i.i.i.noexc ], [ null, %if.else.i203 ]
  %add.ptr.i.i = getelementptr inbounds i32, i32* %cond.i68.i.i, i64 %sub.ptr.div.i22.i.i.i
  store i32 %69, i32* %add.ptr.i.i, align 4, !tbaa !23
  br i1 %cmp.i.i.i.i, label %invoke.cont15.i.i, label %if.then.i.i.i.i.i.i.i.i78.i.i

if.then.i.i.i.i.i.i.i.i78.i.i:                    ; preds = %invoke.cont.i.i204
  %75 = inttoptr i64 %vals.sroa.0.0359 to i8*
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %74, i8* align 4 %75, i64 %sub.ptr.sub.i21.i.i.i, i1 false) #3
  br label %invoke.cont15.i.i

invoke.cont15.i.i:                                ; preds = %if.then.i.i.i.i.i.i.i.i78.i.i, %invoke.cont.i.i204
  %add.ptr.i.i.i.i.i.i.i.i79.i.i = getelementptr inbounds i32, i32* %cond.i68.i.i, i64 1
  %incdec.ptr.i.i = getelementptr inbounds i32, i32* %add.ptr.i.i.i.i.i.i.i.i79.i.i, i64 %sub.ptr.div.i22.i.i.i
  %tobool.i69.i.i = icmp eq i64 %vals.sroa.0.0359, 0
  br i1 %tobool.i69.i.i, label %_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_.exit.i, label %if.then.i70.i.i

if.then.i70.i.i:                                  ; preds = %invoke.cont15.i.i
  %76 = inttoptr i64 %vals.sroa.0.0359 to i8*
  call void @_ZdlPv(i8* nonnull %76) #3
  br label %_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_.exit.i

_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_.exit.i: ; preds = %if.then.i70.i.i, %invoke.cont15.i.i
  %77 = ptrtoint i8* %74 to i64
  %add.ptr39.i.i = getelementptr inbounds i32, i32* %cond.i68.i.i, i64 %cond.i.i.i
  br label %invoke.cont41

invoke.cont41:                                    ; preds = %_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_.exit.i, %if.then.i202
  %vals.sroa.17.1 = phi i32* [ %add.ptr39.i.i, %_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_.exit.i ], [ %vals.sroa.17.0351, %if.then.i202 ]
  %vals.sroa.11.1.in = phi i32* [ %incdec.ptr.i.i, %_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_.exit.i ], [ %incdec.ptr.i, %if.then.i202 ]
  %vals.sroa.0.1 = phi i64 [ %77, %_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_.exit.i ], [ %vals.sroa.0.0359, %if.then.i202 ]
  %vals.sroa.11.1 = ptrtoint i32* %vals.sroa.11.1.in to i64
  %78 = inttoptr i64 %strs.sroa.10.0356 to i8**
  %cmp.i208 = icmp eq i8** %strs.sroa.16.0357, %78
  br i1 %cmp.i208, label %if.else.i221, label %if.then.i210

if.then.i210:                                     ; preds = %invoke.cont41
  %79 = inttoptr i64 %strs.sroa.10.0356 to i64*
  store i64 %71, i64* %79, align 8, !tbaa !26
  %incdec.ptr.i209 = getelementptr inbounds i8*, i8** %78, i64 1
  br label %invoke.cont42

if.else.i221:                                     ; preds = %invoke.cont41
  %sub.ptr.sub.i21.i.i.i211 = sub i64 %strs.sroa.10.0356, %strs.sroa.0.0352
  %sub.ptr.div.i22.i.i.i212 = ashr exact i64 %sub.ptr.sub.i21.i.i.i211, 3
  %cmp.i.i.i.i213 = icmp eq i64 %sub.ptr.sub.i21.i.i.i211, 0
  %.sroa.speculated.i.i.i214 = select i1 %cmp.i.i.i.i213, i64 1, i64 %sub.ptr.div.i22.i.i.i212
  %add.i.i.i215 = add nsw i64 %.sroa.speculated.i.i.i214, %sub.ptr.div.i22.i.i.i212
  %cmp7.i.i.i216 = icmp ult i64 %add.i.i.i215, %sub.ptr.div.i22.i.i.i212
  %cmp9.i.i.i217 = icmp ugt i64 %add.i.i.i215, 2305843009213693951
  %or.cond.i.i.i218 = or i1 %cmp7.i.i.i216, %cmp9.i.i.i217
  %cond.i.i.i219 = select i1 %or.cond.i.i.i218, i64 2305843009213693951, i64 %add.i.i.i215
  %cmp.i67.i.i220 = icmp eq i64 %cond.i.i.i219, 0
  br i1 %cmp.i67.i.i220, label %invoke.cont.i.i230, label %_ZNSt16allocator_traitsISaIPcEE8allocateERS1_m.exit.i.i.i

_ZNSt16allocator_traitsISaIPcEE8allocateERS1_m.exit.i.i.i: ; preds = %if.else.i221
  %mul.i.i.i.i.i222 = shl i64 %cond.i.i.i219, 3
  %call2.i.i.i.i.i245 = invoke i8* @_Znwm(i64 %mul.i.i.i.i.i222)
          to label %call2.i.i.i.i.i.noexc244 unwind label %lpad40

call2.i.i.i.i.i.noexc244:                         ; preds = %_ZNSt16allocator_traitsISaIPcEE8allocateERS1_m.exit.i.i.i
  %80 = bitcast i8* %call2.i.i.i.i.i245 to i8**
  br label %invoke.cont.i.i230

invoke.cont.i.i230:                               ; preds = %call2.i.i.i.i.i.noexc244, %if.else.i221
  %81 = phi i8* [ %call2.i.i.i.i.i245, %call2.i.i.i.i.i.noexc244 ], [ null, %if.else.i221 ]
  %cond.i68.i.i224 = phi i8** [ %80, %call2.i.i.i.i.i.noexc244 ], [ null, %if.else.i221 ]
  %add.ptr.i.i225 = getelementptr inbounds i8*, i8** %cond.i68.i.i224, i64 %sub.ptr.div.i22.i.i.i212
  %82 = bitcast i8** %add.ptr.i.i225 to i64*
  store i64 %71, i64* %82, align 8, !tbaa !26
  br i1 %cmp.i.i.i.i213, label %invoke.cont15.i.i241, label %if.then.i.i.i.i.i.i.i.i78.i.i231

if.then.i.i.i.i.i.i.i.i78.i.i231:                 ; preds = %invoke.cont.i.i230
  %83 = inttoptr i64 %strs.sroa.0.0352 to i8*
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %81, i8* align 8 %83, i64 %sub.ptr.sub.i21.i.i.i211, i1 false) #3
  br label %invoke.cont15.i.i241

invoke.cont15.i.i241:                             ; preds = %if.then.i.i.i.i.i.i.i.i78.i.i231, %invoke.cont.i.i230
  %add.ptr.i.i.i.i.i.i.i.i79.i.i232 = getelementptr inbounds i8*, i8** %cond.i68.i.i224, i64 1
  %incdec.ptr.i.i233 = getelementptr inbounds i8*, i8** %add.ptr.i.i.i.i.i.i.i.i79.i.i232, i64 %sub.ptr.div.i22.i.i.i212
  %tobool.i69.i.i240 = icmp eq i64 %strs.sroa.0.0352, 0
  br i1 %tobool.i69.i.i240, label %_ZNSt6vectorIPcSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_.exit.i, label %if.then.i70.i.i242

if.then.i70.i.i242:                               ; preds = %invoke.cont15.i.i241
  %84 = inttoptr i64 %strs.sroa.0.0352 to i8*
  call void @_ZdlPv(i8* nonnull %84) #3
  br label %_ZNSt6vectorIPcSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_.exit.i

_ZNSt6vectorIPcSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_.exit.i: ; preds = %if.then.i70.i.i242, %invoke.cont15.i.i241
  %85 = ptrtoint i8* %81 to i64
  %add.ptr39.i.i243 = getelementptr inbounds i8*, i8** %cond.i68.i.i224, i64 %cond.i.i.i219
  br label %invoke.cont42

invoke.cont42:                                    ; preds = %_ZNSt6vectorIPcSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_.exit.i, %if.then.i210
  %strs.sroa.0.1 = phi i64 [ %85, %_ZNSt6vectorIPcSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_.exit.i ], [ %strs.sroa.0.0352, %if.then.i210 ]
  %strs.sroa.10.1.in = phi i8** [ %incdec.ptr.i.i233, %_ZNSt6vectorIPcSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_.exit.i ], [ %incdec.ptr.i209, %if.then.i210 ]
  %strs.sroa.16.1 = phi i8** [ %add.ptr39.i.i243, %_ZNSt6vectorIPcSaIS0_EE17_M_realloc_insertIJRKS0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_.exit.i ], [ %strs.sroa.16.0357, %if.then.i210 ]
  %strs.sroa.10.1 = ptrtoint i8** %strs.sroa.10.1.in to i64
  %inc = add nuw nsw i32 %i.0360, 1
  %cmp = icmp slt i32 %inc, %n
  br i1 %cmp, label %for.body, label %for.cond.cleanup.loopexit

lpad40:                                           ; preds = %_ZNSt16allocator_traitsISaIPcEE8allocateERS1_m.exit.i.i.i, %_ZNSt16allocator_traitsISaIiEE8allocateERS0_m.exit.i.i.i
  %vals.sroa.0.2 = phi i64 [ %vals.sroa.0.1, %_ZNSt16allocator_traitsISaIPcEE8allocateERS1_m.exit.i.i.i ], [ %vals.sroa.0.0359, %_ZNSt16allocator_traitsISaIiEE8allocateERS0_m.exit.i.i.i ]
  %86 = landingpad { i8*, i32 }
          cleanup
  br label %ehcleanup85

for.cond49:                                       ; preds = %invoke.cont56
  %cmp51 = icmp ugt i64 %sub.ptr.div.i, %indvars.iv.next
  br i1 %cmp51, label %invoke.cont56, label %cleanup

invoke.cont56:                                    ; preds = %for.cond49, %invoke.cont56.lr.ph
  %indvars.iv = phi i64 [ 0, %invoke.cont56.lr.ph ], [ %indvars.iv.next, %for.cond49 ]
  %add.ptr.i.i249 = getelementptr inbounds i32, i32* %59, i64 %indvars.iv
  %87 = load i32, i32* %add.ptr.i.i249, align 4, !tbaa !23
  %cmp58 = icmp eq i32 %87, %value
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  br i1 %cmp58, label %if.then59, label %for.cond49

if.then59:                                        ; preds = %invoke.cont56
  %sub.ptr.sub.i.i.i252 = sub i64 %strs.sroa.10.0.lcssa, %strs.sroa.0.0.lcssa
  %sub.ptr.div.i.i.i253 = ashr exact i64 %sub.ptr.sub.i.i.i252, 3
  %cmp.i.i254 = icmp ugt i64 %sub.ptr.div.i.i.i253, %indvars.iv
  br i1 %cmp.i.i254, label %89, label %if.then.i.i255

if.then.i.i255:                                   ; preds = %if.then59
  invoke void (i8*, ...) @_ZSt24__throw_out_of_range_fmtPKcz(i8* getelementptr inbounds ([74 x i8], [74 x i8]* @.str.26, i64 0, i64 0), i64 %indvars.iv, i64 %sub.ptr.div.i.i.i253) #19
          to label %.noexc257 unwind label %lpad55

.noexc257:                                        ; preds = %if.then.i.i255
  unreachable

lpad55:                                           ; preds = %if.then.i.i255
  %88 = landingpad { i8*, i32 }
          cleanup
  br label %ehcleanup85

89:                                               ; preds = %if.then59
  %90 = inttoptr i64 %strs.sroa.0.0.lcssa to i8**
  %add.ptr.i.i256 = getelementptr inbounds i8*, i8** %90, i64 %indvars.iv
  %91 = load i8*, i8** %add.ptr.i.i256, align 8, !tbaa !26
  br label %cleanup

cleanup:                                          ; preds = %89, %for.cond49, %for.cond.cleanup
  %92 = phi i8* [ %91, %89 ], [ %def, %for.cond.cleanup ], [ %def, %for.cond49 ]
  %call70 = call i32 @omp_get_thread_num() #3
  %idxprom71 = sext i32 %call70 to i64
  %arrayidx72 = getelementptr inbounds [1024 x %"class.std::basic_ofstream"], [1024 x %"class.std::basic_ofstream"]* @f1, i64 0, i64 %idxprom71
  %93 = bitcast %"class.std::basic_ofstream"* %arrayidx72 to %"class.std::basic_ostream"*
  %call1.i261 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %93, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.15, i64 0, i64 0), i64 2)
          to label %invoke.cont74 unwind label %lpad73

invoke.cont74:                                    ; preds = %cleanup
  %tobool.i263 = icmp eq i8* %name, null
  br i1 %tobool.i263, label %if.then.i270, label %if.else.i272

if.then.i270:                                     ; preds = %invoke.cont74
  %94 = bitcast %"class.std::basic_ofstream"* %arrayidx72 to i8**
  %vtable.i264 = load i8*, i8** %94, align 16, !tbaa !6
  %vbase.offset.ptr.i265 = getelementptr i8, i8* %vtable.i264, i64 -24
  %95 = bitcast i8* %vbase.offset.ptr.i265 to i64*
  %vbase.offset.i266 = load i64, i64* %95, align 8
  %96 = bitcast %"class.std::basic_ofstream"* %arrayidx72 to i8*
  %add.ptr.i267 = getelementptr inbounds i8, i8* %96, i64 %vbase.offset.i266
  %97 = bitcast i8* %add.ptr.i267 to %"class.std::basic_ios"*
  %_M_streambuf_state.i.i.i268 = getelementptr inbounds i8, i8* %add.ptr.i267, i64 32
  %98 = bitcast i8* %_M_streambuf_state.i.i.i268 to i32*
  %99 = load i32, i32* %98, align 8, !tbaa !8
  %or.i.i.i269 = or i32 %99, 1
  invoke void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %97, i32 %or.i.i.i269)
          to label %invoke.cont76 unwind label %lpad73

if.else.i272:                                     ; preds = %invoke.cont74
  %call.i.i271 = call i64 @strlen(i8* nonnull %name) #3
  %call1.i275 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %93, i8* nonnull %name, i64 %call.i.i271)
          to label %invoke.cont76 unwind label %lpad73

invoke.cont76:                                    ; preds = %if.else.i272, %if.then.i270
  %call1.i200 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %93, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0), i64 1)
          to label %invoke.cont78 unwind label %lpad73

invoke.cont78:                                    ; preds = %invoke.cont76
  %tobool.i174 = icmp eq i8* %92, null
  br i1 %tobool.i174, label %if.then.i177, label %if.else.i179

if.then.i177:                                     ; preds = %invoke.cont78
  %100 = bitcast %"class.std::basic_ofstream"* %arrayidx72 to i8**
  %vtable.i = load i8*, i8** %100, align 16, !tbaa !6
  %vbase.offset.ptr.i = getelementptr i8, i8* %vtable.i, i64 -24
  %101 = bitcast i8* %vbase.offset.ptr.i to i64*
  %vbase.offset.i = load i64, i64* %101, align 8
  %102 = bitcast %"class.std::basic_ofstream"* %arrayidx72 to i8*
  %add.ptr.i = getelementptr inbounds i8, i8* %102, i64 %vbase.offset.i
  %103 = bitcast i8* %add.ptr.i to %"class.std::basic_ios"*
  %_M_streambuf_state.i.i.i175 = getelementptr inbounds i8, i8* %add.ptr.i, i64 32
  %104 = bitcast i8* %_M_streambuf_state.i.i.i175 to i32*
  %105 = load i32, i32* %104, align 8, !tbaa !8
  %or.i.i.i176 = or i32 %105, 1
  invoke void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* nonnull %103, i32 %or.i.i.i176)
          to label %invoke.cont80 unwind label %lpad73

if.else.i179:                                     ; preds = %invoke.cont78
  %call.i.i178 = call i64 @strlen(i8* nonnull %92) #3
  %call1.i181 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %93, i8* nonnull %92, i64 %call.i.i178)
          to label %invoke.cont80 unwind label %lpad73

invoke.cont80:                                    ; preds = %if.else.i179, %if.then.i177
  %call1.i145 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %93, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0), i64 1)
          to label %invoke.cont82 unwind label %lpad73

invoke.cont82:                                    ; preds = %invoke.cont80
  %tobool.i.i.i109 = icmp eq i64 %strs.sroa.0.0.lcssa, 0
  br i1 %tobool.i.i.i109, label %_ZNSt6vectorIPcSaIS0_EED2Ev.exit111, label %if.then.i.i.i110

if.then.i.i.i110:                                 ; preds = %invoke.cont82
  %106 = inttoptr i64 %strs.sroa.0.0.lcssa to i8*
  call void @_ZdlPv(i8* nonnull %106) #3
  br label %_ZNSt6vectorIPcSaIS0_EED2Ev.exit111

_ZNSt6vectorIPcSaIS0_EED2Ev.exit111:              ; preds = %if.then.i.i.i110, %invoke.cont82
  %tobool.i.i.i105 = icmp eq i64 %vals.sroa.0.0.lcssa, 0
  br i1 %tobool.i.i.i105, label %_ZNSt6vectorIiSaIiEED2Ev.exit107, label %if.then.i.i.i106

if.then.i.i.i106:                                 ; preds = %_ZNSt6vectorIPcSaIS0_EED2Ev.exit111
  %107 = inttoptr i64 %vals.sroa.0.0.lcssa to i8*
  call void @_ZdlPv(i8* nonnull %107) #3
  br label %_ZNSt6vectorIiSaIiEED2Ev.exit107

_ZNSt6vectorIiSaIiEED2Ev.exit107:                 ; preds = %if.then.i.i.i106, %_ZNSt6vectorIPcSaIS0_EED2Ev.exit111
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %57) #3
  ret void

lpad73:                                           ; preds = %invoke.cont80, %if.else.i179, %if.then.i177, %invoke.cont76, %if.else.i272, %if.then.i270, %cleanup
  %108 = landingpad { i8*, i32 }
          cleanup
  br label %ehcleanup85

ehcleanup85:                                      ; preds = %lpad73, %lpad55, %lpad40
  %.sink372 = phi { i8*, i32 } [ %88, %lpad55 ], [ %108, %lpad73 ], [ %86, %lpad40 ]
  %strs.sroa.0.0346 = phi i64 [ %strs.sroa.0.0.lcssa, %lpad55 ], [ %strs.sroa.0.0.lcssa, %lpad73 ], [ %strs.sroa.0.0352, %lpad40 ]
  %vals.sroa.0.3 = phi i64 [ %vals.sroa.0.0.lcssa, %lpad55 ], [ %vals.sroa.0.0.lcssa, %lpad73 ], [ %vals.sroa.0.2, %lpad40 ]
  %109 = extractvalue { i8*, i32 } %.sink372, 0
  %110 = extractvalue { i8*, i32 } %.sink372, 1
  %tobool.i.i.i102 = icmp eq i64 %strs.sroa.0.0346, 0
  br i1 %tobool.i.i.i102, label %_ZNSt6vectorIPcSaIS0_EED2Ev.exit, label %if.then.i.i.i103

if.then.i.i.i103:                                 ; preds = %ehcleanup85
  %111 = inttoptr i64 %strs.sroa.0.0346 to i8*
  call void @_ZdlPv(i8* nonnull %111) #3
  br label %_ZNSt6vectorIPcSaIS0_EED2Ev.exit

_ZNSt6vectorIPcSaIS0_EED2Ev.exit:                 ; preds = %if.then.i.i.i103, %ehcleanup85
  %tobool.i.i.i = icmp eq i64 %vals.sroa.0.3, 0
  br i1 %tobool.i.i.i, label %_ZNSt6vectorIiSaIiEED2Ev.exit, label %if.then.i.i.i

if.then.i.i.i:                                    ; preds = %_ZNSt6vectorIPcSaIS0_EED2Ev.exit
  %112 = inttoptr i64 %vals.sroa.0.3 to i8*
  call void @_ZdlPv(i8* nonnull %112) #3
  br label %_ZNSt6vectorIiSaIiEED2Ev.exit

_ZNSt6vectorIiSaIiEED2Ev.exit:                    ; preds = %if.then.i.i.i, %_ZNSt6vectorIPcSaIS0_EED2Ev.exit
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %57) #3
  br label %eh.resume

eh.resume:                                        ; preds = %_ZNSt6vectorIiSaIiEED2Ev.exit, %ehcleanup24
  %exn.slot.5 = phi i8* [ %109, %_ZNSt6vectorIiSaIiEED2Ev.exit ], [ %exn.slot.2, %ehcleanup24 ]
  %ehselector.slot.5 = phi i32 [ %110, %_ZNSt6vectorIiSaIiEED2Ev.exit ], [ %ehselector.slot.2, %ehcleanup24 ]
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn.slot.5, 0
  %lpad.val91 = insertvalue { i8*, i32 } %lpad.val, i32 %ehselector.slot.5, 1
  resume { i8*, i32 } %lpad.val91
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #3

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #3

; Function Attrs: nobuiltin
declare dso_local noalias nonnull i8* @_Znwm(i64) local_unnamed_addr #11

; Function Attrs: argmemonly nounwind
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i1 immarg) #9

; Function Attrs: nobuiltin nounwind
declare dso_local void @_ZdlPv(i8*) local_unnamed_addr #12

; Function Attrs: noreturn
declare dso_local void @_ZSt24__throw_out_of_range_fmtPKcz(i8*, ...) local_unnamed_addr #13

; Function Attrs: nounwind uwtable
define dso_local noalias %struct.pb_Parameters* @pb_ReadParameters(i32* nocapture %_argc, i8** %argv) local_unnamed_addr #5 {
entry:
  %call = tail call noalias i8* @malloc(i64 16) #3
  %tmp = bitcast i8* %call to %struct.pb_Parameters*
  %outFile = bitcast i8* %call to i8**
  store i8* null, i8** %outFile, align 8, !tbaa !27
  %call1 = tail call noalias i8* @malloc(i64 8) #3
  %tmp1 = bitcast i8* %call1 to i8**
  %inpFiles = getelementptr inbounds i8, i8* %call, i64 8
  %tmp2 = bitcast i8* %inpFiles to i8**
  store i8* %call1, i8** %tmp2, align 8, !tbaa !29
  store i8* null, i8** %tmp1, align 8, !tbaa !26
  %tmp3 = load i32, i32* %_argc, align 4, !tbaa !23
  %cmp.i121 = icmp eq i32 %tmp3, 0
  br i1 %cmp.i121, label %end_of_options.thread, label %while.body

while.body:                                       ; preds = %cleanup, %entry
  %ap.sroa.0.0128 = phi i32 [ %ap.sroa.0.1, %cleanup ], [ %tmp3, %entry ]
  %ap.sroa.45.0126 = phi i8** [ %ap.sroa.45.1, %cleanup ], [ %argv, %entry ]
  %ap.sroa.31111.0124 = phi i8** [ %ap.sroa.31111.1, %cleanup ], [ %argv, %entry ]
  %ap.sroa.19.0122 = phi i32 [ %ap.sroa.19.1, %cleanup ], [ 0, %entry ]
  %ap.idx55.val.val = load i8*, i8** %ap.sroa.31111.0124, align 8, !tbaa !26
  %tmp4 = load i8, i8* %ap.idx55.val.val, align 1, !tbaa !30
  %cmp = icmp eq i8 %tmp4, 45
  %tmp5 = ptrtoint i8* %ap.idx55.val.val to i64
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %while.body
  %arrayidx6 = getelementptr inbounds i8, i8* %ap.idx55.val.val, i64 1
  %tmp6 = load i8, i8* %arrayidx6, align 1, !tbaa !30
  %cmp8 = icmp eq i8 %tmp6, 0
  br i1 %cmp8, label %if.else, label %land.lhs.true9

land.lhs.true9:                                   ; preds = %land.lhs.true
  %arrayidx10 = getelementptr inbounds i8, i8* %ap.idx55.val.val, i64 2
  %tmp7 = load i8, i8* %arrayidx10, align 1, !tbaa !30
  %cmp12 = icmp eq i8 %tmp7, 0
  br i1 %cmp12, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true9
  %cmp.i57 = icmp slt i32 %ap.sroa.19.0122, %ap.sroa.0.0128
  br i1 %cmp.i57, label %_ZL15delete_argumentP8argparse.exit, label %if.then.i

if.then.i:                                        ; preds = %if.then
  %tmp8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !26
  %tmp9 = tail call i64 @fwrite(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.23, i64 0, i64 0), i64 16, i64 1, %struct._IO_FILE* %tmp8) #20
  %.pre = load i8, i8* %arrayidx6, align 1, !tbaa !30
  br label %_ZL15delete_argumentP8argparse.exit

_ZL15delete_argumentP8argparse.exit:              ; preds = %if.then.i, %if.then
  %tmp10 = phi i8 [ %tmp6, %if.then ], [ %.pre, %if.then.i ]
  %dec.i = add nsw i32 %ap.sroa.0.0128, -1
  %incdec.ptr.i = getelementptr inbounds i8*, i8** %ap.sroa.31111.0124, i64 1
  %conv14 = sext i8 %tmp10 to i32
  switch i32 %conv14, label %error [
    i32 111, label %sw.bb
    i32 105, label %sw.bb22
    i32 45, label %end_of_options
  ]

sw.bb:                                            ; preds = %_ZL15delete_argumentP8argparse.exit
  %cmp.i59 = icmp eq i32 %ap.sroa.19.0122, %dec.i
  br i1 %cmp.i59, label %error, label %if.end

if.end:                                           ; preds = %sw.bb
  %tmp11 = load i8*, i8** %outFile, align 8, !tbaa !27
  tail call void @free(i8* %tmp11) #3
  %ap.idx.val.val.i = load i8*, i8** %incdec.ptr.i, align 8, !tbaa !26
  %cmp.i.i = icmp slt i32 %ap.sroa.19.0122, %dec.i
  br i1 %cmp.i.i, label %_ZL16consume_argumentP8argparse.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %if.end
  %tmp12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !26
  %tmp13 = tail call i64 @fwrite(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.23, i64 0, i64 0), i64 16, i64 1, %struct._IO_FILE* %tmp12) #20
  br label %_ZL16consume_argumentP8argparse.exit

_ZL16consume_argumentP8argparse.exit:             ; preds = %if.then.i.i, %if.end
  %dec.i.i = add nsw i32 %ap.sroa.0.0128, -2
  %incdec.ptr.i.i62 = getelementptr inbounds i8*, i8** %ap.sroa.31111.0124, i64 2
  %call20 = tail call noalias i8* @strdup(i8* %ap.idx.val.val.i) #3
  store i8* %call20, i8** %outFile, align 8, !tbaa !27
  br label %cleanup

sw.bb22:                                          ; preds = %_ZL15delete_argumentP8argparse.exit
  %cmp.i63 = icmp eq i32 %ap.sroa.19.0122, %dec.i
  br i1 %cmp.i63, label %error, label %if.end26

if.end26:                                         ; preds = %sw.bb22
  %ap.idx.val.val.i83 = load i8*, i8** %incdec.ptr.i, align 8, !tbaa !26
  %cmp.i.i86 = icmp slt i32 %ap.sroa.19.0122, %dec.i
  br i1 %cmp.i.i86, label %_ZL16consume_argumentP8argparse.exit92, label %if.then.i.i89

if.then.i.i89:                                    ; preds = %if.end26
  %tmp14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !26
  %tmp15 = tail call i64 @fwrite(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.23, i64 0, i64 0), i64 16, i64 1, %struct._IO_FILE* %tmp14) #20
  br label %_ZL16consume_argumentP8argparse.exit92

_ZL16consume_argumentP8argparse.exit92:           ; preds = %if.then.i.i89, %if.end26
  %dec.i.i90 = add nsw i32 %ap.sroa.0.0128, -2
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.inc.i, %_ZL16consume_argumentP8argparse.exit92
  %indvars.iv68.i = phi i64 [ %indvars.iv.next69.i, %for.inc.i ], [ 0, %_ZL16consume_argumentP8argparse.exit92 ]
  %count.0.i = phi i32 [ %count.1.i, %for.inc.i ], [ 1, %_ZL16consume_argumentP8argparse.exit92 ]
  %arrayidx.i = getelementptr inbounds i8, i8* %ap.idx.val.val.i83, i64 %indvars.iv68.i
  %tmp16 = load i8, i8* %arrayidx.i, align 1, !tbaa !30
  switch i8 %tmp16, label %for.inc.i [
    i8 0, label %for.end.i
    i8 44, label %if.then.i94
  ]

if.then.i94:                                      ; preds = %for.cond.i
  %inc.i93 = add nsw i32 %count.0.i, 1
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i94, %for.cond.i
  %count.1.i = phi i32 [ %inc.i93, %if.then.i94 ], [ %count.0.i, %for.cond.i ]
  %indvars.iv.next69.i = add nuw i64 %indvars.iv68.i, 1
  br label %for.cond.i

for.end.i:                                        ; preds = %for.cond.i
  %incdec.ptr.i.i91 = getelementptr inbounds i8*, i8** %ap.sroa.31111.0124, i64 2
  %add.i = add nsw i32 %count.0.i, 1
  %conv4.i = sext i32 %add.i to i64
  %mul.i = shl nsw i64 %conv4.i, 3
  %call.i = tail call noalias i8* @malloc(i64 %mul.i) #3
  %tmp17 = bitcast i8* %call.i to i8**
  %cmp665.i = icmp sgt i32 %count.0.i, 0
  br i1 %cmp665.i, label %for.cond8.preheader.preheader.i, label %_ZL17read_string_arrayPc.exit

for.cond8.preheader.preheader.i:                  ; preds = %for.end.i
  %wide.trip.count.i = zext i32 %count.0.i to i64
  br label %for.cond8.preheader.i

for.cond8.preheader.i:                            ; preds = %for.end15.i, %for.cond8.preheader.preheader.i
  %indvars.iv.i = phi i64 [ 0, %for.cond8.preheader.preheader.i ], [ %indvars.iv.next.i, %for.end15.i ]
  %substring.066.i = phi i8* [ %ap.idx.val.val.i83, %for.cond8.preheader.preheader.i ], [ %add.ptr.i, %for.end15.i ]
  br label %for.cond8.i

for.cond8.i:                                      ; preds = %for.inc14.i, %for.cond8.preheader.i
  %substring_end.0.i = phi i8* [ %incdec.ptr.i95, %for.inc14.i ], [ %substring.066.i, %for.cond8.preheader.i ]
  %tmp18 = load i8, i8* %substring_end.0.i, align 1, !tbaa !30
  switch i8 %tmp18, label %for.inc14.i [
    i8 44, label %for.end15.i
    i8 0, label %for.end15.i
  ]

for.inc14.i:                                      ; preds = %for.cond8.i
  %incdec.ptr.i95 = getelementptr inbounds i8, i8* %substring_end.0.i, i64 1
  br label %for.cond8.i

for.end15.i:                                      ; preds = %for.cond8.i, %for.cond8.i
  %sub.ptr.lhs.cast.i = ptrtoint i8* %substring_end.0.i to i64
  %sub.ptr.rhs.cast.i = ptrtoint i8* %substring.066.i to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %add17.i = shl i64 %sub.ptr.sub.i, 32
  %sext.i = add i64 %add17.i, 4294967296
  %conv18.i = ashr exact i64 %sext.i, 32
  %call19.i = tail call noalias i8* @malloc(i64 %conv18.i) #3
  %arrayidx21.i = getelementptr inbounds i8*, i8** %tmp17, i64 %indvars.iv.i
  store i8* %call19.i, i8** %arrayidx21.i, align 8, !tbaa !26
  %conv24.i = ashr exact i64 %add17.i, 32
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %call19.i, i8* align 1 %substring.066.i, i64 %conv24.i, i1 false) #3
  %arrayidx28.i = getelementptr inbounds i8, i8* %call19.i, i64 %conv24.i
  store i8 0, i8* %arrayidx28.i, align 1, !tbaa !30
  %add.ptr.i = getelementptr inbounds i8, i8* %substring_end.0.i, i64 1
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, %wide.trip.count.i
  br i1 %exitcond.i, label %_ZL17read_string_arrayPc.exit, label %for.cond8.preheader.i

_ZL17read_string_arrayPc.exit:                    ; preds = %for.end15.i, %for.end.i
  %i.1.lcssa.i = phi i64 [ 0, %for.end.i ], [ %wide.trip.count.i, %for.end15.i ]
  %arrayidx33.i = getelementptr inbounds i8*, i8** %tmp17, i64 %i.1.lcssa.i
  store i8* null, i8** %arrayidx33.i, align 8, !tbaa !26
  store i8* %call.i, i8** %tmp2, align 8, !tbaa !29
  br label %cleanup

if.else:                                          ; preds = %land.lhs.true9, %land.lhs.true, %while.body
  %cmp.i73 = icmp slt i32 %ap.sroa.19.0122, %ap.sroa.0.0128
  br i1 %cmp.i73, label %_ZL13next_argumentP8argparse.exit, label %if.then.i75

if.then.i75:                                      ; preds = %if.else
  %tmp19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !26
  %tmp20 = tail call i64 @fwrite(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.24, i64 0, i64 0), i64 14, i64 1, %struct._IO_FILE* %tmp19) #20
  %.phi.trans.insert = bitcast i8** %ap.sroa.31111.0124 to i64*
  %.pre138 = load i64, i64* %.phi.trans.insert, align 8, !tbaa !26
  br label %_ZL13next_argumentP8argparse.exit

_ZL13next_argumentP8argparse.exit:                ; preds = %if.then.i75, %if.else
  %tmp21 = phi i64 [ %.pre138, %if.then.i75 ], [ %tmp5, %if.else ]
  %incdec.ptr.i77 = getelementptr inbounds i8*, i8** %ap.sroa.31111.0124, i64 1
  %incdec.ptr1.i79 = getelementptr inbounds i8*, i8** %ap.sroa.45.0126, i64 1
  %tmp22 = bitcast i8** %ap.sroa.45.0126 to i64*
  store i64 %tmp21, i64* %tmp22, align 8, !tbaa !26
  %inc.i80 = add nsw i32 %ap.sroa.19.0122, 1
  br label %cleanup

cleanup:                                          ; preds = %_ZL13next_argumentP8argparse.exit, %_ZL17read_string_arrayPc.exit, %_ZL16consume_argumentP8argparse.exit
  %ap.sroa.19.1 = phi i32 [ %inc.i80, %_ZL13next_argumentP8argparse.exit ], [ %ap.sroa.19.0122, %_ZL17read_string_arrayPc.exit ], [ %ap.sroa.19.0122, %_ZL16consume_argumentP8argparse.exit ]
  %ap.sroa.31111.1 = phi i8** [ %incdec.ptr.i77, %_ZL13next_argumentP8argparse.exit ], [ %incdec.ptr.i.i91, %_ZL17read_string_arrayPc.exit ], [ %incdec.ptr.i.i62, %_ZL16consume_argumentP8argparse.exit ]
  %ap.sroa.45.1 = phi i8** [ %incdec.ptr1.i79, %_ZL13next_argumentP8argparse.exit ], [ %ap.sroa.45.0126, %_ZL17read_string_arrayPc.exit ], [ %ap.sroa.45.0126, %_ZL16consume_argumentP8argparse.exit ]
  %ap.sroa.0.1 = phi i32 [ %ap.sroa.0.0128, %_ZL13next_argumentP8argparse.exit ], [ %dec.i.i90, %_ZL17read_string_arrayPc.exit ], [ %dec.i.i, %_ZL16consume_argumentP8argparse.exit ]
  %cmp.i = icmp eq i32 %ap.sroa.19.1, %ap.sroa.0.1
  br i1 %cmp.i, label %end_of_options.thread, label %while.body

end_of_options.thread:                            ; preds = %cleanup, %entry
  %ap.sroa.0.2.ph = phi i32 [ 0, %entry ], [ %ap.sroa.19.1, %cleanup ]
  store i32 %ap.sroa.0.2.ph, i32* %_argc, align 4, !tbaa !23
  br label %cleanup33

end_of_options:                                   ; preds = %_ZL15delete_argumentP8argparse.exit
  store i32 %dec.i, i32* %_argc, align 4, !tbaa !23
  %cmp7.i = icmp slt i32 %ap.sroa.19.0122, %dec.i
  br i1 %cmp7.i, label %for.body.i, label %cleanup33

for.body.i:                                       ; preds = %for.body.i, %end_of_options
  %ap.sroa.31111.3 = phi i8** [ %incdec.ptr.i69, %for.body.i ], [ %incdec.ptr.i, %end_of_options ]
  %ap.sroa.45.3 = phi i8** [ %incdec.ptr1.i, %for.body.i ], [ %ap.sroa.45.0126, %end_of_options ]
  %tmp23 = phi i32 [ %inc.i, %for.body.i ], [ %ap.sroa.19.0122, %end_of_options ]
  %incdec.ptr.i69 = getelementptr inbounds i8*, i8** %ap.sroa.31111.3, i64 1
  %tmp24 = bitcast i8** %ap.sroa.31111.3 to i64*
  %tmp25 = load i64, i64* %tmp24, align 8, !tbaa !26
  %incdec.ptr1.i = getelementptr inbounds i8*, i8** %ap.sroa.45.3, i64 1
  %tmp26 = bitcast i8** %ap.sroa.45.3 to i64*
  store i64 %tmp25, i64* %tmp26, align 8, !tbaa !26
  %inc.i = add nsw i32 %tmp23, 1
  %exitcond = icmp eq i32 %inc.i, %dec.i
  br i1 %exitcond, label %cleanup33, label %for.body.i

error:                                            ; preds = %sw.bb22, %sw.bb, %_ZL15delete_argumentP8argparse.exit
  %err_message.1.ph = phi i8* [ getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1.1, i64 0, i64 0), %sw.bb22 ], [ getelementptr inbounds ([32 x i8], [32 x i8]* @.str.17, i64 0, i64 0), %sw.bb ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.2.18, i64 0, i64 0), %_ZL15delete_argumentP8argparse.exit ]
  %tmp27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !26
  %call32 = tail call i32 @fputs(i8* nonnull %err_message.1.ph, %struct._IO_FILE* %tmp27) #21
  %tmp28 = load i8*, i8** %outFile, align 8, !tbaa !27
  tail call void @free(i8* %tmp28) #3
  %tmp29 = bitcast i8* %inpFiles to i8***
  %tmp30 = load i8**, i8*** %tmp29, align 8, !tbaa !29
  %tobool.i.i = icmp eq i8** %tmp30, null
  br i1 %tobool.i.i, label %pb_FreeParameters.exit, label %for.cond.preheader.i.i

for.cond.preheader.i.i:                           ; preds = %error
  %tmp31 = load i8*, i8** %tmp30, align 8, !tbaa !26
  %tobool17.i.i = icmp eq i8* %tmp31, null
  br i1 %tobool17.i.i, label %for.end.i.i, label %for.body.i.i

for.body.i.i:                                     ; preds = %for.body.i.i, %for.cond.preheader.i.i
  %tmp32 = phi i8* [ %tmp33, %for.body.i.i ], [ %tmp31, %for.cond.preheader.i.i ]
  %p.08.i.i = phi i8** [ %incdec.ptr.i.i, %for.body.i.i ], [ %tmp30, %for.cond.preheader.i.i ]
  tail call void @free(i8* nonnull %tmp32) #3
  %incdec.ptr.i.i = getelementptr inbounds i8*, i8** %p.08.i.i, i64 1
  %tmp33 = load i8*, i8** %incdec.ptr.i.i, align 8, !tbaa !26
  %tobool1.i.i = icmp eq i8* %tmp33, null
  br i1 %tobool1.i.i, label %for.end.i.i, label %for.body.i.i

for.end.i.i:                                      ; preds = %for.body.i.i, %for.cond.preheader.i.i
  %tmp34 = bitcast i8** %tmp30 to i8*
  tail call void @free(i8* %tmp34) #3
  br label %pb_FreeParameters.exit

pb_FreeParameters.exit:                           ; preds = %for.end.i.i, %error
  tail call void @free(i8* %call) #3
  br label %cleanup33

cleanup33:                                        ; preds = %pb_FreeParameters.exit, %for.body.i, %end_of_options, %end_of_options.thread
  %retval.0 = phi %struct.pb_Parameters* [ null, %pb_FreeParameters.exit ], [ %tmp, %end_of_options ], [ %tmp, %end_of_options.thread ], [ %tmp, %for.body.i ]
  ret %struct.pb_Parameters* %retval.0
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare dso_local noalias i8* @strdup(i8* nocapture readonly) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #9

; Function Attrs: nounwind
declare dso_local i32 @fputs(i8* nocapture readonly, %struct._IO_FILE* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define dso_local void @pb_FreeParameters(%struct.pb_Parameters* nocapture %p) local_unnamed_addr #5 {
entry:
  %outFile = getelementptr inbounds %struct.pb_Parameters, %struct.pb_Parameters* %p, i64 0, i32 0
  %tmp = load i8*, i8** %outFile, align 8, !tbaa !27
  tail call void @free(i8* %tmp) #3
  %inpFiles = getelementptr inbounds %struct.pb_Parameters, %struct.pb_Parameters* %p, i64 0, i32 1
  %tmp1 = load i8**, i8*** %inpFiles, align 8, !tbaa !29
  %tobool.i = icmp eq i8** %tmp1, null
  br i1 %tobool.i, label %_ZL17free_string_arrayPPc.exit, label %for.cond.preheader.i

for.cond.preheader.i:                             ; preds = %entry
  %tmp2 = load i8*, i8** %tmp1, align 8, !tbaa !26
  %tobool17.i = icmp eq i8* %tmp2, null
  br i1 %tobool17.i, label %for.end.i, label %for.body.i

for.body.i:                                       ; preds = %for.body.i, %for.cond.preheader.i
  %tmp3 = phi i8* [ %tmp4, %for.body.i ], [ %tmp2, %for.cond.preheader.i ]
  %p.08.i = phi i8** [ %incdec.ptr.i, %for.body.i ], [ %tmp1, %for.cond.preheader.i ]
  tail call void @free(i8* nonnull %tmp3) #3
  %incdec.ptr.i = getelementptr inbounds i8*, i8** %p.08.i, i64 1
  %tmp4 = load i8*, i8** %incdec.ptr.i, align 8, !tbaa !26
  %tobool1.i = icmp eq i8* %tmp4, null
  br i1 %tobool1.i, label %for.end.i, label %for.body.i

for.end.i:                                        ; preds = %for.body.i, %for.cond.preheader.i
  %tmp5 = bitcast i8** %tmp1 to i8*
  tail call void @free(i8* %tmp5) #3
  br label %_ZL17free_string_arrayPPc.exit

_ZL17free_string_arrayPPc.exit:                   ; preds = %for.end.i, %entry
  %tmp6 = bitcast %struct.pb_Parameters* %p to i8*
  tail call void @free(i8* %tmp6) #3
  ret void
}

; Function Attrs: norecurse nounwind readonly uwtable
define dso_local i32 @pb_Parameters_CountInputs(%struct.pb_Parameters* nocapture readonly %p) local_unnamed_addr #14 {
entry:
  %inpFiles = getelementptr inbounds %struct.pb_Parameters, %struct.pb_Parameters* %p, i64 0, i32 1
  %tmp = load i8**, i8*** %inpFiles, align 8, !tbaa !29
  br label %for.cond

for.cond:                                         ; preds = %for.cond, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.cond ], [ 0, %entry ]
  %arrayidx = getelementptr inbounds i8*, i8** %tmp, i64 %indvars.iv
  %tmp1 = load i8*, i8** %arrayidx, align 8, !tbaa !26
  %tobool = icmp eq i8* %tmp1, null
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  br i1 %tobool, label %for.end, label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp2 = trunc i64 %indvars.iv to i32
  ret i32 %tmp2
}

; Function Attrs: norecurse nounwind uwtable writeonly
define dso_local void @pb_ResetTimer(%struct.pb_Timer* nocapture %timer) local_unnamed_addr #15 {
entry:
  %state = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %timer, i64 0, i32 0
  store i32 0, i32* %state, align 8, !tbaa !31
  %elapsed = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %timer, i64 0, i32 1
  store i64 0, i64* %elapsed, align 8, !tbaa !35
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @pb_StartTimer(%struct.pb_Timer* nocapture %timer) local_unnamed_addr #5 {
entry:
  %tv = alloca %struct.timeval, align 8
  %state = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %timer, i64 0, i32 0
  %tmp = load i32, i32* %state, align 8, !tbaa !31
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %tmp1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !26
  %tmp2 = tail call i64 @fwrite(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.3.19, i64 0, i64 0), i64 42, i64 1, %struct._IO_FILE* %tmp1) #21
  br label %return

if.end:                                           ; preds = %entry
  store i32 1, i32* %state, align 8, !tbaa !31
  %tmp3 = bitcast %struct.timeval* %tv to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %tmp3) #3
  %call2 = call i32 @gettimeofday(%struct.timeval* nonnull %tv, %struct.timezone* null) #3
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i64 0, i32 0
  %tmp4 = load i64, i64* %tv_sec, align 8, !tbaa !36
  %mul = mul nsw i64 %tmp4, 1000000
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i64 0, i32 1
  %tmp5 = load i64, i64* %tv_usec, align 8, !tbaa !38
  %add = add nsw i64 %mul, %tmp5
  %init = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %timer, i64 0, i32 2
  store i64 %add, i64* %init, align 8, !tbaa !39
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %tmp3) #3
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: nounwind
declare dso_local i32 @gettimeofday(%struct.timeval* nocapture, %struct.timezone* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define dso_local void @_Z24pb_StartTimerAndSubTimerP8pb_TimerS0_(%struct.pb_Timer* nocapture %timer, %struct.pb_Timer* nocapture %subtimer) local_unnamed_addr #5 {
entry:
  %tv = alloca %struct.timeval, align 8
  %state = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %timer, i64 0, i32 0
  %tmp = load i32, i32* %state, align 8, !tbaa !31
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %tmp1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !26
  %tmp2 = tail call i64 @fwrite(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4.20, i64 0, i64 0), i64 31, i64 1, %struct._IO_FILE* %tmp1) #21
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %numNotStopped.0 = phi i32 [ 1, %if.then ], [ 3, %entry ]
  %state1 = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %subtimer, i64 0, i32 0
  %tmp3 = load i32, i32* %state1, align 8, !tbaa !31
  %cmp2 = icmp eq i32 %tmp3, 0
  br i1 %cmp2, label %if.end10, label %if.end6

if.end6:                                          ; preds = %if.end
  %tmp4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !26
  %tmp5 = tail call i64 @fwrite(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.5.21, i64 0, i64 0), i64 34, i64 1, %struct._IO_FILE* %tmp4) #21
  %and5 = and i32 %numNotStopped.0, 2
  %cmp7 = icmp eq i32 %and5, 0
  br i1 %cmp7, label %if.then8, label %if.end10

if.then8:                                         ; preds = %if.end6
  %tmp6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !26
  %tmp7 = tail call i64 @fwrite(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.6.22, i64 0, i64 0), i64 53, i64 1, %struct._IO_FILE* %tmp6) #21
  br label %cleanup

if.end10:                                         ; preds = %if.end6, %if.end
  %numNotStopped.136 = phi i32 [ %and5, %if.end6 ], [ %numNotStopped.0, %if.end ]
  store i32 1, i32* %state, align 8, !tbaa !31
  store i32 1, i32* %state1, align 8, !tbaa !31
  %tmp8 = bitcast %struct.timeval* %tv to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %tmp8) #3
  %call13 = call i32 @gettimeofday(%struct.timeval* nonnull %tv, %struct.timezone* null) #3
  %and14 = and i32 %numNotStopped.136, 2
  %tobool = icmp eq i32 %and14, 0
  br i1 %tobool, label %if.end16, label %if.then15

if.then15:                                        ; preds = %if.end10
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i64 0, i32 0
  %tmp9 = load i64, i64* %tv_sec, align 8, !tbaa !36
  %mul = mul nsw i64 %tmp9, 1000000
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i64 0, i32 1
  %tmp10 = load i64, i64* %tv_usec, align 8, !tbaa !38
  %add = add nsw i64 %mul, %tmp10
  %init = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %timer, i64 0, i32 2
  store i64 %add, i64* %init, align 8, !tbaa !39
  br label %if.end16

if.end16:                                         ; preds = %if.then15, %if.end10
  %and17 = and i32 %numNotStopped.136, 1
  %tobool18 = icmp eq i32 %and17, 0
  br i1 %tobool18, label %if.end25, label %if.then19

if.then19:                                        ; preds = %if.end16
  %tv_sec20 = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i64 0, i32 0
  %tmp11 = load i64, i64* %tv_sec20, align 8, !tbaa !36
  %mul21 = mul nsw i64 %tmp11, 1000000
  %tv_usec22 = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i64 0, i32 1
  %tmp12 = load i64, i64* %tv_usec22, align 8, !tbaa !38
  %add23 = add nsw i64 %mul21, %tmp12
  %init24 = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %subtimer, i64 0, i32 2
  store i64 %add23, i64* %init24, align 8, !tbaa !39
  br label %if.end25

if.end25:                                         ; preds = %if.then19, %if.end16
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %tmp8) #3
  br label %cleanup

cleanup:                                          ; preds = %if.end25, %if.then8
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @pb_StopTimer(%struct.pb_Timer* nocapture %timer) local_unnamed_addr #5 {
entry:
  %tv = alloca %struct.timeval, align 8
  %state = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %timer, i64 0, i32 0
  %tmp = load i32, i32* %state, align 8, !tbaa !31
  %cmp = icmp eq i32 %tmp, 1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %tmp1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !26
  %tmp2 = tail call i64 @fwrite(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.7.23, i64 0, i64 0), i64 41, i64 1, %struct._IO_FILE* %tmp1) #21
  br label %cleanup

if.end:                                           ; preds = %entry
  store i32 0, i32* %state, align 8, !tbaa !31
  %tmp3 = bitcast %struct.timeval* %tv to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %tmp3) #3
  %call2 = call i32 @gettimeofday(%struct.timeval* nonnull %tv, %struct.timezone* null) #3
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i64 0, i32 0
  %tmp4 = load i64, i64* %tv_sec, align 8, !tbaa !36
  %mul = mul nsw i64 %tmp4, 1000000
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i64 0, i32 1
  %tmp5 = load i64, i64* %tv_usec, align 8, !tbaa !38
  %add = add nsw i64 %mul, %tmp5
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %tmp3) #3
  %elapsed = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %timer, i64 0, i32 1
  %init = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %timer, i64 0, i32 2
  %tmp6 = load i64, i64* %init, align 8, !tbaa !39
  %sub.i = sub i64 %add, %tmp6
  %tmp7 = load i64, i64* %elapsed, align 8, !tbaa !40
  %add.i = add i64 %sub.i, %tmp7
  store i64 %add.i, i64* %elapsed, align 8, !tbaa !40
  store i64 %add, i64* %init, align 8, !tbaa !39
  br label %cleanup

cleanup:                                          ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @_Z23pb_StopTimerAndSubTimerP8pb_TimerS0_(%struct.pb_Timer* nocapture %timer, %struct.pb_Timer* nocapture %subtimer) local_unnamed_addr #5 {
entry:
  %tv = alloca %struct.timeval, align 8
  %state = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %timer, i64 0, i32 0
  %tmp = load i32, i32* %state, align 8, !tbaa !31
  %cmp = icmp eq i32 %tmp, 1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %tmp1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !26
  %tmp2 = tail call i64 @fwrite(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.8.24, i64 0, i64 0), i64 31, i64 1, %struct._IO_FILE* %tmp1) #21
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %numNotRunning.0 = phi i32 [ 1, %if.then ], [ 3, %entry ]
  %state1 = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %subtimer, i64 0, i32 0
  %tmp3 = load i32, i32* %state1, align 8, !tbaa !31
  %cmp2 = icmp eq i32 %tmp3, 1
  br i1 %cmp2, label %if.end10, label %if.end6

if.end6:                                          ; preds = %if.end
  %tmp4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !26
  %tmp5 = tail call i64 @fwrite(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.9.25, i64 0, i64 0), i64 34, i64 1, %struct._IO_FILE* %tmp4) #21
  %and5 = and i32 %numNotRunning.0, 2
  %cmp7 = icmp eq i32 %and5, 0
  br i1 %cmp7, label %if.then8, label %if.end10

if.then8:                                         ; preds = %if.end6
  %tmp6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !26
  %tmp7 = tail call i64 @fwrite(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.10.26, i64 0, i64 0), i64 52, i64 1, %struct._IO_FILE* %tmp6) #21
  br label %cleanup

if.end10:                                         ; preds = %if.end6, %if.end
  %numNotRunning.146 = phi i32 [ %and5, %if.end6 ], [ %numNotRunning.0, %if.end ]
  store i32 0, i32* %state, align 8, !tbaa !31
  store i32 0, i32* %state1, align 8, !tbaa !31
  %tmp8 = bitcast %struct.timeval* %tv to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %tmp8) #3
  %call13 = call i32 @gettimeofday(%struct.timeval* nonnull %tv, %struct.timezone* null) #3
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i64 0, i32 0
  %tmp9 = load i64, i64* %tv_sec, align 8, !tbaa !36
  %mul = mul nsw i64 %tmp9, 1000000
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i64 0, i32 1
  %tmp10 = load i64, i64* %tv_usec, align 8, !tbaa !38
  %add = add nsw i64 %mul, %tmp10
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %tmp8) #3
  %and14 = and i32 %numNotRunning.146, 2
  %tobool = icmp eq i32 %and14, 0
  br i1 %tobool, label %if.end17, label %if.then15

if.then15:                                        ; preds = %if.end10
  %elapsed = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %timer, i64 0, i32 1
  %init = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %timer, i64 0, i32 2
  %tmp11 = load i64, i64* %init, align 8, !tbaa !39
  %sub.i = sub i64 %add, %tmp11
  %tmp12 = load i64, i64* %elapsed, align 8, !tbaa !40
  %add.i = add i64 %sub.i, %tmp12
  store i64 %add.i, i64* %elapsed, align 8, !tbaa !40
  store i64 %add, i64* %init, align 8, !tbaa !39
  br label %if.end17

if.end17:                                         ; preds = %if.then15, %if.end10
  %and18 = and i32 %numNotRunning.146, 1
  %tobool19 = icmp eq i32 %and18, 0
  br i1 %tobool19, label %cleanup, label %if.then20

if.then20:                                        ; preds = %if.end17
  %elapsed21 = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %subtimer, i64 0, i32 1
  %init22 = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %subtimer, i64 0, i32 2
  %tmp13 = load i64, i64* %init22, align 8, !tbaa !39
  %sub.i43 = sub i64 %add, %tmp13
  %tmp14 = load i64, i64* %elapsed21, align 8, !tbaa !40
  %add.i44 = add i64 %sub.i43, %tmp14
  store i64 %add.i44, i64* %elapsed21, align 8, !tbaa !40
  store i64 %add, i64* %init22, align 8, !tbaa !39
  br label %cleanup

cleanup:                                          ; preds = %if.then20, %if.end17, %if.then8
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local double @pb_GetElapsedTime(%struct.pb_Timer* nocapture readonly %timer) local_unnamed_addr #5 {
entry:
  %state = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %timer, i64 0, i32 0
  %tmp = load i32, i32* %state, align 8, !tbaa !31
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %tmp1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !26
  %tmp2 = tail call i64 @fwrite(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.11.27, i64 0, i64 0), i64 48, i64 1, %struct._IO_FILE* %tmp1) #21
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %elapsed = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %timer, i64 0, i32 1
  %tmp3 = load i64, i64* %elapsed, align 8, !tbaa !35
  %conv = uitofp i64 %tmp3 to double
  %div = fdiv double %conv, 1.000000e+06
  ret double %div
}

; Function Attrs: nounwind uwtable
define dso_local void @pb_InitializeTimerSet(%struct.pb_TimerSet* nocapture %timers) local_unnamed_addr #5 {
entry:
  %tv.i = alloca %struct.timeval, align 8
  %tmp = bitcast %struct.timeval* %tv.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %tmp) #3
  %call.i = call i32 @gettimeofday(%struct.timeval* nonnull %tv.i, %struct.timezone* null) #3
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i, i64 0, i32 0
  %tmp1 = load i64, i64* %tv_sec.i, align 8, !tbaa !36
  %mul.i = mul nsw i64 %tmp1, 1000000
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i, i64 0, i32 1
  %tmp2 = load i64, i64* %tv_usec.i, align 8, !tbaa !38
  %add.i = add nsw i64 %mul.i, %tmp2
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %tmp) #3
  %wall_begin = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 3
  store i64 %add.i, i64* %wall_begin, align 8, !tbaa !41
  %current = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 0
  store i32 0, i32* %current, align 8, !tbaa !44
  %async_markers = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 1
  store %struct.pb_async_time_marker_list* null, %struct.pb_async_time_marker_list** %async_markers, align 8, !tbaa !45
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %state.i = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 4, i64 %indvars.iv, i32 0
  store i32 0, i32* %state.i, align 8, !tbaa !31
  %elapsed.i = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 4, i64 %indvars.iv, i32 1
  store i64 0, i64* %elapsed.i, align 8, !tbaa !35
  %arrayidx3 = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 5, i64 %indvars.iv
  store %struct.pb_SubTimerList* null, %struct.pb_SubTimerList** %arrayidx3, align 8, !tbaa !26
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 8
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @pb_AddSubTimer(%struct.pb_TimerSet* nocapture %timers, i8* nocapture readonly %label, i32 %pb_Category) local_unnamed_addr #5 {
entry:
  %call = tail call noalias i8* @malloc(i64 40) #3
  %call1 = tail call i64 @strlen(i8* %label) #17
  %add = shl i64 %call1, 32
  %sext = add i64 %add, 4294967296
  %conv2 = ashr exact i64 %sext, 32
  %call3 = tail call noalias i8* @malloc(i64 %conv2) #3
  %label4 = bitcast i8* %call to i8**
  store i8* %call3, i8** %label4, align 8, !tbaa !46
  %strlen = tail call i64 @strlen(i8* %label)
  %leninc = add i64 %strlen, 1
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %call3, i8* align 1 %label, i64 %leninc, i1 false)
  %timer = getelementptr inbounds i8, i8* %call, i64 8
  %state.i = bitcast i8* %timer to i32*
  store i32 0, i32* %state.i, align 8, !tbaa !31
  %elapsed.i = getelementptr inbounds i8, i8* %call, i64 16
  %tmp = bitcast i8* %elapsed.i to i64*
  store i64 0, i64* %tmp, align 8, !tbaa !35
  %next = getelementptr inbounds i8, i8* %call, i64 32
  %tmp1 = bitcast i8* %next to %struct.pb_SubTimer**
  store %struct.pb_SubTimer* null, %struct.pb_SubTimer** %tmp1, align 8, !tbaa !48
  %idxprom = zext i32 %pb_Category to i64
  %arrayidx = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 5, i64 %idxprom
  %tmp2 = load %struct.pb_SubTimerList*, %struct.pb_SubTimerList** %arrayidx, align 8, !tbaa !26
  %cmp = icmp eq %struct.pb_SubTimerList* %tmp2, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call7 = tail call noalias i8* @malloc(i64 16) #3
  %subtimer_list = getelementptr inbounds i8, i8* %call7, i64 8
  %tmp3 = bitcast i8* %subtimer_list to i8**
  store i8* %call, i8** %tmp3, align 8, !tbaa !49
  %tmp4 = bitcast %struct.pb_SubTimerList** %arrayidx to i8**
  store i8* %call7, i8** %tmp4, align 8, !tbaa !26
  br label %if.end

if.else:                                          ; preds = %entry
  %subtimer_list11 = getelementptr inbounds %struct.pb_SubTimerList, %struct.pb_SubTimerList* %tmp2, i64 0, i32 1
  %tmp5 = load %struct.pb_SubTimer*, %struct.pb_SubTimer** %subtimer_list11, align 8, !tbaa !49
  br label %while.cond

while.cond:                                       ; preds = %while.cond, %if.else
  %element.0 = phi %struct.pb_SubTimer* [ %tmp5, %if.else ], [ %tmp6, %while.cond ]
  %next12 = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %element.0, i64 0, i32 2
  %tmp6 = load %struct.pb_SubTimer*, %struct.pb_SubTimer** %next12, align 8, !tbaa !48
  %cmp13 = icmp eq %struct.pb_SubTimer* %tmp6, null
  br i1 %cmp13, label %while.end, label %while.cond

while.end:                                        ; preds = %while.cond
  %next12.le = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %element.0, i64 0, i32 2
  %tmp7 = bitcast %struct.pb_SubTimer** %next12.le to i8**
  store i8* %call, i8** %tmp7, align 8, !tbaa !48
  br label %if.end

if.end:                                           ; preds = %while.end, %if.then
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @pb_SwitchToSubTimer(%struct.pb_TimerSet* %timers, i8* readonly %label, i32 %category) local_unnamed_addr #5 {
entry:
  %tv.i131 = alloca %struct.timeval, align 8
  %tv.i120 = alloca %struct.timeval, align 8
  %tv.i105 = alloca %struct.timeval, align 8
  %tv.i = alloca %struct.timeval, align 8
  %current = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 0
  %tmp = load i32, i32* %current, align 8, !tbaa !44
  %cmp = icmp eq i32 %tmp, %category
  %cmp2 = icmp eq i32 %tmp, 0
  %or.cond104 = or i1 %cmp, %cmp2
  %idxprom = zext i32 %tmp to i64
  %arrayidx = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 4, i64 %idxprom
  %topLevelToStop.0 = select i1 %or.cond104, %struct.pb_Timer* null, %struct.pb_Timer* %arrayidx
  %arrayidx7 = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 5, i64 %idxprom
  %tmp1 = load %struct.pb_SubTimerList*, %struct.pb_SubTimerList** %arrayidx7, align 8, !tbaa !26
  %cmp8 = icmp eq %struct.pb_SubTimerList* %tmp1, null
  br i1 %cmp8, label %cond.end, label %cond.false

cond.false:                                       ; preds = %entry
  %current9 = getelementptr inbounds %struct.pb_SubTimerList, %struct.pb_SubTimerList* %tmp1, i64 0, i32 0
  %tmp2 = load %struct.pb_SubTimer*, %struct.pb_SubTimer** %current9, align 8, !tbaa !51
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %entry
  %cond = phi %struct.pb_SubTimer* [ %tmp2, %cond.false ], [ null, %entry ]
  br i1 %cmp2, label %if.end23, label %if.then12

if.then12:                                        ; preds = %cond.end
  %cmp13 = icmp ne %struct.pb_SubTimer* %cond, null
  %cmp15 = icmp ne %struct.pb_Timer* %topLevelToStop.0, null
  %or.cond = and i1 %cmp15, %cmp13
  br i1 %or.cond, label %if.then16, label %if.else

if.then16:                                        ; preds = %if.then12
  %timer = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %cond, i64 0, i32 1
  tail call void @_Z23pb_StopTimerAndSubTimerP8pb_TimerS0_(%struct.pb_Timer* nonnull %topLevelToStop.0, %struct.pb_Timer* nonnull %timer)
  br label %if.end23

if.else:                                          ; preds = %if.then12
  br i1 %cmp13, label %if.then18, label %if.else20

if.then18:                                        ; preds = %if.else
  %state.i = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %cond, i64 0, i32 1, i32 0
  %tmp3 = load i32, i32* %state.i, align 8, !tbaa !31
  %cmp.i = icmp eq i32 %tmp3, 1
  br i1 %cmp.i, label %if.end.i, label %if.then.i

if.then.i:                                        ; preds = %if.then18
  %tmp4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !26
  %tmp5 = tail call i64 @fwrite(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.7.23, i64 0, i64 0), i64 41, i64 1, %struct._IO_FILE* %tmp4) #20
  br label %if.end23

if.end.i:                                         ; preds = %if.then18
  store i32 0, i32* %state.i, align 8, !tbaa !31
  %tmp6 = bitcast %struct.timeval* %tv.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %tmp6) #3
  %call2.i = call i32 @gettimeofday(%struct.timeval* nonnull %tv.i, %struct.timezone* null) #3
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i, i64 0, i32 0
  %tmp7 = load i64, i64* %tv_sec.i, align 8, !tbaa !36
  %mul.i = mul nsw i64 %tmp7, 1000000
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i, i64 0, i32 1
  %tmp8 = load i64, i64* %tv_usec.i, align 8, !tbaa !38
  %add.i = add nsw i64 %mul.i, %tmp8
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %tmp6) #3
  %elapsed.i = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %cond, i64 0, i32 1, i32 1
  %init.i = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %cond, i64 0, i32 1, i32 2
  %tmp9 = load i64, i64* %init.i, align 8, !tbaa !39
  %sub.i.i = sub i64 %add.i, %tmp9
  %tmp10 = load i64, i64* %elapsed.i, align 8, !tbaa !40
  %add.i.i = add i64 %sub.i.i, %tmp10
  store i64 %add.i.i, i64* %elapsed.i, align 8, !tbaa !40
  store i64 %add.i, i64* %init.i, align 8, !tbaa !39
  br label %if.end23

if.else20:                                        ; preds = %if.else
  %state.i106 = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %topLevelToStop.0, i64 0, i32 0
  %tmp11 = load i32, i32* %state.i106, align 8, !tbaa !31
  %cmp.i107 = icmp eq i32 %tmp11, 1
  br i1 %cmp.i107, label %if.end.i118, label %if.then.i108

if.then.i108:                                     ; preds = %if.else20
  %tmp12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !26
  %tmp13 = tail call i64 @fwrite(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.7.23, i64 0, i64 0), i64 41, i64 1, %struct._IO_FILE* %tmp12) #20
  br label %if.end23

if.end.i118:                                      ; preds = %if.else20
  store i32 0, i32* %state.i106, align 8, !tbaa !31
  %tmp14 = bitcast %struct.timeval* %tv.i105 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %tmp14) #3
  %call2.i109 = call i32 @gettimeofday(%struct.timeval* nonnull %tv.i105, %struct.timezone* null) #3
  %tv_sec.i110 = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i105, i64 0, i32 0
  %tmp15 = load i64, i64* %tv_sec.i110, align 8, !tbaa !36
  %mul.i111 = mul nsw i64 %tmp15, 1000000
  %tv_usec.i112 = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i105, i64 0, i32 1
  %tmp16 = load i64, i64* %tv_usec.i112, align 8, !tbaa !38
  %add.i113 = add nsw i64 %mul.i111, %tmp16
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %tmp14) #3
  %elapsed.i114 = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %topLevelToStop.0, i64 0, i32 1
  %init.i115 = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %topLevelToStop.0, i64 0, i32 2
  %tmp17 = load i64, i64* %init.i115, align 8, !tbaa !39
  %sub.i.i116 = sub i64 %add.i113, %tmp17
  %tmp18 = load i64, i64* %elapsed.i114, align 8, !tbaa !40
  %add.i.i117 = add i64 %sub.i.i116, %tmp18
  store i64 %add.i.i117, i64* %elapsed.i114, align 8, !tbaa !40
  store i64 %add.i113, i64* %init.i115, align 8, !tbaa !39
  br label %if.end23

if.end23:                                         ; preds = %if.end.i118, %if.then.i108, %if.end.i, %if.then.i, %if.then16, %cond.end
  %idxprom25 = zext i32 %category to i64
  %arrayidx26 = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 5, i64 %idxprom25
  %tmp19 = load %struct.pb_SubTimerList*, %struct.pb_SubTimerList** %arrayidx26, align 8, !tbaa !26
  %cmp27 = icmp eq i8* %label, null
  br i1 %cmp27, label %if.end35, label %if.then28

if.then28:                                        ; preds = %if.end23
  %subtimer_list = getelementptr inbounds %struct.pb_SubTimerList, %struct.pb_SubTimerList* %tmp19, i64 0, i32 1
  %subtimer.0144 = load %struct.pb_SubTimer*, %struct.pb_SubTimer** %subtimer_list, align 8, !tbaa !26
  %cmp29145 = icmp eq %struct.pb_SubTimer* %subtimer.0144, null
  br i1 %cmp29145, label %if.end35, label %while.body

while.body:                                       ; preds = %if.else33, %if.then28
  %subtimer.0146 = phi %struct.pb_SubTimer* [ %subtimer.0, %if.else33 ], [ %subtimer.0144, %if.then28 ]
  %label30 = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %subtimer.0146, i64 0, i32 0
  %tmp20 = load i8*, i8** %label30, align 8, !tbaa !46
  %call = tail call i32 @strcmp(i8* %tmp20, i8* nonnull %label) #17
  %cmp31 = icmp eq i32 %call, 0
  br i1 %cmp31, label %if.end35, label %if.else33

if.else33:                                        ; preds = %while.body
  %next = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %subtimer.0146, i64 0, i32 2
  %subtimer.0 = load %struct.pb_SubTimer*, %struct.pb_SubTimer** %next, align 8, !tbaa !26
  %cmp29 = icmp eq %struct.pb_SubTimer* %subtimer.0, null
  br i1 %cmp29, label %if.end35, label %while.body

if.end35:                                         ; preds = %if.else33, %while.body, %if.then28, %if.end23
  %subtimer.1 = phi %struct.pb_SubTimer* [ null, %if.end23 ], [ null, %if.then28 ], [ %subtimer.0146, %while.body ], [ null, %if.else33 ]
  %cmp36 = icmp eq i32 %category, 0
  br i1 %cmp36, label %if.end61, label %if.then37

if.then37:                                        ; preds = %if.end35
  %cmp38 = icmp eq %struct.pb_SubTimerList* %tmp19, null
  br i1 %cmp38, label %if.end41, label %if.then39

if.then39:                                        ; preds = %if.then37
  %current40 = getelementptr inbounds %struct.pb_SubTimerList, %struct.pb_SubTimerList* %tmp19, i64 0, i32 0
  store %struct.pb_SubTimer* %subtimer.1, %struct.pb_SubTimer** %current40, align 8, !tbaa !51
  br label %if.end41

if.end41:                                         ; preds = %if.then39, %if.then37
  %tmp21 = load i32, i32* %current, align 8, !tbaa !44
  %cmp43 = icmp ne i32 %tmp21, %category
  %cmp45 = icmp ne %struct.pb_SubTimer* %subtimer.1, null
  %or.cond63 = and i1 %cmp45, %cmp43
  br i1 %or.cond63, label %if.then46, label %if.else51

if.then46:                                        ; preds = %if.end41
  %arrayidx49 = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 4, i64 %idxprom25
  %timer50 = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %subtimer.1, i64 0, i32 1
  tail call void @_Z24pb_StartTimerAndSubTimerP8pb_TimerS0_(%struct.pb_Timer* nonnull %arrayidx49, %struct.pb_Timer* nonnull %timer50)
  br label %if.end61

if.else51:                                        ; preds = %if.end41
  br i1 %cmp45, label %if.then53, label %if.else55

if.then53:                                        ; preds = %if.else51
  %state.i121 = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %subtimer.1, i64 0, i32 1, i32 0
  %tmp22 = load i32, i32* %state.i121, align 8, !tbaa !31
  %cmp.i122 = icmp eq i32 %tmp22, 0
  br i1 %cmp.i122, label %if.end.i130, label %if.then.i123

if.then.i123:                                     ; preds = %if.then53
  %tmp23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !26
  %tmp24 = tail call i64 @fwrite(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.3.19, i64 0, i64 0), i64 42, i64 1, %struct._IO_FILE* %tmp23) #20
  br label %if.end61

if.end.i130:                                      ; preds = %if.then53
  store i32 1, i32* %state.i121, align 8, !tbaa !31
  %tmp25 = bitcast %struct.timeval* %tv.i120 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %tmp25) #3
  %call2.i124 = call i32 @gettimeofday(%struct.timeval* nonnull %tv.i120, %struct.timezone* null) #3
  %tv_sec.i125 = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i120, i64 0, i32 0
  %tmp26 = load i64, i64* %tv_sec.i125, align 8, !tbaa !36
  %mul.i126 = mul nsw i64 %tmp26, 1000000
  %tv_usec.i127 = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i120, i64 0, i32 1
  %tmp27 = load i64, i64* %tv_usec.i127, align 8, !tbaa !38
  %add.i128 = add nsw i64 %mul.i126, %tmp27
  %init.i129 = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %subtimer.1, i64 0, i32 1, i32 2
  store i64 %add.i128, i64* %init.i129, align 8, !tbaa !39
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %tmp25) #3
  br label %if.end61

if.else55:                                        ; preds = %if.else51
  %state.i132 = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 4, i64 %idxprom25, i32 0
  %tmp28 = load i32, i32* %state.i132, align 8, !tbaa !31
  %cmp.i133 = icmp eq i32 %tmp28, 0
  br i1 %cmp.i133, label %if.end.i141, label %if.then.i134

if.then.i134:                                     ; preds = %if.else55
  %tmp29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !26
  %tmp30 = tail call i64 @fwrite(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.3.19, i64 0, i64 0), i64 42, i64 1, %struct._IO_FILE* %tmp29) #20
  br label %if.end61

if.end.i141:                                      ; preds = %if.else55
  store i32 1, i32* %state.i132, align 8, !tbaa !31
  %tmp31 = bitcast %struct.timeval* %tv.i131 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %tmp31) #3
  %call2.i135 = call i32 @gettimeofday(%struct.timeval* nonnull %tv.i131, %struct.timezone* null) #3
  %tv_sec.i136 = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i131, i64 0, i32 0
  %tmp32 = load i64, i64* %tv_sec.i136, align 8, !tbaa !36
  %mul.i137 = mul nsw i64 %tmp32, 1000000
  %tv_usec.i138 = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i131, i64 0, i32 1
  %tmp33 = load i64, i64* %tv_usec.i138, align 8, !tbaa !38
  %add.i139 = add nsw i64 %mul.i137, %tmp33
  %init.i140 = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 4, i64 %idxprom25, i32 2
  store i64 %add.i139, i64* %init.i140, align 8, !tbaa !39
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %tmp31) #3
  br label %if.end61

if.end61:                                         ; preds = %if.end.i141, %if.then.i134, %if.end.i130, %if.then.i123, %if.then46, %if.end35
  store i32 %category, i32* %current, align 8, !tbaa !44
  ret void
}

; Function Attrs: nounwind readonly
declare dso_local i32 @strcmp(i8* nocapture, i8* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind uwtable
define dso_local void @pb_SwitchToTimer(%struct.pb_TimerSet* nocapture %timers, i32 %timer) local_unnamed_addr #5 {
entry:
  %tv.i43 = alloca %struct.timeval, align 8
  %tv.i = alloca %struct.timeval, align 8
  %current = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 0
  %tmp = load i32, i32* %current, align 8, !tbaa !44
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %if.end21, label %if.then

if.then:                                          ; preds = %entry
  %idxprom = zext i32 %tmp to i64
  %arrayidx = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 5, i64 %idxprom
  %tmp1 = load %struct.pb_SubTimerList*, %struct.pb_SubTimerList** %arrayidx, align 8, !tbaa !26
  %cmp2 = icmp eq %struct.pb_SubTimerList* %tmp1, null
  br i1 %cmp2, label %if.else, label %if.end

if.end:                                           ; preds = %if.then
  %current8 = getelementptr inbounds %struct.pb_SubTimerList, %struct.pb_SubTimerList* %tmp1, i64 0, i32 0
  %tmp2 = load %struct.pb_SubTimer*, %struct.pb_SubTimer** %current8, align 8, !tbaa !51
  %cmp9 = icmp eq %struct.pb_SubTimer* %tmp2, null
  br i1 %cmp9, label %if.else, label %if.then10

if.then10:                                        ; preds = %if.end
  %arrayidx14 = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 4, i64 %idxprom
  %timer15 = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %tmp2, i64 0, i32 1
  tail call void @_Z23pb_StopTimerAndSubTimerP8pb_TimerS0_(%struct.pb_Timer* nonnull %arrayidx14, %struct.pb_Timer* nonnull %timer15)
  br label %if.end21

if.else:                                          ; preds = %if.end, %if.then
  %state.i = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 4, i64 %idxprom, i32 0
  %tmp3 = load i32, i32* %state.i, align 8, !tbaa !31
  %cmp.i = icmp eq i32 %tmp3, 1
  br i1 %cmp.i, label %if.end.i, label %if.then.i

if.then.i:                                        ; preds = %if.else
  %tmp4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !26
  %tmp5 = tail call i64 @fwrite(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.7.23, i64 0, i64 0), i64 41, i64 1, %struct._IO_FILE* %tmp4) #20
  br label %if.end21

if.end.i:                                         ; preds = %if.else
  store i32 0, i32* %state.i, align 8, !tbaa !31
  %tmp6 = bitcast %struct.timeval* %tv.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %tmp6) #3
  %call2.i = call i32 @gettimeofday(%struct.timeval* nonnull %tv.i, %struct.timezone* null) #3
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i, i64 0, i32 0
  %tmp7 = load i64, i64* %tv_sec.i, align 8, !tbaa !36
  %mul.i = mul nsw i64 %tmp7, 1000000
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i, i64 0, i32 1
  %tmp8 = load i64, i64* %tv_usec.i, align 8, !tbaa !38
  %add.i = add nsw i64 %mul.i, %tmp8
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %tmp6) #3
  %elapsed.i = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 4, i64 %idxprom, i32 1
  %init.i = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 4, i64 %idxprom, i32 2
  %tmp9 = load i64, i64* %init.i, align 8, !tbaa !39
  %sub.i.i = sub i64 %add.i, %tmp9
  %tmp10 = load i64, i64* %elapsed.i, align 8, !tbaa !40
  %add.i.i = add i64 %sub.i.i, %tmp10
  store i64 %add.i.i, i64* %elapsed.i, align 8, !tbaa !40
  store i64 %add.i, i64* %init.i, align 8, !tbaa !39
  br label %if.end21

if.end21:                                         ; preds = %if.end.i, %if.then.i, %if.then10, %entry
  store i32 %timer, i32* %current, align 8, !tbaa !44
  %cmp23 = icmp eq i32 %timer, 0
  br i1 %cmp23, label %if.end28, label %if.then24

if.then24:                                        ; preds = %if.end21
  %idxprom26 = zext i32 %timer to i64
  %state.i44 = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 4, i64 %idxprom26, i32 0
  %tmp11 = load i32, i32* %state.i44, align 8, !tbaa !31
  %cmp.i45 = icmp eq i32 %tmp11, 0
  br i1 %cmp.i45, label %if.end.i53, label %if.then.i46

if.then.i46:                                      ; preds = %if.then24
  %tmp12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !26
  %tmp13 = tail call i64 @fwrite(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.3.19, i64 0, i64 0), i64 42, i64 1, %struct._IO_FILE* %tmp12) #20
  br label %if.end28

if.end.i53:                                       ; preds = %if.then24
  store i32 1, i32* %state.i44, align 8, !tbaa !31
  %tmp14 = bitcast %struct.timeval* %tv.i43 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %tmp14) #3
  %call2.i47 = call i32 @gettimeofday(%struct.timeval* nonnull %tv.i43, %struct.timezone* null) #3
  %tv_sec.i48 = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i43, i64 0, i32 0
  %tmp15 = load i64, i64* %tv_sec.i48, align 8, !tbaa !36
  %mul.i49 = mul nsw i64 %tmp15, 1000000
  %tv_usec.i50 = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i43, i64 0, i32 1
  %tmp16 = load i64, i64* %tv_usec.i50, align 8, !tbaa !38
  %add.i51 = add nsw i64 %mul.i49, %tmp16
  %init.i52 = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 4, i64 %idxprom26, i32 2
  store i64 %add.i51, i64* %init.i52, align 8, !tbaa !39
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %tmp14) #3
  br label %if.end28

if.end28:                                         ; preds = %if.end.i53, %if.then.i46, %if.end21
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @pb_PrintTimerSet(%struct.pb_TimerSet* nocapture readonly %timers) local_unnamed_addr #5 {
entry:
  %tv.i = alloca %struct.timeval, align 8
  %categories = alloca [6 x i8*], align 16
  %tmp = bitcast %struct.timeval* %tv.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %tmp) #3
  %call.i = call i32 @gettimeofday(%struct.timeval* nonnull %tv.i, %struct.timezone* null) #3
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i, i64 0, i32 0
  %tmp1 = load i64, i64* %tv_sec.i, align 8, !tbaa !36
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i, i64 0, i32 1
  %tmp2 = load i64, i64* %tv_usec.i, align 8, !tbaa !38
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %tmp) #3
  %tmp3 = bitcast [6 x i8*]* %categories to i8*
  call void @llvm.lifetime.start.p0i8(i64 48, i8* nonnull %tmp3) #3
  %tmp4 = getelementptr inbounds [6 x i8*], [6 x i8*]* %categories, i64 0, i64 0
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.13.28, i64 0, i64 0), i8** %tmp4, align 16
  %tmp5 = getelementptr inbounds [6 x i8*], [6 x i8*]* %categories, i64 0, i64 1
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.14.29, i64 0, i64 0), i8** %tmp5, align 8
  %tmp6 = getelementptr inbounds [6 x i8*], [6 x i8*]* %categories, i64 0, i64 2
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.15.30, i64 0, i64 0), i8** %tmp6, align 16
  %tmp7 = getelementptr inbounds [6 x i8*], [6 x i8*]* %categories, i64 0, i64 3
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.16.31, i64 0, i64 0), i8** %tmp7, align 8
  %tmp8 = getelementptr inbounds [6 x i8*], [6 x i8*]* %categories, i64 0, i64 4
  store i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.17.32, i64 0, i64 0), i8** %tmp8, align 16
  %tmp9 = getelementptr inbounds [6 x i8*], [6 x i8*]* %categories, i64 0, i64 5
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.18.33, i64 0, i64 0), i8** %tmp9, align 8
  br label %for.body

for.body:                                         ; preds = %for.inc, %entry
  %indvars.iv = phi i64 [ 1, %entry ], [ %indvars.iv.next, %for.inc ]
  %state.i = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 4, i64 %indvars.iv, i32 0
  %tmp10 = load i32, i32* %state.i, align 8, !tbaa !31
  %cmp.i = icmp eq i32 %tmp10, 0
  br i1 %cmp.i, label %pb_GetElapsedTime.exit, label %if.then.i

if.then.i:                                        ; preds = %for.body
  %tmp11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !26
  %tmp12 = tail call i64 @fwrite(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.11.27, i64 0, i64 0), i64 48, i64 1, %struct._IO_FILE* %tmp11) #20
  br label %pb_GetElapsedTime.exit

pb_GetElapsedTime.exit:                           ; preds = %if.then.i, %for.body
  %elapsed.i = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 4, i64 %indvars.iv, i32 1
  %tmp13 = load i64, i64* %elapsed.i, align 8, !tbaa !35
  %conv.i = uitofp i64 %tmp13 to double
  %div.i = fdiv double %conv.i, 1.000000e+06
  %cmp3 = fcmp une double %div.i, 0.000000e+00
  br i1 %cmp3, label %if.then, label %for.inc

if.then:                                          ; preds = %pb_GetElapsedTime.exit
  %tmp14 = add nsw i64 %indvars.iv, -1
  %arrayidx6 = getelementptr inbounds [6 x i8*], [6 x i8*]* %categories, i64 0, i64 %tmp14
  %tmp15 = load i8*, i8** %arrayidx6, align 8, !tbaa !26
  %tmp16 = load i32, i32* %state.i, align 8, !tbaa !31
  %cmp.i86 = icmp eq i32 %tmp16, 0
  br i1 %cmp.i86, label %pb_GetElapsedTime.exit91, label %if.then.i87

if.then.i87:                                      ; preds = %if.then
  %tmp17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !26
  %tmp18 = tail call i64 @fwrite(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.11.27, i64 0, i64 0), i64 48, i64 1, %struct._IO_FILE* %tmp17) #20
  %.pre = load i64, i64* %elapsed.i, align 8, !tbaa !35
  %.pre124 = uitofp i64 %.pre to double
  %.pre125 = fdiv double %.pre124, 1.000000e+06
  br label %pb_GetElapsedTime.exit91

pb_GetElapsedTime.exit91:                         ; preds = %if.then.i87, %if.then
  %div.i90.pre-phi = phi double [ %div.i, %if.then ], [ %.pre125, %if.then.i87 ]
  %call10 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.19, i64 0, i64 0), i32 10, i8* %tmp15, double %div.i90.pre-phi)
  %arrayidx12 = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 5, i64 %indvars.iv
  %tmp19 = load %struct.pb_SubTimerList*, %struct.pb_SubTimerList** %arrayidx12, align 8, !tbaa !26
  %cmp13 = icmp eq %struct.pb_SubTimerList* %tmp19, null
  br i1 %cmp13, label %for.inc, label %if.then14

if.then14:                                        ; preds = %pb_GetElapsedTime.exit91
  %subtimer_list = getelementptr inbounds %struct.pb_SubTimerList, %struct.pb_SubTimerList* %tmp19, i64 0, i32 1
  %sub.0113 = load %struct.pb_SubTimer*, %struct.pb_SubTimer** %subtimer_list, align 8, !tbaa !26
  %cmp18114 = icmp eq %struct.pb_SubTimer* %sub.0113, null
  br i1 %cmp18114, label %for.inc, label %while.body

while.body:                                       ; preds = %while.body, %if.then14
  %sub.0116 = phi %struct.pb_SubTimer* [ %sub.0, %while.body ], [ %sub.0113, %if.then14 ]
  %maxSubLength.0115 = phi i32 [ %spec.select, %while.body ], [ 0, %if.then14 ]
  %label = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %sub.0116, i64 0, i32 0
  %tmp20 = load i8*, i8** %label, align 8, !tbaa !46
  %call19 = tail call i64 @strlen(i8* %tmp20) #17
  %conv = sext i32 %maxSubLength.0115 to i64
  %cmp20 = icmp ugt i64 %call19, %conv
  %conv24 = trunc i64 %call19 to i32
  %spec.select = select i1 %cmp20, i32 %conv24, i32 %maxSubLength.0115
  %next = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %sub.0116, i64 0, i32 2
  %sub.0 = load %struct.pb_SubTimer*, %struct.pb_SubTimer** %next, align 8, !tbaa !26
  %cmp18 = icmp eq %struct.pb_SubTimer* %sub.0, null
  br i1 %cmp18, label %while.end, label %while.body

while.end:                                        ; preds = %while.body
  %cmp25 = icmp sgt i32 %spec.select, 10
  %spec.select129 = select i1 %cmp25, i32 %spec.select, i32 10
  br i1 %cmp18114, label %for.inc, label %while.body34

while.body34:                                     ; preds = %pb_GetElapsedTime.exit98, %while.end
  %sub.1119 = phi %struct.pb_SubTimer* [ %sub.1, %pb_GetElapsedTime.exit98 ], [ %sub.0113, %while.end ]
  %label35 = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %sub.1119, i64 0, i32 0
  %tmp21 = load i8*, i8** %label35, align 8, !tbaa !46
  %state.i92 = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %sub.1119, i64 0, i32 1, i32 0
  %tmp22 = load i32, i32* %state.i92, align 8, !tbaa !31
  %cmp.i93 = icmp eq i32 %tmp22, 0
  br i1 %cmp.i93, label %pb_GetElapsedTime.exit98, label %if.then.i94

if.then.i94:                                      ; preds = %while.body34
  %tmp23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !26
  %tmp24 = tail call i64 @fwrite(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.11.27, i64 0, i64 0), i64 48, i64 1, %struct._IO_FILE* %tmp23) #20
  br label %pb_GetElapsedTime.exit98

pb_GetElapsedTime.exit98:                         ; preds = %if.then.i94, %while.body34
  %elapsed.i95 = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %sub.1119, i64 0, i32 1, i32 1
  %tmp25 = load i64, i64* %elapsed.i95, align 8, !tbaa !35
  %conv.i96 = uitofp i64 %tmp25 to double
  %div.i97 = fdiv double %conv.i96, 1.000000e+06
  %call37 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.20, i64 0, i64 0), i32 %spec.select129, i8* %tmp21, double %div.i97)
  %next38 = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %sub.1119, i64 0, i32 2
  %sub.1 = load %struct.pb_SubTimer*, %struct.pb_SubTimer** %next38, align 8, !tbaa !26
  %cmp33 = icmp eq %struct.pb_SubTimer* %sub.1, null
  br i1 %cmp33, label %for.inc, label %while.body34

for.inc:                                          ; preds = %pb_GetElapsedTime.exit98, %while.end, %if.then14, %pb_GetElapsedTime.exit91, %pb_GetElapsedTime.exit
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 7
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc
  %mul.i = mul nsw i64 %tmp1, 1000000
  %add.i = add nsw i64 %mul.i, %tmp2
  %state.i99 = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 4, i64 7, i32 0
  %tmp26 = load i32, i32* %state.i99, align 8, !tbaa !31
  %cmp.i100 = icmp eq i32 %tmp26, 0
  br i1 %cmp.i100, label %pb_GetElapsedTime.exit105, label %if.then.i101

if.then.i101:                                     ; preds = %for.end
  %tmp27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !26
  %tmp28 = tail call i64 @fwrite(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.11.27, i64 0, i64 0), i64 48, i64 1, %struct._IO_FILE* %tmp27) #20
  br label %pb_GetElapsedTime.exit105

pb_GetElapsedTime.exit105:                        ; preds = %if.then.i101, %for.end
  %elapsed.i102 = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 4, i64 7, i32 1
  %tmp29 = load i64, i64* %elapsed.i102, align 8, !tbaa !35
  %conv.i103 = uitofp i64 %tmp29 to double
  %div.i104 = fdiv double %conv.i103, 1.000000e+06
  %cmp44 = fcmp une double %div.i104, 0.000000e+00
  br i1 %cmp44, label %if.then45, label %if.end49

if.then45:                                        ; preds = %pb_GetElapsedTime.exit105
  %tmp30 = load i32, i32* %state.i99, align 8, !tbaa !31
  %cmp.i107 = icmp eq i32 %tmp30, 0
  br i1 %cmp.i107, label %pb_GetElapsedTime.exit112, label %if.then.i108

if.then.i108:                                     ; preds = %if.then45
  %tmp31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !26
  %tmp32 = tail call i64 @fwrite(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.11.27, i64 0, i64 0), i64 48, i64 1, %struct._IO_FILE* %tmp31) #20
  %.pre123 = load i64, i64* %elapsed.i102, align 8, !tbaa !35
  %.pre126 = uitofp i64 %.pre123 to double
  %.pre127 = fdiv double %.pre126, 1.000000e+06
  br label %pb_GetElapsedTime.exit112

pb_GetElapsedTime.exit112:                        ; preds = %if.then.i108, %if.then45
  %div.i111.pre-phi = phi double [ %div.i104, %if.then45 ], [ %.pre127, %if.then.i108 ]
  %call48 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.21, i64 0, i64 0), double %div.i111.pre-phi)
  br label %if.end49

if.end49:                                         ; preds = %pb_GetElapsedTime.exit112, %pb_GetElapsedTime.exit105
  %wall_begin = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 3
  %tmp33 = load i64, i64* %wall_begin, align 8, !tbaa !41
  %sub50 = sub i64 %add.i, %tmp33
  %conv51 = uitofp i64 %sub50 to double
  %div = fdiv double %conv51, 1.000000e+06
  %conv52 = fptrunc double %div to float
  %conv53 = fpext float %conv52 to double
  %call54 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.22, i64 0, i64 0), double %conv53)
  call void @llvm.lifetime.end.p0i8(i64 48, i8* nonnull %tmp3) #3
  ret void
}

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define dso_local void @pb_DestroyTimerSet(%struct.pb_TimerSet* nocapture %timers) local_unnamed_addr #5 {
entry:
  %async_markers = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 1
  %tmp = load %struct.pb_async_time_marker_list*, %struct.pb_async_time_marker_list** %async_markers, align 8, !tbaa !26
  %cmp38 = icmp eq %struct.pb_async_time_marker_list* %tmp, null
  br i1 %cmp38, label %for.body.preheader, label %while.body

while.body:                                       ; preds = %while.body, %entry
  %tmp1 = phi %struct.pb_async_time_marker_list* [ %tmp3, %while.body ], [ %tmp, %entry ]
  %event.039 = phi %struct.pb_async_time_marker_list** [ %next1, %while.body ], [ %async_markers, %entry ]
  %next1 = getelementptr inbounds %struct.pb_async_time_marker_list, %struct.pb_async_time_marker_list* %tmp1, i64 0, i32 3
  %tmp2 = bitcast %struct.pb_async_time_marker_list* %tmp1 to i8*
  tail call void @free(i8* %tmp2) #3
  store %struct.pb_async_time_marker_list* null, %struct.pb_async_time_marker_list** %event.039, align 8, !tbaa !26
  %tmp3 = load %struct.pb_async_time_marker_list*, %struct.pb_async_time_marker_list** %next1, align 8, !tbaa !26
  %cmp = icmp eq %struct.pb_async_time_marker_list* %tmp3, null
  br i1 %cmp, label %for.body.preheader, label %while.body

for.body.preheader:                               ; preds = %while.body, %entry
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body.preheader ]
  %arrayidx = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 5, i64 %indvars.iv
  %tmp4 = load %struct.pb_SubTimerList*, %struct.pb_SubTimerList** %arrayidx, align 8, !tbaa !26
  %cmp3 = icmp eq %struct.pb_SubTimerList* %tmp4, null
  br i1 %cmp3, label %for.inc, label %if.then

if.then:                                          ; preds = %for.body
  %tmp5 = bitcast %struct.pb_SubTimerList* %tmp4 to i8*
  %subtimer_list = getelementptr inbounds %struct.pb_SubTimerList, %struct.pb_SubTimerList* %tmp4, i64 0, i32 1
  %tmp6 = load %struct.pb_SubTimer*, %struct.pb_SubTimer** %subtimer_list, align 8, !tbaa !49
  %cmp835 = icmp eq %struct.pb_SubTimer* %tmp6, null
  br i1 %cmp835, label %while.end11, label %while.body9

while.body9:                                      ; preds = %while.body9, %if.then
  %.in3436 = phi %struct.pb_SubTimer* [ %tmp9, %while.body9 ], [ %tmp6, %if.then ]
  %tmp7 = bitcast %struct.pb_SubTimer* %.in3436 to i8*
  %label = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %.in3436, i64 0, i32 0
  %tmp8 = load i8*, i8** %label, align 8, !tbaa !46
  tail call void @free(i8* %tmp8) #3
  %next10 = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %.in3436, i64 0, i32 2
  %tmp9 = load %struct.pb_SubTimer*, %struct.pb_SubTimer** %next10, align 8, !tbaa !48
  tail call void @free(i8* %tmp7) #3
  %cmp8 = icmp eq %struct.pb_SubTimer* %tmp9, null
  br i1 %cmp8, label %while.end11.loopexit, label %while.body9

while.end11.loopexit:                             ; preds = %while.body9
  %.phi.trans.insert = bitcast %struct.pb_SubTimerList** %arrayidx to i8**
  %.pre = load i8*, i8** %.phi.trans.insert, align 8, !tbaa !26
  br label %while.end11

while.end11:                                      ; preds = %while.end11.loopexit, %if.then
  %tmp10 = phi i8* [ %.pre, %while.end11.loopexit ], [ %tmp5, %if.then ]
  tail call void @free(i8* %tmp10) #3
  br label %for.inc

for.inc:                                          ; preds = %while.end11, %for.body
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 8
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc
  ret void
}

; Function Attrs: norecurse uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #16 {
entry:
  %argc.addr = alloca i32, align 4
  %timers = alloca %struct.pb_TimerSet, align 8
  %img_width = alloca i32, align 4
  %img_height = alloca i32, align 4
  %histo_width = alloca i32, align 4
  %histo_height = alloca i32, align 4
  store i32 %argc, i32* %argc.addr, align 4, !tbaa !23
  %tmp = bitcast %struct.pb_TimerSet* %timers to i8*
  call void @llvm.lifetime.start.p0i8(i64 288, i8* nonnull %tmp) #3
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @str, i64 0, i64 0))
  %puts126 = tail call i32 @puts(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @str.10, i64 0, i64 0))
  %call2 = call %struct.pb_Parameters* @pb_ReadParameters(i32* nonnull %argc.addr, i8** %argv)
  %tobool = icmp eq %struct.pb_Parameters* %call2, null
  br i1 %tobool, label %cleanup85, label %if.end

if.end:                                           ; preds = %entry
  %inpFiles = getelementptr inbounds %struct.pb_Parameters, %struct.pb_Parameters* %call2, i64 0, i32 1
  %tmp1 = load i8**, i8*** %inpFiles, align 8, !tbaa !29
  %tmp2 = load i8*, i8** %tmp1, align 8, !tbaa !26
  %tobool3 = icmp eq i8* %tmp2, null
  br i1 %tobool3, label %if.then4, label %if.end6

if.then4:                                         ; preds = %if.end
  %tmp3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !26
  %tmp4 = call i64 @fwrite(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.2.1, i64 0, i64 0), i64 20, i64 1, %struct._IO_FILE* %tmp3) #21
  br label %cleanup85

if.end6:                                          ; preds = %if.end
  %tmp5 = load i32, i32* %argc.addr, align 4, !tbaa !23
  %cmp = icmp sgt i32 %tmp5, 1
  br i1 %cmp, label %if.then7, label %if.else

if.then7:                                         ; preds = %if.end6
  %arrayidx8 = getelementptr inbounds i8*, i8** %argv, i64 1
  %tmp6 = load i8*, i8** %arrayidx8, align 8, !tbaa !26
  %call9 = call i32 @atoi(i8* %tmp6) #17
  call void @pb_InitializeTimerSet(%struct.pb_TimerSet* nonnull %timers)
  call void @pb_AddSubTimer(%struct.pb_TimerSet* nonnull %timers, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4.2, i64 0, i64 0), i32 1)
  call void @pb_AddSubTimer(%struct.pb_TimerSet* nonnull %timers, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5.3, i64 0, i64 0), i32 1)
  call void @pb_SwitchToSubTimer(%struct.pb_TimerSet* nonnull %timers, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4.2, i64 0, i64 0), i32 1)
  %tmp7 = bitcast i32* %img_width to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %tmp7) #3
  %tmp8 = bitcast i32* %img_height to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %tmp8) #3
  %tmp9 = bitcast i32* %histo_width to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %tmp9) #3
  %tmp10 = bitcast i32* %histo_height to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %tmp10) #3
  %tmp11 = load i8**, i8*** %inpFiles, align 8, !tbaa !29
  %tmp12 = load i8*, i8** %tmp11, align 8, !tbaa !26
  %call14 = call %struct._IO_FILE* @fopen(i8* %tmp12, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6.4, i64 0, i64 0))
  %tmp13 = call i64 @fread_unlocked(i8* nonnull %tmp7, i64 4, i64 1, %struct._IO_FILE* %call14)
  %tmp14 = call i64 @fread_unlocked(i8* nonnull %tmp8, i64 4, i64 1, %struct._IO_FILE* %call14)
  %add19 = add i64 %tmp14, %tmp13
  %tmp15 = call i64 @fread_unlocked(i8* nonnull %tmp9, i64 4, i64 1, %struct._IO_FILE* %call14)
  %add23 = add i64 %add19, %tmp15
  %tmp16 = call i64 @fread_unlocked(i8* nonnull %tmp10, i64 4, i64 1, %struct._IO_FILE* %call14)
  %add27 = add i64 %add23, %tmp16
  %conv28 = trunc i64 %add27 to i32
  %cmp29 = icmp eq i32 %conv28, 4
  br i1 %cmp29, label %if.end32, label %if.then30

if.else:                                          ; preds = %if.end6
  %tmp17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !26
  %tmp18 = call i64 @fwrite(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.3.5, i64 0, i64 0), i64 44, i64 1, %struct._IO_FILE* %tmp17) #21
  br label %cleanup85

if.then30:                                        ; preds = %if.then7
  %tmp19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !26
  %tmp20 = call i64 @fwrite(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.7.6, i64 0, i64 0), i64 52, i64 1, %struct._IO_FILE* %tmp19) #21
  br label %cleanup76

if.end32:                                         ; preds = %if.then7
  %tmp21 = load i32, i32* %img_width, align 4, !tbaa !23
  %tmp22 = load i32, i32* %img_height, align 4, !tbaa !23
  %mul = mul i32 %tmp22, %tmp21
  %conv33 = zext i32 %mul to i64
  %mul34 = shl nuw nsw i64 %conv33, 2
  %call35 = call noalias i8* @malloc(i64 %mul34) #3
  %tmp23 = bitcast i8* %call35 to i32*
  %tmp24 = load i32, i32* %histo_width, align 4, !tbaa !23
  %tmp25 = load i32, i32* %histo_height, align 4, !tbaa !23
  %mul36 = mul i32 %tmp25, %tmp24
  %conv37 = zext i32 %mul36 to i64
  %call38 = call noalias i8* @calloc(i64 %conv37, i64 1) #3
  call void @pb_SwitchToSubTimer(%struct.pb_TimerSet* nonnull %timers, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4.2, i64 0, i64 0), i32 1)
  %tmp26 = call i64 @fread_unlocked(i8* %call35, i64 4, i64 %conv33, %struct._IO_FILE* %call14)
  %conv42 = trunc i64 %tmp26 to i32
  %call43 = call i32 @fclose(%struct._IO_FILE* %call14)
  %cmp45 = icmp eq i32 %mul, %conv42
  br i1 %cmp45, label %if.end48, label %if.then46

if.then46:                                        ; preds = %if.end32
  %tmp27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !26
  %tmp28 = call i64 @fwrite(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.8.7, i64 0, i64 0), i64 36, i64 1, %struct._IO_FILE* %tmp27) #21
  br label %cleanup76

if.end48:                                         ; preds = %if.end32
  call void @pb_SwitchToTimer(%struct.pb_TimerSet* nonnull %timers, i32 6)
  %cmp49131 = icmp sgt i32 %call9, 0
  br i1 %cmp49131, label %for.body.lr.ph, label %for.end69

for.body.lr.ph:                                   ; preds = %if.end48
  %cmp55129 = icmp eq i32 %mul, 0
  br i1 %cmp55129, label %for.body, label %for.body.us

for.body.us:                                      ; preds = %for.cond53.for.end_crit_edge.us, %for.body.lr.ph
  %iter.0132.us = phi i32 [ %inc68.us, %for.cond53.for.end_crit_edge.us ], [ 0, %for.body.lr.ph ]
  call void @llvm.memset.p0i8.i64(i8* align 1 %call38, i8 0, i64 %conv37, i1 false)
  br label %for.body56.us

for.body56.us:                                    ; preds = %if.end65.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %if.end65.us ]
  %arrayidx57.us = getelementptr inbounds i32, i32* %tmp23, i64 %indvars.iv
  %tmp29 = load i32, i32* %arrayidx57.us, align 4, !tbaa !23
  %idxprom58.us = zext i32 %tmp29 to i64
  %arrayidx59.us = getelementptr inbounds i8, i8* %call38, i64 %idxprom58.us
  %tmp30 = load i8, i8* %arrayidx59.us, align 1, !tbaa !30
  %cmp61.us = icmp eq i8 %tmp30, -1
  br i1 %cmp61.us, label %if.end65.us, label %if.then62.us

if.then62.us:                                     ; preds = %for.body56.us
  %inc.us = add i8 %tmp30, 1
  store i8 %inc.us, i8* %arrayidx59.us, align 1, !tbaa !30
  br label %if.end65.us

if.end65.us:                                      ; preds = %if.then62.us, %for.body56.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %conv33
  br i1 %exitcond, label %for.cond53.for.end_crit_edge.us, label %for.body56.us

for.cond53.for.end_crit_edge.us:                  ; preds = %if.end65.us
  %inc68.us = add nuw nsw i32 %iter.0132.us, 1
  %exitcond134 = icmp eq i32 %inc68.us, %call9
  br i1 %exitcond134, label %for.end69, label %for.body.us

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %iter.0132 = phi i32 [ %inc68, %for.body ], [ 0, %for.body.lr.ph ]
  call void @llvm.memset.p0i8.i64(i8* align 1 %call38, i8 0, i64 %conv37, i1 false)
  %inc68 = add nuw nsw i32 %iter.0132, 1
  %exitcond135 = icmp eq i32 %inc68, %call9
  br i1 %exitcond135, label %for.end69, label %for.body

for.end69:                                        ; preds = %for.body, %for.cond53.for.end_crit_edge.us, %if.end48
  call void @pb_SwitchToSubTimer(%struct.pb_TimerSet* nonnull %timers, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5.3, i64 0, i64 0), i32 1)
  %outFile = getelementptr inbounds %struct.pb_Parameters, %struct.pb_Parameters* %call2, i64 0, i32 0
  %tmp31 = load i8*, i8** %outFile, align 8, !tbaa !27
  %tobool70 = icmp eq i8* %tmp31, null
  br i1 %tobool70, label %if.end73, label %if.then71

if.then71:                                        ; preds = %for.end69
  call void @_Z14dump_histo_imgPhjjPKc(i8* %call38, i32 %tmp25, i32 %tmp24, i8* nonnull %tmp31)
  br label %if.end73

if.end73:                                         ; preds = %if.then71, %for.end69
  call void @pb_SwitchToTimer(%struct.pb_TimerSet* nonnull %timers, i32 6)
  call void @free(i8* %call35) #3
  call void @free(i8* %call38) #3
  call void @pb_SwitchToTimer(%struct.pb_TimerSet* nonnull %timers, i32 0)
  %putchar = call i32 @putchar(i32 10)
  call void @pb_PrintTimerSet(%struct.pb_TimerSet* nonnull %timers)
  call void @pb_FreeParameters(%struct.pb_Parameters* nonnull %call2)
  br label %cleanup76

cleanup76:                                        ; preds = %if.end73, %if.then46, %if.then30
  %retval.1 = phi i32 [ -1, %if.then30 ], [ -1, %if.then46 ], [ 0, %if.end73 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %tmp10) #3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %tmp9) #3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %tmp8) #3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %tmp7) #3
  br label %cleanup85

cleanup85:                                        ; preds = %cleanup76, %if.else, %if.then4, %entry
  %retval.3 = phi i32 [ -1, %if.then4 ], [ -1, %entry ], [ %retval.1, %cleanup76 ], [ -1, %if.else ]
  call void @llvm.lifetime.end.p0i8(i64 288, i8* nonnull %tmp) #3
  call void @tracer_cleanup()
  ret i32 %retval.3
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #3

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare dso_local noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fread_unlocked(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local noalias i8* @calloc(i64, i64) local_unnamed_addr #2

; Function Attrs: nounwind
declare dso_local i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #9

declare dso_local void @_Z14dump_histo_imgPhjjPKc(i8*, i32, i32, i8*) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @putchar(i32) local_unnamed_addr #3

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { inlinehint uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { argmemonly nounwind }
attributes #10 = { argmemonly nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { nobuiltin "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #14 = { norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #15 = { norecurse nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #16 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #17 = { nounwind readonly }
attributes #18 = { noreturn nounwind }
attributes #19 = { noreturn }
attributes #20 = { cold nounwind }
attributes #21 = { cold }

!llvm.ident = !{!0, !0, !0}
!llvm.module.flags = !{!1}

!0 = !{!"clang version 9.0.0 (/home/ts20/share/llvm9/llvm-project/clang 3775794812e582769e2ed1b53c00650a6b21387c)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{!3, !3, i64 0}
!3 = !{!"bool", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"vtable pointer", !5, i64 0}
!8 = !{!9, !12, i64 32}
!9 = !{!"_ZTSSt8ios_base", !10, i64 8, !10, i64 16, !11, i64 24, !12, i64 28, !12, i64 32, !13, i64 40, !14, i64 48, !4, i64 64, !15, i64 192, !13, i64 200, !16, i64 208}
!10 = !{!"long", !4, i64 0}
!11 = !{!"_ZTSSt13_Ios_Fmtflags", !4, i64 0}
!12 = !{!"_ZTSSt12_Ios_Iostate", !4, i64 0}
!13 = !{!"any pointer", !4, i64 0}
!14 = !{!"_ZTSNSt8ios_base6_WordsE", !13, i64 0, !10, i64 8}
!15 = !{!"int", !4, i64 0}
!16 = !{!"_ZTSSt6locale", !13, i64 0}
!17 = !{!18, !13, i64 0}
!18 = !{!"_ZTSSs", !19, i64 0}
!19 = !{!"_ZTSNSs12_Alloc_hiderE", !13, i64 0}
!20 = !{!21, !10, i64 0}
!21 = !{!"_ZTSNSs9_Rep_baseE", !10, i64 0, !10, i64 8, !15, i64 16}
!22 = !{!"branch_weights", i32 2000, i32 1}
!23 = !{!15, !15, i64 0}
!24 = !{i8 0, i8 2}
!25 = !{!10, !10, i64 0}
!26 = !{!13, !13, i64 0}
!27 = !{!28, !13, i64 0}
!28 = !{!"_ZTS13pb_Parameters", !13, i64 0, !13, i64 8}
!29 = !{!28, !13, i64 8}
!30 = !{!4, !4, i64 0}
!31 = !{!32, !33, i64 0}
!32 = !{!"_ZTS8pb_Timer", !33, i64 0, !34, i64 8, !34, i64 16}
!33 = !{!"_ZTS13pb_TimerState", !4, i64 0}
!34 = !{!"long long", !4, i64 0}
!35 = !{!32, !34, i64 8}
!36 = !{!37, !10, i64 0}
!37 = !{!"_ZTS7timeval", !10, i64 0, !10, i64 8}
!38 = !{!37, !10, i64 8}
!39 = !{!32, !34, i64 16}
!40 = !{!34, !34, i64 0}
!41 = !{!42, !34, i64 24}
!42 = !{!"_ZTS11pb_TimerSet", !43, i64 0, !13, i64 8, !34, i64 16, !34, i64 24, !4, i64 32, !4, i64 224}
!43 = !{!"_ZTS10pb_TimerID", !4, i64 0}
!44 = !{!42, !43, i64 0}
!45 = !{!42, !13, i64 8}
!46 = !{!47, !13, i64 0}
!47 = !{!"_ZTS11pb_SubTimer", !13, i64 0, !32, i64 8, !13, i64 32}
!48 = !{!47, !13, i64 32}
!49 = !{!50, !13, i64 8}
!50 = !{!"_ZTS15pb_SubTimerList", !13, i64 0, !13, i64 8}
!51 = !{!50, !13, i64 0}

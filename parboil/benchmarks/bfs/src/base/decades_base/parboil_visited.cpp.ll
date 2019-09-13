; ModuleID = 'decades_base/parboil_visited.cpp'
source_filename = "decades_base/parboil_visited.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.pb_Parameters = type { i8*, i8** }
%struct.pb_Timer = type { i32, i64, i64 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }
%struct.pb_TimerSet = type { i32, %struct.pb_async_time_marker_list*, i64, i64, [8 x %struct.pb_Timer], [8 x %struct.pb_SubTimerList*] }
%struct.pb_async_time_marker_list = type { i8*, i32, i8*, %struct.pb_async_time_marker_list* }
%struct.pb_SubTimerList = type { %struct.pb_SubTimer*, %struct.pb_SubTimer* }
%struct.pb_SubTimer = type { i8*, %struct.pb_Timer, %struct.pb_SubTimer* }

@.str = private unnamed_addr constant [32 x i8] c"Expecting file name after '-o'\0A\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"Expecting file name after '-i'\0A\00", align 1
@.str.2 = private unnamed_addr constant [35 x i8] c"Unexpected command-line parameter\0A\00", align 1
@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.3 = private unnamed_addr constant [43 x i8] c"Ignoring attempt to start a running timer\0A\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"Warning: Timer was not stopped\0A\00", align 1
@.str.5 = private unnamed_addr constant [35 x i8] c"Warning: Subtimer was not stopped\0A\00", align 1
@.str.6 = private unnamed_addr constant [54 x i8] c"Ignoring attempt to start running timer and subtimer\0A\00", align 1
@.str.7 = private unnamed_addr constant [42 x i8] c"Ignoring attempt to stop a stopped timer\0A\00", align 1
@.str.8 = private unnamed_addr constant [32 x i8] c"Warning: Timer was not running\0A\00", align 1
@.str.9 = private unnamed_addr constant [35 x i8] c"Warning: Subtimer was not running\0A\00", align 1
@.str.10 = private unnamed_addr constant [53 x i8] c"Ignoring attempt to stop stopped timer and subtimer\0A\00", align 1
@.str.11 = private unnamed_addr constant [49 x i8] c"Elapsed time from a running timer is inaccurate\0A\00", align 1
@.str.13 = private unnamed_addr constant [3 x i8] c"IO\00", align 1
@.str.14 = private unnamed_addr constant [7 x i8] c"Kernel\00", align 1
@.str.15 = private unnamed_addr constant [5 x i8] c"Copy\00", align 1
@.str.16 = private unnamed_addr constant [7 x i8] c"Driver\00", align 1
@.str.17 = private unnamed_addr constant [11 x i8] c"Copy Async\00", align 1
@.str.18 = private unnamed_addr constant [8 x i8] c"Compute\00", align 1
@.str.19 = private unnamed_addr constant [10 x i8] c"%-*s: %f\0A\00", align 1
@.str.20 = private unnamed_addr constant [12 x i8] c" -%-*s: %f\0A\00", align 1
@.str.21 = private unnamed_addr constant [24 x i8] c"CPU/Kernel Overlap: %f\0A\00", align 1
@.str.22 = private unnamed_addr constant [21 x i8] c"Timer Wall Time: %f\0A\00", align 1
@.str.23 = private unnamed_addr constant [17 x i8] c"delete_argument\0A\00", align 1
@.str.24 = private unnamed_addr constant [15 x i8] c"next_argument\0A\00", align 1

; Function Attrs: nounwind uwtable
define dso_local noalias %struct.pb_Parameters* @pb_ReadParameters(i32* nocapture %_argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call noalias i8* @malloc(i64 16) #7
  %0 = bitcast i8* %call to %struct.pb_Parameters*
  %outFile = bitcast i8* %call to i8**
  store i8* null, i8** %outFile, align 8, !tbaa !2
  %call1 = tail call noalias i8* @malloc(i64 8) #7
  %1 = bitcast i8* %call1 to i8**
  %inpFiles = getelementptr inbounds i8, i8* %call, i64 8
  %2 = bitcast i8* %inpFiles to i8**
  store i8* %call1, i8** %2, align 8, !tbaa !7
  store i8* null, i8** %1, align 8, !tbaa !8
  %3 = load i32, i32* %_argc, align 4, !tbaa !9
  %cmp.i121 = icmp eq i32 %3, 0
  br i1 %cmp.i121, label %end_of_options.thread, label %while.body

while.body:                                       ; preds = %entry, %cleanup
  %ap.sroa.0.0128 = phi i32 [ %ap.sroa.0.1, %cleanup ], [ %3, %entry ]
  %ap.sroa.45.0126 = phi i8** [ %ap.sroa.45.1, %cleanup ], [ %argv, %entry ]
  %ap.sroa.31111.0124 = phi i8** [ %ap.sroa.31111.1, %cleanup ], [ %argv, %entry ]
  %ap.sroa.19.0122 = phi i32 [ %ap.sroa.19.1, %cleanup ], [ 0, %entry ]
  %ap.idx55.val.val = load i8*, i8** %ap.sroa.31111.0124, align 8, !tbaa !8
  %4 = load i8, i8* %ap.idx55.val.val, align 1, !tbaa !11
  %cmp = icmp eq i8 %4, 45
  %5 = ptrtoint i8* %ap.idx55.val.val to i64
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %while.body
  %arrayidx6 = getelementptr inbounds i8, i8* %ap.idx55.val.val, i64 1
  %6 = load i8, i8* %arrayidx6, align 1, !tbaa !11
  %cmp8 = icmp eq i8 %6, 0
  br i1 %cmp8, label %if.else, label %land.lhs.true9

land.lhs.true9:                                   ; preds = %land.lhs.true
  %arrayidx10 = getelementptr inbounds i8, i8* %ap.idx55.val.val, i64 2
  %7 = load i8, i8* %arrayidx10, align 1, !tbaa !11
  %cmp12 = icmp eq i8 %7, 0
  br i1 %cmp12, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true9
  %cmp.i57 = icmp slt i32 %ap.sroa.19.0122, %ap.sroa.0.0128
  br i1 %cmp.i57, label %_ZL15delete_argumentP8argparse.exit, label %if.then.i

if.then.i:                                        ; preds = %if.then
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.23, i64 0, i64 0), i64 16, i64 1, %struct._IO_FILE* %8) #8
  %.pre = load i8, i8* %arrayidx6, align 1, !tbaa !11
  br label %_ZL15delete_argumentP8argparse.exit

_ZL15delete_argumentP8argparse.exit:              ; preds = %if.then, %if.then.i
  %10 = phi i8 [ %6, %if.then ], [ %.pre, %if.then.i ]
  %dec.i = add nsw i32 %ap.sroa.0.0128, -1
  %incdec.ptr.i = getelementptr inbounds i8*, i8** %ap.sroa.31111.0124, i64 1
  %conv14 = sext i8 %10 to i32
  switch i32 %conv14, label %error [
    i32 111, label %sw.bb
    i32 105, label %sw.bb22
    i32 45, label %end_of_options
  ]

sw.bb:                                            ; preds = %_ZL15delete_argumentP8argparse.exit
  %cmp.i59 = icmp eq i32 %ap.sroa.19.0122, %dec.i
  br i1 %cmp.i59, label %error, label %if.end

if.end:                                           ; preds = %sw.bb
  %11 = load i8*, i8** %outFile, align 8, !tbaa !2
  tail call void @free(i8* %11) #7
  %ap.idx.val.val.i = load i8*, i8** %incdec.ptr.i, align 8, !tbaa !8
  %cmp.i.i = icmp slt i32 %ap.sroa.19.0122, %dec.i
  br i1 %cmp.i.i, label %_ZL16consume_argumentP8argparse.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %if.end
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.23, i64 0, i64 0), i64 16, i64 1, %struct._IO_FILE* %12) #8
  br label %_ZL16consume_argumentP8argparse.exit

_ZL16consume_argumentP8argparse.exit:             ; preds = %if.end, %if.then.i.i
  %dec.i.i = add nsw i32 %ap.sroa.0.0128, -2
  %incdec.ptr.i.i62 = getelementptr inbounds i8*, i8** %ap.sroa.31111.0124, i64 2
  %call20 = tail call noalias i8* @strdup(i8* %ap.idx.val.val.i) #7
  store i8* %call20, i8** %outFile, align 8, !tbaa !2
  br label %cleanup

sw.bb22:                                          ; preds = %_ZL15delete_argumentP8argparse.exit
  %cmp.i63 = icmp eq i32 %ap.sroa.19.0122, %dec.i
  br i1 %cmp.i63, label %error, label %if.end26

if.end26:                                         ; preds = %sw.bb22
  %ap.idx.val.val.i83 = load i8*, i8** %incdec.ptr.i, align 8, !tbaa !8
  %cmp.i.i86 = icmp slt i32 %ap.sroa.19.0122, %dec.i
  br i1 %cmp.i.i86, label %_ZL16consume_argumentP8argparse.exit92, label %if.then.i.i89

if.then.i.i89:                                    ; preds = %if.end26
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %15 = tail call i64 @fwrite(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.23, i64 0, i64 0), i64 16, i64 1, %struct._IO_FILE* %14) #8
  br label %_ZL16consume_argumentP8argparse.exit92

_ZL16consume_argumentP8argparse.exit92:           ; preds = %if.end26, %if.then.i.i89
  %dec.i.i90 = add nsw i32 %ap.sroa.0.0128, -2
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.inc.i, %_ZL16consume_argumentP8argparse.exit92
  %indvars.iv68.i = phi i64 [ %indvars.iv.next69.i, %for.inc.i ], [ 0, %_ZL16consume_argumentP8argparse.exit92 ]
  %count.0.i = phi i32 [ %count.1.i, %for.inc.i ], [ 1, %_ZL16consume_argumentP8argparse.exit92 ]
  %arrayidx.i = getelementptr inbounds i8, i8* %ap.idx.val.val.i83, i64 %indvars.iv68.i
  %16 = load i8, i8* %arrayidx.i, align 1, !tbaa !11
  switch i8 %16, label %for.inc.i [
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
  %call.i = tail call noalias i8* @malloc(i64 %mul.i) #7
  %17 = bitcast i8* %call.i to i8**
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
  %18 = load i8, i8* %substring_end.0.i, align 1, !tbaa !11
  switch i8 %18, label %for.inc14.i [
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
  %call19.i = tail call noalias i8* @malloc(i64 %conv18.i) #7
  %arrayidx21.i = getelementptr inbounds i8*, i8** %17, i64 %indvars.iv.i
  store i8* %call19.i, i8** %arrayidx21.i, align 8, !tbaa !8
  %conv24.i = ashr exact i64 %add17.i, 32
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %call19.i, i8* align 1 %substring.066.i, i64 %conv24.i, i1 false) #7
  %arrayidx28.i = getelementptr inbounds i8, i8* %call19.i, i64 %conv24.i
  store i8 0, i8* %arrayidx28.i, align 1, !tbaa !11
  %add.ptr.i = getelementptr inbounds i8, i8* %substring_end.0.i, i64 1
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, %wide.trip.count.i
  br i1 %exitcond.i, label %_ZL17read_string_arrayPc.exit, label %for.cond8.preheader.i

_ZL17read_string_arrayPc.exit:                    ; preds = %for.end15.i, %for.end.i
  %i.1.lcssa.i = phi i64 [ 0, %for.end.i ], [ %wide.trip.count.i, %for.end15.i ]
  %arrayidx33.i = getelementptr inbounds i8*, i8** %17, i64 %i.1.lcssa.i
  store i8* null, i8** %arrayidx33.i, align 8, !tbaa !8
  store i8* %call.i, i8** %2, align 8, !tbaa !7
  br label %cleanup

if.else:                                          ; preds = %land.lhs.true, %land.lhs.true9, %while.body
  %cmp.i73 = icmp slt i32 %ap.sroa.19.0122, %ap.sroa.0.0128
  br i1 %cmp.i73, label %_ZL13next_argumentP8argparse.exit, label %if.then.i75

if.then.i75:                                      ; preds = %if.else
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.24, i64 0, i64 0), i64 14, i64 1, %struct._IO_FILE* %19) #8
  %.phi.trans.insert = bitcast i8** %ap.sroa.31111.0124 to i64*
  %.pre138 = load i64, i64* %.phi.trans.insert, align 8, !tbaa !8
  br label %_ZL13next_argumentP8argparse.exit

_ZL13next_argumentP8argparse.exit:                ; preds = %if.else, %if.then.i75
  %21 = phi i64 [ %.pre138, %if.then.i75 ], [ %5, %if.else ]
  %incdec.ptr.i77 = getelementptr inbounds i8*, i8** %ap.sroa.31111.0124, i64 1
  %incdec.ptr1.i79 = getelementptr inbounds i8*, i8** %ap.sroa.45.0126, i64 1
  %22 = bitcast i8** %ap.sroa.45.0126 to i64*
  store i64 %21, i64* %22, align 8, !tbaa !8
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
  store i32 %ap.sroa.0.2.ph, i32* %_argc, align 4, !tbaa !9
  br label %cleanup33

end_of_options:                                   ; preds = %_ZL15delete_argumentP8argparse.exit
  store i32 %dec.i, i32* %_argc, align 4, !tbaa !9
  %cmp7.i = icmp slt i32 %ap.sroa.19.0122, %dec.i
  br i1 %cmp7.i, label %for.body.i, label %cleanup33

for.body.i:                                       ; preds = %end_of_options, %for.body.i
  %ap.sroa.31111.3 = phi i8** [ %incdec.ptr.i69, %for.body.i ], [ %incdec.ptr.i, %end_of_options ]
  %ap.sroa.45.3 = phi i8** [ %incdec.ptr1.i, %for.body.i ], [ %ap.sroa.45.0126, %end_of_options ]
  %23 = phi i32 [ %inc.i, %for.body.i ], [ %ap.sroa.19.0122, %end_of_options ]
  %incdec.ptr.i69 = getelementptr inbounds i8*, i8** %ap.sroa.31111.3, i64 1
  %24 = bitcast i8** %ap.sroa.31111.3 to i64*
  %25 = load i64, i64* %24, align 8, !tbaa !8
  %incdec.ptr1.i = getelementptr inbounds i8*, i8** %ap.sroa.45.3, i64 1
  %26 = bitcast i8** %ap.sroa.45.3 to i64*
  store i64 %25, i64* %26, align 8, !tbaa !8
  %inc.i = add nsw i32 %23, 1
  %exitcond = icmp eq i32 %inc.i, %dec.i
  br i1 %exitcond, label %cleanup33, label %for.body.i

error:                                            ; preds = %sw.bb, %sw.bb22, %_ZL15delete_argumentP8argparse.exit
  %err_message.1.ph = phi i8* [ getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0), %sw.bb22 ], [ getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), %sw.bb ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.2, i64 0, i64 0), %_ZL15delete_argumentP8argparse.exit ]
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %call32 = tail call i32 @fputs(i8* nonnull %err_message.1.ph, %struct._IO_FILE* %27) #9
  %28 = load i8*, i8** %outFile, align 8, !tbaa !2
  tail call void @free(i8* %28) #7
  %29 = bitcast i8* %inpFiles to i8***
  %30 = load i8**, i8*** %29, align 8, !tbaa !7
  %tobool.i.i = icmp eq i8** %30, null
  br i1 %tobool.i.i, label %pb_FreeParameters.exit, label %for.cond.preheader.i.i

for.cond.preheader.i.i:                           ; preds = %error
  %31 = load i8*, i8** %30, align 8, !tbaa !8
  %tobool17.i.i = icmp eq i8* %31, null
  br i1 %tobool17.i.i, label %for.end.i.i, label %for.body.i.i

for.body.i.i:                                     ; preds = %for.cond.preheader.i.i, %for.body.i.i
  %32 = phi i8* [ %33, %for.body.i.i ], [ %31, %for.cond.preheader.i.i ]
  %p.08.i.i = phi i8** [ %incdec.ptr.i.i, %for.body.i.i ], [ %30, %for.cond.preheader.i.i ]
  tail call void @free(i8* nonnull %32) #7
  %incdec.ptr.i.i = getelementptr inbounds i8*, i8** %p.08.i.i, i64 1
  %33 = load i8*, i8** %incdec.ptr.i.i, align 8, !tbaa !8
  %tobool1.i.i = icmp eq i8* %33, null
  br i1 %tobool1.i.i, label %for.end.i.i, label %for.body.i.i

for.end.i.i:                                      ; preds = %for.body.i.i, %for.cond.preheader.i.i
  %34 = bitcast i8** %30 to i8*
  tail call void @free(i8* %34) #7
  br label %pb_FreeParameters.exit

pb_FreeParameters.exit:                           ; preds = %error, %for.end.i.i
  tail call void @free(i8* %call) #7
  br label %cleanup33

cleanup33:                                        ; preds = %for.body.i, %end_of_options.thread, %end_of_options, %pb_FreeParameters.exit
  %retval.0 = phi %struct.pb_Parameters* [ null, %pb_FreeParameters.exit ], [ %0, %end_of_options ], [ %0, %end_of_options.thread ], [ %0, %for.body.i ]
  ret %struct.pb_Parameters* %retval.0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) local_unnamed_addr #2

; Function Attrs: nounwind
declare dso_local void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare dso_local noalias i8* @strdup(i8* nocapture readonly) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind
declare dso_local i32 @fputs(i8* nocapture readonly, %struct._IO_FILE* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define dso_local void @pb_FreeParameters(%struct.pb_Parameters* nocapture %p) local_unnamed_addr #0 {
entry:
  %outFile = getelementptr inbounds %struct.pb_Parameters, %struct.pb_Parameters* %p, i64 0, i32 0
  %0 = load i8*, i8** %outFile, align 8, !tbaa !2
  tail call void @free(i8* %0) #7
  %inpFiles = getelementptr inbounds %struct.pb_Parameters, %struct.pb_Parameters* %p, i64 0, i32 1
  %1 = load i8**, i8*** %inpFiles, align 8, !tbaa !7
  %tobool.i = icmp eq i8** %1, null
  br i1 %tobool.i, label %_ZL17free_string_arrayPPc.exit, label %for.cond.preheader.i

for.cond.preheader.i:                             ; preds = %entry
  %2 = load i8*, i8** %1, align 8, !tbaa !8
  %tobool17.i = icmp eq i8* %2, null
  br i1 %tobool17.i, label %for.end.i, label %for.body.i

for.body.i:                                       ; preds = %for.cond.preheader.i, %for.body.i
  %3 = phi i8* [ %4, %for.body.i ], [ %2, %for.cond.preheader.i ]
  %p.08.i = phi i8** [ %incdec.ptr.i, %for.body.i ], [ %1, %for.cond.preheader.i ]
  tail call void @free(i8* nonnull %3) #7
  %incdec.ptr.i = getelementptr inbounds i8*, i8** %p.08.i, i64 1
  %4 = load i8*, i8** %incdec.ptr.i, align 8, !tbaa !8
  %tobool1.i = icmp eq i8* %4, null
  br i1 %tobool1.i, label %for.end.i, label %for.body.i

for.end.i:                                        ; preds = %for.body.i, %for.cond.preheader.i
  %5 = bitcast i8** %1 to i8*
  tail call void @free(i8* %5) #7
  br label %_ZL17free_string_arrayPPc.exit

_ZL17free_string_arrayPPc.exit:                   ; preds = %entry, %for.end.i
  %6 = bitcast %struct.pb_Parameters* %p to i8*
  tail call void @free(i8* %6) #7
  ret void
}

; Function Attrs: norecurse nounwind readonly uwtable
define dso_local i32 @pb_Parameters_CountInputs(%struct.pb_Parameters* nocapture readonly %p) local_unnamed_addr #3 {
entry:
  %inpFiles = getelementptr inbounds %struct.pb_Parameters, %struct.pb_Parameters* %p, i64 0, i32 1
  %0 = load i8**, i8*** %inpFiles, align 8, !tbaa !7
  br label %for.cond

for.cond:                                         ; preds = %for.cond, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.cond ], [ 0, %entry ]
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 %indvars.iv
  %1 = load i8*, i8** %arrayidx, align 8, !tbaa !8
  %tobool = icmp eq i8* %1, null
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  br i1 %tobool, label %for.end, label %for.cond

for.end:                                          ; preds = %for.cond
  %2 = trunc i64 %indvars.iv to i32
  ret i32 %2
}

; Function Attrs: norecurse nounwind uwtable writeonly
define dso_local void @pb_ResetTimer(%struct.pb_Timer* nocapture %timer) local_unnamed_addr #4 {
entry:
  %state = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %timer, i64 0, i32 0
  store i32 0, i32* %state, align 8, !tbaa !12
  %elapsed = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %timer, i64 0, i32 1
  store i64 0, i64* %elapsed, align 8, !tbaa !16
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @pb_StartTimer(%struct.pb_Timer* nocapture %timer) local_unnamed_addr #0 {
entry:
  %tv = alloca %struct.timeval, align 8
  %state = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %timer, i64 0, i32 0
  %0 = load i32, i32* %state, align 8, !tbaa !12
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.3, i64 0, i64 0), i64 42, i64 1, %struct._IO_FILE* %1) #9
  br label %return

if.end:                                           ; preds = %entry
  store i32 1, i32* %state, align 8, !tbaa !12
  %3 = bitcast %struct.timeval* %tv to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %3) #7
  %call2 = call i32 @gettimeofday(%struct.timeval* nonnull %tv, %struct.timezone* null) #7
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i64 0, i32 0
  %4 = load i64, i64* %tv_sec, align 8, !tbaa !17
  %mul = mul nsw i64 %4, 1000000
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i64 0, i32 1
  %5 = load i64, i64* %tv_usec, align 8, !tbaa !20
  %add = add nsw i64 %mul, %5
  %init = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %timer, i64 0, i32 2
  store i64 %add, i64* %init, align 8, !tbaa !21
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3) #7
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: nounwind
declare dso_local i32 @gettimeofday(%struct.timeval* nocapture, %struct.timezone* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define dso_local void @_Z24pb_StartTimerAndSubTimerP8pb_TimerS0_(%struct.pb_Timer* nocapture %timer, %struct.pb_Timer* nocapture %subtimer) local_unnamed_addr #0 {
entry:
  %tv = alloca %struct.timeval, align 8
  %state = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %timer, i64 0, i32 0
  %0 = load i32, i32* %state, align 8, !tbaa !12
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0), i64 31, i64 1, %struct._IO_FILE* %1) #9
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %numNotStopped.0 = phi i32 [ 1, %if.then ], [ 3, %entry ]
  %state1 = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %subtimer, i64 0, i32 0
  %3 = load i32, i32* %state1, align 8, !tbaa !12
  %cmp2 = icmp eq i32 %3, 0
  br i1 %cmp2, label %if.end10, label %if.end6

if.end6:                                          ; preds = %if.end
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.5, i64 0, i64 0), i64 34, i64 1, %struct._IO_FILE* %4) #9
  %and5 = and i32 %numNotStopped.0, 2
  %cmp7 = icmp eq i32 %and5, 0
  br i1 %cmp7, label %if.then8, label %if.end10

if.then8:                                         ; preds = %if.end6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.6, i64 0, i64 0), i64 53, i64 1, %struct._IO_FILE* %6) #9
  br label %cleanup

if.end10:                                         ; preds = %if.end, %if.end6
  %numNotStopped.136 = phi i32 [ %and5, %if.end6 ], [ %numNotStopped.0, %if.end ]
  store i32 1, i32* %state, align 8, !tbaa !12
  store i32 1, i32* %state1, align 8, !tbaa !12
  %8 = bitcast %struct.timeval* %tv to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %8) #7
  %call13 = call i32 @gettimeofday(%struct.timeval* nonnull %tv, %struct.timezone* null) #7
  %and14 = and i32 %numNotStopped.136, 2
  %tobool = icmp eq i32 %and14, 0
  br i1 %tobool, label %if.end16, label %if.then15

if.then15:                                        ; preds = %if.end10
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i64 0, i32 0
  %9 = load i64, i64* %tv_sec, align 8, !tbaa !17
  %mul = mul nsw i64 %9, 1000000
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i64 0, i32 1
  %10 = load i64, i64* %tv_usec, align 8, !tbaa !20
  %add = add nsw i64 %mul, %10
  %init = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %timer, i64 0, i32 2
  store i64 %add, i64* %init, align 8, !tbaa !21
  br label %if.end16

if.end16:                                         ; preds = %if.end10, %if.then15
  %and17 = and i32 %numNotStopped.136, 1
  %tobool18 = icmp eq i32 %and17, 0
  br i1 %tobool18, label %if.end25, label %if.then19

if.then19:                                        ; preds = %if.end16
  %tv_sec20 = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i64 0, i32 0
  %11 = load i64, i64* %tv_sec20, align 8, !tbaa !17
  %mul21 = mul nsw i64 %11, 1000000
  %tv_usec22 = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i64 0, i32 1
  %12 = load i64, i64* %tv_usec22, align 8, !tbaa !20
  %add23 = add nsw i64 %mul21, %12
  %init24 = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %subtimer, i64 0, i32 2
  store i64 %add23, i64* %init24, align 8, !tbaa !21
  br label %if.end25

if.end25:                                         ; preds = %if.end16, %if.then19
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %8) #7
  br label %cleanup

cleanup:                                          ; preds = %if.end25, %if.then8
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @pb_StopTimer(%struct.pb_Timer* nocapture %timer) local_unnamed_addr #0 {
entry:
  %tv = alloca %struct.timeval, align 8
  %state = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %timer, i64 0, i32 0
  %0 = load i32, i32* %state, align 8, !tbaa !12
  %cmp = icmp eq i32 %0, 1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.7, i64 0, i64 0), i64 41, i64 1, %struct._IO_FILE* %1) #9
  br label %cleanup

if.end:                                           ; preds = %entry
  store i32 0, i32* %state, align 8, !tbaa !12
  %3 = bitcast %struct.timeval* %tv to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %3) #7
  %call2 = call i32 @gettimeofday(%struct.timeval* nonnull %tv, %struct.timezone* null) #7
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i64 0, i32 0
  %4 = load i64, i64* %tv_sec, align 8, !tbaa !17
  %mul = mul nsw i64 %4, 1000000
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i64 0, i32 1
  %5 = load i64, i64* %tv_usec, align 8, !tbaa !20
  %add = add nsw i64 %mul, %5
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3) #7
  %elapsed = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %timer, i64 0, i32 1
  %init = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %timer, i64 0, i32 2
  %6 = load i64, i64* %init, align 8, !tbaa !21
  %sub.i = sub i64 %add, %6
  %7 = load i64, i64* %elapsed, align 8, !tbaa !22
  %add.i = add i64 %sub.i, %7
  store i64 %add.i, i64* %elapsed, align 8, !tbaa !22
  store i64 %add, i64* %init, align 8, !tbaa !21
  br label %cleanup

cleanup:                                          ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @_Z23pb_StopTimerAndSubTimerP8pb_TimerS0_(%struct.pb_Timer* nocapture %timer, %struct.pb_Timer* nocapture %subtimer) local_unnamed_addr #0 {
entry:
  %tv = alloca %struct.timeval, align 8
  %state = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %timer, i64 0, i32 0
  %0 = load i32, i32* %state, align 8, !tbaa !12
  %cmp = icmp eq i32 %0, 1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.8, i64 0, i64 0), i64 31, i64 1, %struct._IO_FILE* %1) #9
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %numNotRunning.0 = phi i32 [ 1, %if.then ], [ 3, %entry ]
  %state1 = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %subtimer, i64 0, i32 0
  %3 = load i32, i32* %state1, align 8, !tbaa !12
  %cmp2 = icmp eq i32 %3, 1
  br i1 %cmp2, label %if.end10, label %if.end6

if.end6:                                          ; preds = %if.end
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.9, i64 0, i64 0), i64 34, i64 1, %struct._IO_FILE* %4) #9
  %and5 = and i32 %numNotRunning.0, 2
  %cmp7 = icmp eq i32 %and5, 0
  br i1 %cmp7, label %if.then8, label %if.end10

if.then8:                                         ; preds = %if.end6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.10, i64 0, i64 0), i64 52, i64 1, %struct._IO_FILE* %6) #9
  br label %cleanup

if.end10:                                         ; preds = %if.end, %if.end6
  %numNotRunning.146 = phi i32 [ %and5, %if.end6 ], [ %numNotRunning.0, %if.end ]
  store i32 0, i32* %state, align 8, !tbaa !12
  store i32 0, i32* %state1, align 8, !tbaa !12
  %8 = bitcast %struct.timeval* %tv to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %8) #7
  %call13 = call i32 @gettimeofday(%struct.timeval* nonnull %tv, %struct.timezone* null) #7
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i64 0, i32 0
  %9 = load i64, i64* %tv_sec, align 8, !tbaa !17
  %mul = mul nsw i64 %9, 1000000
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i64 0, i32 1
  %10 = load i64, i64* %tv_usec, align 8, !tbaa !20
  %add = add nsw i64 %mul, %10
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %8) #7
  %and14 = and i32 %numNotRunning.146, 2
  %tobool = icmp eq i32 %and14, 0
  br i1 %tobool, label %if.end17, label %if.then15

if.then15:                                        ; preds = %if.end10
  %elapsed = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %timer, i64 0, i32 1
  %init = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %timer, i64 0, i32 2
  %11 = load i64, i64* %init, align 8, !tbaa !21
  %sub.i = sub i64 %add, %11
  %12 = load i64, i64* %elapsed, align 8, !tbaa !22
  %add.i = add i64 %sub.i, %12
  store i64 %add.i, i64* %elapsed, align 8, !tbaa !22
  store i64 %add, i64* %init, align 8, !tbaa !21
  br label %if.end17

if.end17:                                         ; preds = %if.end10, %if.then15
  %and18 = and i32 %numNotRunning.146, 1
  %tobool19 = icmp eq i32 %and18, 0
  br i1 %tobool19, label %cleanup, label %if.then20

if.then20:                                        ; preds = %if.end17
  %elapsed21 = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %subtimer, i64 0, i32 1
  %init22 = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %subtimer, i64 0, i32 2
  %13 = load i64, i64* %init22, align 8, !tbaa !21
  %sub.i43 = sub i64 %add, %13
  %14 = load i64, i64* %elapsed21, align 8, !tbaa !22
  %add.i44 = add i64 %sub.i43, %14
  store i64 %add.i44, i64* %elapsed21, align 8, !tbaa !22
  store i64 %add, i64* %init22, align 8, !tbaa !21
  br label %cleanup

cleanup:                                          ; preds = %if.then20, %if.end17, %if.then8
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local double @pb_GetElapsedTime(%struct.pb_Timer* nocapture readonly %timer) local_unnamed_addr #0 {
entry:
  %state = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %timer, i64 0, i32 0
  %0 = load i32, i32* %state, align 8, !tbaa !12
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.11, i64 0, i64 0), i64 48, i64 1, %struct._IO_FILE* %1) #9
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %elapsed = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %timer, i64 0, i32 1
  %3 = load i64, i64* %elapsed, align 8, !tbaa !16
  %conv = uitofp i64 %3 to double
  %div = fdiv double %conv, 1.000000e+06
  ret double %div
}

; Function Attrs: nounwind uwtable
define dso_local void @pb_InitializeTimerSet(%struct.pb_TimerSet* nocapture %timers) local_unnamed_addr #0 {
entry:
  %tv.i = alloca %struct.timeval, align 8
  %0 = bitcast %struct.timeval* %tv.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %0) #7
  %call.i = call i32 @gettimeofday(%struct.timeval* nonnull %tv.i, %struct.timezone* null) #7
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i, i64 0, i32 0
  %1 = load i64, i64* %tv_sec.i, align 8, !tbaa !17
  %mul.i = mul nsw i64 %1, 1000000
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i, i64 0, i32 1
  %2 = load i64, i64* %tv_usec.i, align 8, !tbaa !20
  %add.i = add nsw i64 %mul.i, %2
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %0) #7
  %wall_begin = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 3
  store i64 %add.i, i64* %wall_begin, align 8, !tbaa !23
  %current = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 0
  store i32 0, i32* %current, align 8, !tbaa !26
  %async_markers = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 1
  store %struct.pb_async_time_marker_list* null, %struct.pb_async_time_marker_list** %async_markers, align 8, !tbaa !27
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %state.i = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 4, i64 %indvars.iv, i32 0
  store i32 0, i32* %state.i, align 8, !tbaa !12
  %elapsed.i = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 4, i64 %indvars.iv, i32 1
  store i64 0, i64* %elapsed.i, align 8, !tbaa !16
  %arrayidx3 = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 5, i64 %indvars.iv
  store %struct.pb_SubTimerList* null, %struct.pb_SubTimerList** %arrayidx3, align 8, !tbaa !8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 8
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @pb_AddSubTimer(%struct.pb_TimerSet* nocapture %timers, i8* nocapture readonly %label, i32 %pb_Category) local_unnamed_addr #0 {
entry:
  %call = tail call noalias i8* @malloc(i64 40) #7
  %call1 = tail call i64 @strlen(i8* %label) #10
  %add = shl i64 %call1, 32
  %sext = add i64 %add, 4294967296
  %conv2 = ashr exact i64 %sext, 32
  %call3 = tail call noalias i8* @malloc(i64 %conv2) #7
  %label4 = bitcast i8* %call to i8**
  store i8* %call3, i8** %label4, align 8, !tbaa !28
  %strlen = tail call i64 @strlen(i8* %label)
  %leninc = add i64 %strlen, 1
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %call3, i8* align 1 %label, i64 %leninc, i1 false)
  %timer = getelementptr inbounds i8, i8* %call, i64 8
  %state.i = bitcast i8* %timer to i32*
  store i32 0, i32* %state.i, align 8, !tbaa !12
  %elapsed.i = getelementptr inbounds i8, i8* %call, i64 16
  %0 = bitcast i8* %elapsed.i to i64*
  store i64 0, i64* %0, align 8, !tbaa !16
  %next = getelementptr inbounds i8, i8* %call, i64 32
  %1 = bitcast i8* %next to %struct.pb_SubTimer**
  store %struct.pb_SubTimer* null, %struct.pb_SubTimer** %1, align 8, !tbaa !30
  %idxprom = zext i32 %pb_Category to i64
  %arrayidx = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 5, i64 %idxprom
  %2 = load %struct.pb_SubTimerList*, %struct.pb_SubTimerList** %arrayidx, align 8, !tbaa !8
  %cmp = icmp eq %struct.pb_SubTimerList* %2, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call7 = tail call noalias i8* @malloc(i64 16) #7
  %subtimer_list = getelementptr inbounds i8, i8* %call7, i64 8
  %3 = bitcast i8* %subtimer_list to i8**
  store i8* %call, i8** %3, align 8, !tbaa !31
  %4 = bitcast %struct.pb_SubTimerList** %arrayidx to i8**
  store i8* %call7, i8** %4, align 8, !tbaa !8
  br label %if.end

if.else:                                          ; preds = %entry
  %subtimer_list11 = getelementptr inbounds %struct.pb_SubTimerList, %struct.pb_SubTimerList* %2, i64 0, i32 1
  %5 = load %struct.pb_SubTimer*, %struct.pb_SubTimer** %subtimer_list11, align 8, !tbaa !31
  br label %while.cond

while.cond:                                       ; preds = %while.cond, %if.else
  %element.0 = phi %struct.pb_SubTimer* [ %5, %if.else ], [ %6, %while.cond ]
  %next12 = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %element.0, i64 0, i32 2
  %6 = load %struct.pb_SubTimer*, %struct.pb_SubTimer** %next12, align 8, !tbaa !30
  %cmp13 = icmp eq %struct.pb_SubTimer* %6, null
  br i1 %cmp13, label %while.end, label %while.cond

while.end:                                        ; preds = %while.cond
  %next12.le = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %element.0, i64 0, i32 2
  %7 = bitcast %struct.pb_SubTimer** %next12.le to i8**
  store i8* %call, i8** %7, align 8, !tbaa !30
  br label %if.end

if.end:                                           ; preds = %while.end, %if.then
  ret void
}

; Function Attrs: argmemonly nounwind readonly
declare dso_local i64 @strlen(i8* nocapture) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local void @pb_SwitchToSubTimer(%struct.pb_TimerSet* %timers, i8* readonly %label, i32 %category) local_unnamed_addr #0 {
entry:
  %tv.i131 = alloca %struct.timeval, align 8
  %tv.i120 = alloca %struct.timeval, align 8
  %tv.i105 = alloca %struct.timeval, align 8
  %tv.i = alloca %struct.timeval, align 8
  %current = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 0
  %0 = load i32, i32* %current, align 8, !tbaa !26
  %cmp = icmp eq i32 %0, %category
  %cmp2 = icmp eq i32 %0, 0
  %or.cond104 = or i1 %cmp, %cmp2
  %idxprom = zext i32 %0 to i64
  %arrayidx = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 4, i64 %idxprom
  %topLevelToStop.0 = select i1 %or.cond104, %struct.pb_Timer* null, %struct.pb_Timer* %arrayidx
  %arrayidx7 = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 5, i64 %idxprom
  %1 = load %struct.pb_SubTimerList*, %struct.pb_SubTimerList** %arrayidx7, align 8, !tbaa !8
  %cmp8 = icmp eq %struct.pb_SubTimerList* %1, null
  br i1 %cmp8, label %cond.end, label %cond.false

cond.false:                                       ; preds = %entry
  %current9 = getelementptr inbounds %struct.pb_SubTimerList, %struct.pb_SubTimerList* %1, i64 0, i32 0
  %2 = load %struct.pb_SubTimer*, %struct.pb_SubTimer** %current9, align 8, !tbaa !33
  br label %cond.end

cond.end:                                         ; preds = %entry, %cond.false
  %cond = phi %struct.pb_SubTimer* [ %2, %cond.false ], [ null, %entry ]
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
  %3 = load i32, i32* %state.i, align 8, !tbaa !12
  %cmp.i = icmp eq i32 %3, 1
  br i1 %cmp.i, label %if.end.i, label %if.then.i

if.then.i:                                        ; preds = %if.then18
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.7, i64 0, i64 0), i64 41, i64 1, %struct._IO_FILE* %4) #8
  br label %if.end23

if.end.i:                                         ; preds = %if.then18
  store i32 0, i32* %state.i, align 8, !tbaa !12
  %6 = bitcast %struct.timeval* %tv.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %6) #7
  %call2.i = call i32 @gettimeofday(%struct.timeval* nonnull %tv.i, %struct.timezone* null) #7
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i, i64 0, i32 0
  %7 = load i64, i64* %tv_sec.i, align 8, !tbaa !17
  %mul.i = mul nsw i64 %7, 1000000
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i, i64 0, i32 1
  %8 = load i64, i64* %tv_usec.i, align 8, !tbaa !20
  %add.i = add nsw i64 %mul.i, %8
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %6) #7
  %elapsed.i = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %cond, i64 0, i32 1, i32 1
  %init.i = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %cond, i64 0, i32 1, i32 2
  %9 = load i64, i64* %init.i, align 8, !tbaa !21
  %sub.i.i = sub i64 %add.i, %9
  %10 = load i64, i64* %elapsed.i, align 8, !tbaa !22
  %add.i.i = add i64 %sub.i.i, %10
  store i64 %add.i.i, i64* %elapsed.i, align 8, !tbaa !22
  store i64 %add.i, i64* %init.i, align 8, !tbaa !21
  br label %if.end23

if.else20:                                        ; preds = %if.else
  %state.i106 = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %topLevelToStop.0, i64 0, i32 0
  %11 = load i32, i32* %state.i106, align 8, !tbaa !12
  %cmp.i107 = icmp eq i32 %11, 1
  br i1 %cmp.i107, label %if.end.i118, label %if.then.i108

if.then.i108:                                     ; preds = %if.else20
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.7, i64 0, i64 0), i64 41, i64 1, %struct._IO_FILE* %12) #8
  br label %if.end23

if.end.i118:                                      ; preds = %if.else20
  store i32 0, i32* %state.i106, align 8, !tbaa !12
  %14 = bitcast %struct.timeval* %tv.i105 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %14) #7
  %call2.i109 = call i32 @gettimeofday(%struct.timeval* nonnull %tv.i105, %struct.timezone* null) #7
  %tv_sec.i110 = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i105, i64 0, i32 0
  %15 = load i64, i64* %tv_sec.i110, align 8, !tbaa !17
  %mul.i111 = mul nsw i64 %15, 1000000
  %tv_usec.i112 = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i105, i64 0, i32 1
  %16 = load i64, i64* %tv_usec.i112, align 8, !tbaa !20
  %add.i113 = add nsw i64 %mul.i111, %16
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %14) #7
  %elapsed.i114 = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %topLevelToStop.0, i64 0, i32 1
  %init.i115 = getelementptr inbounds %struct.pb_Timer, %struct.pb_Timer* %topLevelToStop.0, i64 0, i32 2
  %17 = load i64, i64* %init.i115, align 8, !tbaa !21
  %sub.i.i116 = sub i64 %add.i113, %17
  %18 = load i64, i64* %elapsed.i114, align 8, !tbaa !22
  %add.i.i117 = add i64 %sub.i.i116, %18
  store i64 %add.i.i117, i64* %elapsed.i114, align 8, !tbaa !22
  store i64 %add.i113, i64* %init.i115, align 8, !tbaa !21
  br label %if.end23

if.end23:                                         ; preds = %if.end.i118, %if.then.i108, %if.end.i, %if.then.i, %cond.end, %if.then16
  %idxprom25 = zext i32 %category to i64
  %arrayidx26 = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 5, i64 %idxprom25
  %19 = load %struct.pb_SubTimerList*, %struct.pb_SubTimerList** %arrayidx26, align 8, !tbaa !8
  %cmp27 = icmp eq i8* %label, null
  br i1 %cmp27, label %if.end35, label %if.then28

if.then28:                                        ; preds = %if.end23
  %subtimer_list = getelementptr inbounds %struct.pb_SubTimerList, %struct.pb_SubTimerList* %19, i64 0, i32 1
  %subtimer.0144 = load %struct.pb_SubTimer*, %struct.pb_SubTimer** %subtimer_list, align 8, !tbaa !8
  %cmp29145 = icmp eq %struct.pb_SubTimer* %subtimer.0144, null
  br i1 %cmp29145, label %if.end35, label %while.body

while.body:                                       ; preds = %if.then28, %if.else33
  %subtimer.0146 = phi %struct.pb_SubTimer* [ %subtimer.0, %if.else33 ], [ %subtimer.0144, %if.then28 ]
  %label30 = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %subtimer.0146, i64 0, i32 0
  %20 = load i8*, i8** %label30, align 8, !tbaa !28
  %call = tail call i32 @strcmp(i8* %20, i8* nonnull %label) #10
  %cmp31 = icmp eq i32 %call, 0
  br i1 %cmp31, label %if.end35, label %if.else33

if.else33:                                        ; preds = %while.body
  %next = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %subtimer.0146, i64 0, i32 2
  %subtimer.0 = load %struct.pb_SubTimer*, %struct.pb_SubTimer** %next, align 8, !tbaa !8
  %cmp29 = icmp eq %struct.pb_SubTimer* %subtimer.0, null
  br i1 %cmp29, label %if.end35, label %while.body

if.end35:                                         ; preds = %while.body, %if.else33, %if.then28, %if.end23
  %subtimer.1 = phi %struct.pb_SubTimer* [ null, %if.end23 ], [ null, %if.then28 ], [ %subtimer.0146, %while.body ], [ null, %if.else33 ]
  %cmp36 = icmp eq i32 %category, 0
  br i1 %cmp36, label %if.end61, label %if.then37

if.then37:                                        ; preds = %if.end35
  %cmp38 = icmp eq %struct.pb_SubTimerList* %19, null
  br i1 %cmp38, label %if.end41, label %if.then39

if.then39:                                        ; preds = %if.then37
  %current40 = getelementptr inbounds %struct.pb_SubTimerList, %struct.pb_SubTimerList* %19, i64 0, i32 0
  store %struct.pb_SubTimer* %subtimer.1, %struct.pb_SubTimer** %current40, align 8, !tbaa !33
  br label %if.end41

if.end41:                                         ; preds = %if.then37, %if.then39
  %21 = load i32, i32* %current, align 8, !tbaa !26
  %cmp43 = icmp ne i32 %21, %category
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
  %22 = load i32, i32* %state.i121, align 8, !tbaa !12
  %cmp.i122 = icmp eq i32 %22, 0
  br i1 %cmp.i122, label %if.end.i130, label %if.then.i123

if.then.i123:                                     ; preds = %if.then53
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.3, i64 0, i64 0), i64 42, i64 1, %struct._IO_FILE* %23) #8
  br label %if.end61

if.end.i130:                                      ; preds = %if.then53
  store i32 1, i32* %state.i121, align 8, !tbaa !12
  %25 = bitcast %struct.timeval* %tv.i120 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %25) #7
  %call2.i124 = call i32 @gettimeofday(%struct.timeval* nonnull %tv.i120, %struct.timezone* null) #7
  %tv_sec.i125 = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i120, i64 0, i32 0
  %26 = load i64, i64* %tv_sec.i125, align 8, !tbaa !17
  %mul.i126 = mul nsw i64 %26, 1000000
  %tv_usec.i127 = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i120, i64 0, i32 1
  %27 = load i64, i64* %tv_usec.i127, align 8, !tbaa !20
  %add.i128 = add nsw i64 %mul.i126, %27
  %init.i129 = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %subtimer.1, i64 0, i32 1, i32 2
  store i64 %add.i128, i64* %init.i129, align 8, !tbaa !21
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %25) #7
  br label %if.end61

if.else55:                                        ; preds = %if.else51
  %state.i132 = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 4, i64 %idxprom25, i32 0
  %28 = load i32, i32* %state.i132, align 8, !tbaa !12
  %cmp.i133 = icmp eq i32 %28, 0
  br i1 %cmp.i133, label %if.end.i141, label %if.then.i134

if.then.i134:                                     ; preds = %if.else55
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %30 = tail call i64 @fwrite(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.3, i64 0, i64 0), i64 42, i64 1, %struct._IO_FILE* %29) #8
  br label %if.end61

if.end.i141:                                      ; preds = %if.else55
  store i32 1, i32* %state.i132, align 8, !tbaa !12
  %31 = bitcast %struct.timeval* %tv.i131 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %31) #7
  %call2.i135 = call i32 @gettimeofday(%struct.timeval* nonnull %tv.i131, %struct.timezone* null) #7
  %tv_sec.i136 = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i131, i64 0, i32 0
  %32 = load i64, i64* %tv_sec.i136, align 8, !tbaa !17
  %mul.i137 = mul nsw i64 %32, 1000000
  %tv_usec.i138 = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i131, i64 0, i32 1
  %33 = load i64, i64* %tv_usec.i138, align 8, !tbaa !20
  %add.i139 = add nsw i64 %mul.i137, %33
  %init.i140 = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 4, i64 %idxprom25, i32 2
  store i64 %add.i139, i64* %init.i140, align 8, !tbaa !21
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %31) #7
  br label %if.end61

if.end61:                                         ; preds = %if.end.i141, %if.then.i134, %if.end.i130, %if.then.i123, %if.end35, %if.then46
  store i32 %category, i32* %current, align 8, !tbaa !26
  ret void
}

; Function Attrs: nounwind readonly
declare dso_local i32 @strcmp(i8* nocapture, i8* nocapture) local_unnamed_addr #6

; Function Attrs: nounwind uwtable
define dso_local void @pb_SwitchToTimer(%struct.pb_TimerSet* nocapture %timers, i32 %timer) local_unnamed_addr #0 {
entry:
  %tv.i43 = alloca %struct.timeval, align 8
  %tv.i = alloca %struct.timeval, align 8
  %current = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 0
  %0 = load i32, i32* %current, align 8, !tbaa !26
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.end21, label %if.then

if.then:                                          ; preds = %entry
  %idxprom = zext i32 %0 to i64
  %arrayidx = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 5, i64 %idxprom
  %1 = load %struct.pb_SubTimerList*, %struct.pb_SubTimerList** %arrayidx, align 8, !tbaa !8
  %cmp2 = icmp eq %struct.pb_SubTimerList* %1, null
  br i1 %cmp2, label %if.else, label %if.end

if.end:                                           ; preds = %if.then
  %current8 = getelementptr inbounds %struct.pb_SubTimerList, %struct.pb_SubTimerList* %1, i64 0, i32 0
  %2 = load %struct.pb_SubTimer*, %struct.pb_SubTimer** %current8, align 8, !tbaa !33
  %cmp9 = icmp eq %struct.pb_SubTimer* %2, null
  br i1 %cmp9, label %if.else, label %if.then10

if.then10:                                        ; preds = %if.end
  %arrayidx14 = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 4, i64 %idxprom
  %timer15 = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %2, i64 0, i32 1
  tail call void @_Z23pb_StopTimerAndSubTimerP8pb_TimerS0_(%struct.pb_Timer* nonnull %arrayidx14, %struct.pb_Timer* nonnull %timer15)
  br label %if.end21

if.else:                                          ; preds = %if.then, %if.end
  %state.i = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 4, i64 %idxprom, i32 0
  %3 = load i32, i32* %state.i, align 8, !tbaa !12
  %cmp.i = icmp eq i32 %3, 1
  br i1 %cmp.i, label %if.end.i, label %if.then.i

if.then.i:                                        ; preds = %if.else
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.7, i64 0, i64 0), i64 41, i64 1, %struct._IO_FILE* %4) #8
  br label %if.end21

if.end.i:                                         ; preds = %if.else
  store i32 0, i32* %state.i, align 8, !tbaa !12
  %6 = bitcast %struct.timeval* %tv.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %6) #7
  %call2.i = call i32 @gettimeofday(%struct.timeval* nonnull %tv.i, %struct.timezone* null) #7
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i, i64 0, i32 0
  %7 = load i64, i64* %tv_sec.i, align 8, !tbaa !17
  %mul.i = mul nsw i64 %7, 1000000
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i, i64 0, i32 1
  %8 = load i64, i64* %tv_usec.i, align 8, !tbaa !20
  %add.i = add nsw i64 %mul.i, %8
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %6) #7
  %elapsed.i = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 4, i64 %idxprom, i32 1
  %init.i = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 4, i64 %idxprom, i32 2
  %9 = load i64, i64* %init.i, align 8, !tbaa !21
  %sub.i.i = sub i64 %add.i, %9
  %10 = load i64, i64* %elapsed.i, align 8, !tbaa !22
  %add.i.i = add i64 %sub.i.i, %10
  store i64 %add.i.i, i64* %elapsed.i, align 8, !tbaa !22
  store i64 %add.i, i64* %init.i, align 8, !tbaa !21
  br label %if.end21

if.end21:                                         ; preds = %if.end.i, %if.then.i, %if.then10, %entry
  store i32 %timer, i32* %current, align 8, !tbaa !26
  %cmp23 = icmp eq i32 %timer, 0
  br i1 %cmp23, label %if.end28, label %if.then24

if.then24:                                        ; preds = %if.end21
  %idxprom26 = zext i32 %timer to i64
  %state.i44 = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 4, i64 %idxprom26, i32 0
  %11 = load i32, i32* %state.i44, align 8, !tbaa !12
  %cmp.i45 = icmp eq i32 %11, 0
  br i1 %cmp.i45, label %if.end.i53, label %if.then.i46

if.then.i46:                                      ; preds = %if.then24
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.3, i64 0, i64 0), i64 42, i64 1, %struct._IO_FILE* %12) #8
  br label %if.end28

if.end.i53:                                       ; preds = %if.then24
  store i32 1, i32* %state.i44, align 8, !tbaa !12
  %14 = bitcast %struct.timeval* %tv.i43 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %14) #7
  %call2.i47 = call i32 @gettimeofday(%struct.timeval* nonnull %tv.i43, %struct.timezone* null) #7
  %tv_sec.i48 = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i43, i64 0, i32 0
  %15 = load i64, i64* %tv_sec.i48, align 8, !tbaa !17
  %mul.i49 = mul nsw i64 %15, 1000000
  %tv_usec.i50 = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i43, i64 0, i32 1
  %16 = load i64, i64* %tv_usec.i50, align 8, !tbaa !20
  %add.i51 = add nsw i64 %mul.i49, %16
  %init.i52 = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 4, i64 %idxprom26, i32 2
  store i64 %add.i51, i64* %init.i52, align 8, !tbaa !21
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %14) #7
  br label %if.end28

if.end28:                                         ; preds = %if.end.i53, %if.then.i46, %if.end21
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @pb_PrintTimerSet(%struct.pb_TimerSet* nocapture readonly %timers) local_unnamed_addr #0 {
entry:
  %tv.i = alloca %struct.timeval, align 8
  %categories = alloca [6 x i8*], align 16
  %0 = bitcast %struct.timeval* %tv.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %0) #7
  %call.i = call i32 @gettimeofday(%struct.timeval* nonnull %tv.i, %struct.timezone* null) #7
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i, i64 0, i32 0
  %1 = load i64, i64* %tv_sec.i, align 8, !tbaa !17
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %tv.i, i64 0, i32 1
  %2 = load i64, i64* %tv_usec.i, align 8, !tbaa !20
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %0) #7
  %3 = bitcast [6 x i8*]* %categories to i8*
  call void @llvm.lifetime.start.p0i8(i64 48, i8* nonnull %3) #7
  %4 = getelementptr inbounds [6 x i8*], [6 x i8*]* %categories, i64 0, i64 0
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.13, i64 0, i64 0), i8** %4, align 16
  %5 = getelementptr inbounds [6 x i8*], [6 x i8*]* %categories, i64 0, i64 1
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.14, i64 0, i64 0), i8** %5, align 8
  %6 = getelementptr inbounds [6 x i8*], [6 x i8*]* %categories, i64 0, i64 2
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.15, i64 0, i64 0), i8** %6, align 16
  %7 = getelementptr inbounds [6 x i8*], [6 x i8*]* %categories, i64 0, i64 3
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.16, i64 0, i64 0), i8** %7, align 8
  %8 = getelementptr inbounds [6 x i8*], [6 x i8*]* %categories, i64 0, i64 4
  store i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.17, i64 0, i64 0), i8** %8, align 16
  %9 = getelementptr inbounds [6 x i8*], [6 x i8*]* %categories, i64 0, i64 5
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.18, i64 0, i64 0), i8** %9, align 8
  br label %for.body

for.body:                                         ; preds = %for.inc, %entry
  %indvars.iv = phi i64 [ 1, %entry ], [ %indvars.iv.next, %for.inc ]
  %state.i = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 4, i64 %indvars.iv, i32 0
  %10 = load i32, i32* %state.i, align 8, !tbaa !12
  %cmp.i = icmp eq i32 %10, 0
  br i1 %cmp.i, label %pb_GetElapsedTime.exit, label %if.then.i

if.then.i:                                        ; preds = %for.body
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.11, i64 0, i64 0), i64 48, i64 1, %struct._IO_FILE* %11) #8
  br label %pb_GetElapsedTime.exit

pb_GetElapsedTime.exit:                           ; preds = %for.body, %if.then.i
  %elapsed.i = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 4, i64 %indvars.iv, i32 1
  %13 = load i64, i64* %elapsed.i, align 8, !tbaa !16
  %conv.i = uitofp i64 %13 to double
  %div.i = fdiv double %conv.i, 1.000000e+06
  %cmp3 = fcmp une double %div.i, 0.000000e+00
  br i1 %cmp3, label %if.then, label %for.inc

if.then:                                          ; preds = %pb_GetElapsedTime.exit
  %14 = add nsw i64 %indvars.iv, -1
  %arrayidx6 = getelementptr inbounds [6 x i8*], [6 x i8*]* %categories, i64 0, i64 %14
  %15 = load i8*, i8** %arrayidx6, align 8, !tbaa !8
  %16 = load i32, i32* %state.i, align 8, !tbaa !12
  %cmp.i86 = icmp eq i32 %16, 0
  br i1 %cmp.i86, label %pb_GetElapsedTime.exit91, label %if.then.i87

if.then.i87:                                      ; preds = %if.then
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %18 = tail call i64 @fwrite(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.11, i64 0, i64 0), i64 48, i64 1, %struct._IO_FILE* %17) #8
  %.pre = load i64, i64* %elapsed.i, align 8, !tbaa !16
  %.pre124 = uitofp i64 %.pre to double
  %.pre125 = fdiv double %.pre124, 1.000000e+06
  br label %pb_GetElapsedTime.exit91

pb_GetElapsedTime.exit91:                         ; preds = %if.then, %if.then.i87
  %div.i90.pre-phi = phi double [ %div.i, %if.then ], [ %.pre125, %if.then.i87 ]
  %call10 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.19, i64 0, i64 0), i32 10, i8* %15, double %div.i90.pre-phi)
  %arrayidx12 = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 5, i64 %indvars.iv
  %19 = load %struct.pb_SubTimerList*, %struct.pb_SubTimerList** %arrayidx12, align 8, !tbaa !8
  %cmp13 = icmp eq %struct.pb_SubTimerList* %19, null
  br i1 %cmp13, label %for.inc, label %if.then14

if.then14:                                        ; preds = %pb_GetElapsedTime.exit91
  %subtimer_list = getelementptr inbounds %struct.pb_SubTimerList, %struct.pb_SubTimerList* %19, i64 0, i32 1
  %sub.0113 = load %struct.pb_SubTimer*, %struct.pb_SubTimer** %subtimer_list, align 8, !tbaa !8
  %cmp18114 = icmp eq %struct.pb_SubTimer* %sub.0113, null
  br i1 %cmp18114, label %for.inc, label %while.body

while.body:                                       ; preds = %if.then14, %while.body
  %sub.0116 = phi %struct.pb_SubTimer* [ %sub.0, %while.body ], [ %sub.0113, %if.then14 ]
  %maxSubLength.0115 = phi i32 [ %spec.select, %while.body ], [ 0, %if.then14 ]
  %label = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %sub.0116, i64 0, i32 0
  %20 = load i8*, i8** %label, align 8, !tbaa !28
  %call19 = tail call i64 @strlen(i8* %20) #10
  %conv = sext i32 %maxSubLength.0115 to i64
  %cmp20 = icmp ugt i64 %call19, %conv
  %conv24 = trunc i64 %call19 to i32
  %spec.select = select i1 %cmp20, i32 %conv24, i32 %maxSubLength.0115
  %next = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %sub.0116, i64 0, i32 2
  %sub.0 = load %struct.pb_SubTimer*, %struct.pb_SubTimer** %next, align 8, !tbaa !8
  %cmp18 = icmp eq %struct.pb_SubTimer* %sub.0, null
  br i1 %cmp18, label %while.end, label %while.body

while.end:                                        ; preds = %while.body
  %cmp25 = icmp sgt i32 %spec.select, 10
  %spec.select129 = select i1 %cmp25, i32 %spec.select, i32 10
  br i1 %cmp18114, label %for.inc, label %while.body34

while.body34:                                     ; preds = %while.end, %pb_GetElapsedTime.exit98
  %sub.1119 = phi %struct.pb_SubTimer* [ %sub.1, %pb_GetElapsedTime.exit98 ], [ %sub.0113, %while.end ]
  %label35 = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %sub.1119, i64 0, i32 0
  %21 = load i8*, i8** %label35, align 8, !tbaa !28
  %state.i92 = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %sub.1119, i64 0, i32 1, i32 0
  %22 = load i32, i32* %state.i92, align 8, !tbaa !12
  %cmp.i93 = icmp eq i32 %22, 0
  br i1 %cmp.i93, label %pb_GetElapsedTime.exit98, label %if.then.i94

if.then.i94:                                      ; preds = %while.body34
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.11, i64 0, i64 0), i64 48, i64 1, %struct._IO_FILE* %23) #8
  br label %pb_GetElapsedTime.exit98

pb_GetElapsedTime.exit98:                         ; preds = %while.body34, %if.then.i94
  %elapsed.i95 = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %sub.1119, i64 0, i32 1, i32 1
  %25 = load i64, i64* %elapsed.i95, align 8, !tbaa !16
  %conv.i96 = uitofp i64 %25 to double
  %div.i97 = fdiv double %conv.i96, 1.000000e+06
  %call37 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.20, i64 0, i64 0), i32 %spec.select129, i8* %21, double %div.i97)
  %next38 = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %sub.1119, i64 0, i32 2
  %sub.1 = load %struct.pb_SubTimer*, %struct.pb_SubTimer** %next38, align 8, !tbaa !8
  %cmp33 = icmp eq %struct.pb_SubTimer* %sub.1, null
  br i1 %cmp33, label %for.inc, label %while.body34

for.inc:                                          ; preds = %pb_GetElapsedTime.exit98, %if.then14, %while.end, %pb_GetElapsedTime.exit91, %pb_GetElapsedTime.exit
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 7
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc
  %mul.i = mul nsw i64 %1, 1000000
  %add.i = add nsw i64 %mul.i, %2
  %state.i99 = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 4, i64 7, i32 0
  %26 = load i32, i32* %state.i99, align 8, !tbaa !12
  %cmp.i100 = icmp eq i32 %26, 0
  br i1 %cmp.i100, label %pb_GetElapsedTime.exit105, label %if.then.i101

if.then.i101:                                     ; preds = %for.end
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %28 = tail call i64 @fwrite(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.11, i64 0, i64 0), i64 48, i64 1, %struct._IO_FILE* %27) #8
  br label %pb_GetElapsedTime.exit105

pb_GetElapsedTime.exit105:                        ; preds = %for.end, %if.then.i101
  %elapsed.i102 = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 4, i64 7, i32 1
  %29 = load i64, i64* %elapsed.i102, align 8, !tbaa !16
  %conv.i103 = uitofp i64 %29 to double
  %div.i104 = fdiv double %conv.i103, 1.000000e+06
  %cmp44 = fcmp une double %div.i104, 0.000000e+00
  br i1 %cmp44, label %if.then45, label %if.end49

if.then45:                                        ; preds = %pb_GetElapsedTime.exit105
  %30 = load i32, i32* %state.i99, align 8, !tbaa !12
  %cmp.i107 = icmp eq i32 %30, 0
  br i1 %cmp.i107, label %pb_GetElapsedTime.exit112, label %if.then.i108

if.then.i108:                                     ; preds = %if.then45
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %32 = tail call i64 @fwrite(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.11, i64 0, i64 0), i64 48, i64 1, %struct._IO_FILE* %31) #8
  %.pre123 = load i64, i64* %elapsed.i102, align 8, !tbaa !16
  %.pre126 = uitofp i64 %.pre123 to double
  %.pre127 = fdiv double %.pre126, 1.000000e+06
  br label %pb_GetElapsedTime.exit112

pb_GetElapsedTime.exit112:                        ; preds = %if.then45, %if.then.i108
  %div.i111.pre-phi = phi double [ %div.i104, %if.then45 ], [ %.pre127, %if.then.i108 ]
  %call48 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.21, i64 0, i64 0), double %div.i111.pre-phi)
  br label %if.end49

if.end49:                                         ; preds = %pb_GetElapsedTime.exit112, %pb_GetElapsedTime.exit105
  %wall_begin = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 3
  %33 = load i64, i64* %wall_begin, align 8, !tbaa !23
  %sub50 = sub i64 %add.i, %33
  %conv51 = uitofp i64 %sub50 to double
  %div = fdiv double %conv51, 1.000000e+06
  %conv52 = fptrunc double %div to float
  %conv53 = fpext float %conv52 to double
  %call54 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.22, i64 0, i64 0), double %conv53)
  call void @llvm.lifetime.end.p0i8(i64 48, i8* nonnull %3) #7
  ret void
}

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define dso_local void @pb_DestroyTimerSet(%struct.pb_TimerSet* nocapture %timers) local_unnamed_addr #0 {
entry:
  %async_markers = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 1
  %0 = load %struct.pb_async_time_marker_list*, %struct.pb_async_time_marker_list** %async_markers, align 8, !tbaa !8
  %cmp38 = icmp eq %struct.pb_async_time_marker_list* %0, null
  br i1 %cmp38, label %for.body.preheader, label %while.body

while.body:                                       ; preds = %entry, %while.body
  %1 = phi %struct.pb_async_time_marker_list* [ %3, %while.body ], [ %0, %entry ]
  %event.039 = phi %struct.pb_async_time_marker_list** [ %next1, %while.body ], [ %async_markers, %entry ]
  %next1 = getelementptr inbounds %struct.pb_async_time_marker_list, %struct.pb_async_time_marker_list* %1, i64 0, i32 3
  %2 = bitcast %struct.pb_async_time_marker_list* %1 to i8*
  tail call void @free(i8* %2) #7
  store %struct.pb_async_time_marker_list* null, %struct.pb_async_time_marker_list** %event.039, align 8, !tbaa !8
  %3 = load %struct.pb_async_time_marker_list*, %struct.pb_async_time_marker_list** %next1, align 8, !tbaa !8
  %cmp = icmp eq %struct.pb_async_time_marker_list* %3, null
  br i1 %cmp, label %for.body.preheader, label %while.body

for.body.preheader:                               ; preds = %while.body, %entry
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body.preheader ]
  %arrayidx = getelementptr inbounds %struct.pb_TimerSet, %struct.pb_TimerSet* %timers, i64 0, i32 5, i64 %indvars.iv
  %4 = load %struct.pb_SubTimerList*, %struct.pb_SubTimerList** %arrayidx, align 8, !tbaa !8
  %cmp3 = icmp eq %struct.pb_SubTimerList* %4, null
  br i1 %cmp3, label %for.inc, label %if.then

if.then:                                          ; preds = %for.body
  %5 = bitcast %struct.pb_SubTimerList* %4 to i8*
  %subtimer_list = getelementptr inbounds %struct.pb_SubTimerList, %struct.pb_SubTimerList* %4, i64 0, i32 1
  %6 = load %struct.pb_SubTimer*, %struct.pb_SubTimer** %subtimer_list, align 8, !tbaa !31
  %cmp835 = icmp eq %struct.pb_SubTimer* %6, null
  br i1 %cmp835, label %while.end11, label %while.body9

while.body9:                                      ; preds = %if.then, %while.body9
  %.in3436 = phi %struct.pb_SubTimer* [ %9, %while.body9 ], [ %6, %if.then ]
  %7 = bitcast %struct.pb_SubTimer* %.in3436 to i8*
  %label = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %.in3436, i64 0, i32 0
  %8 = load i8*, i8** %label, align 8, !tbaa !28
  tail call void @free(i8* %8) #7
  %next10 = getelementptr inbounds %struct.pb_SubTimer, %struct.pb_SubTimer* %.in3436, i64 0, i32 2
  %9 = load %struct.pb_SubTimer*, %struct.pb_SubTimer** %next10, align 8, !tbaa !30
  tail call void @free(i8* %7) #7
  %cmp8 = icmp eq %struct.pb_SubTimer* %9, null
  br i1 %cmp8, label %while.end11.loopexit, label %while.body9

while.end11.loopexit:                             ; preds = %while.body9
  %.phi.trans.insert = bitcast %struct.pb_SubTimerList** %arrayidx to i8**
  %.pre = load i8*, i8** %.phi.trans.insert, align 8, !tbaa !8
  br label %while.end11

while.end11:                                      ; preds = %if.then, %while.end11.loopexit
  %10 = phi i8* [ %.pre, %while.end11.loopexit ], [ %5, %if.then ]
  tail call void @free(i8* %10) #7
  br label %for.inc

for.inc:                                          ; preds = %for.body, %while.end11
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 8
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #7

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { norecurse nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { cold nounwind }
attributes #9 = { cold }
attributes #10 = { nounwind readonly }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (/home/ts20/share/llvm9/llvm-project/clang 3775794812e582769e2ed1b53c00650a6b21387c)"}
!2 = !{!3, !4, i64 0}
!3 = !{!"_ZTS13pb_Parameters", !4, i64 0, !4, i64 8}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{!3, !4, i64 8}
!8 = !{!4, !4, i64 0}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !5, i64 0}
!11 = !{!5, !5, i64 0}
!12 = !{!13, !14, i64 0}
!13 = !{!"_ZTS8pb_Timer", !14, i64 0, !15, i64 8, !15, i64 16}
!14 = !{!"_ZTS13pb_TimerState", !5, i64 0}
!15 = !{!"long long", !5, i64 0}
!16 = !{!13, !15, i64 8}
!17 = !{!18, !19, i64 0}
!18 = !{!"_ZTS7timeval", !19, i64 0, !19, i64 8}
!19 = !{!"long", !5, i64 0}
!20 = !{!18, !19, i64 8}
!21 = !{!13, !15, i64 16}
!22 = !{!15, !15, i64 0}
!23 = !{!24, !15, i64 24}
!24 = !{!"_ZTS11pb_TimerSet", !25, i64 0, !4, i64 8, !15, i64 16, !15, i64 24, !5, i64 32, !5, i64 224}
!25 = !{!"_ZTS10pb_TimerID", !5, i64 0}
!26 = !{!24, !25, i64 0}
!27 = !{!24, !4, i64 8}
!28 = !{!29, !4, i64 0}
!29 = !{!"_ZTS11pb_SubTimer", !4, i64 0, !13, i64 8, !4, i64 32}
!30 = !{!29, !4, i64 32}
!31 = !{!32, !4, i64 8}
!32 = !{!"_ZTS15pb_SubTimerList", !4, i64 0, !4, i64 8}
!33 = !{!32, !4, i64 0}

; ModuleID = 'decades_base/main_visited.cpp'
source_filename = "decades_base/main_visited.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.pb_TimerSet = type { i32, %struct.pb_async_time_marker_list*, i64, i64, [8 x %struct.pb_Timer], [8 x %struct.pb_SubTimerList*] }
%struct.pb_async_time_marker_list = type { i8*, i32, i8*, %struct.pb_async_time_marker_list* }
%struct.pb_Timer = type { i32, i64, i64 }
%struct.pb_SubTimerList = type { %struct.pb_SubTimer*, %struct.pb_SubTimer* }
%struct.pb_SubTimer = type { i8*, %struct.pb_Timer, %struct.pb_SubTimer* }
%struct.pb_Parameters = type { i8*, i8** }

@.str.2 = private unnamed_addr constant [21 x i8] c"Input file expected\0A\00", align 1
@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.3 = private unnamed_addr constant [45 x i8] c"Expected at least one command line argument\0A\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"Input\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"Output\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.7 = private unnamed_addr constant [53 x i8] c"Error reading input and output dimensions from file\0A\00", align 1
@.str.8 = private unnamed_addr constant [37 x i8] c"Error reading input array from file\0A\00", align 1
@str = private unnamed_addr constant [38 x i8] c"Base implementation of histogramming.\00", align 1
@str.10 = private unnamed_addr constant [47 x i8] c"Maintained by Nady Obeid <obeid1@ece.uiuc.edu>\00", align 1

; Function Attrs: norecurse uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %argc.addr = alloca i32, align 4
  %timers = alloca %struct.pb_TimerSet, align 8
  %img_width = alloca i32, align 4
  %img_height = alloca i32, align 4
  %histo_width = alloca i32, align 4
  %histo_height = alloca i32, align 4
  store i32 %argc, i32* %argc.addr, align 4, !tbaa !2
  %0 = bitcast %struct.pb_TimerSet* %timers to i8*
  call void @llvm.lifetime.start.p0i8(i64 288, i8* nonnull %0) #5
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @str, i64 0, i64 0))
  %puts126 = tail call i32 @puts(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @str.10, i64 0, i64 0))
  %call2 = call %struct.pb_Parameters* @pb_ReadParameters(i32* nonnull %argc.addr, i8** %argv)
  %tobool = icmp eq %struct.pb_Parameters* %call2, null
  br i1 %tobool, label %cleanup85, label %if.end

if.end:                                           ; preds = %entry
  %inpFiles = getelementptr inbounds %struct.pb_Parameters, %struct.pb_Parameters* %call2, i64 0, i32 1
  %1 = load i8**, i8*** %inpFiles, align 8, !tbaa !6
  %2 = load i8*, i8** %1, align 8, !tbaa !9
  %tobool3 = icmp eq i8* %2, null
  br i1 %tobool3, label %if.then4, label %if.end6

if.then4:                                         ; preds = %if.end
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !9
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.2, i64 0, i64 0), i64 20, i64 1, %struct._IO_FILE* %3) #6
  br label %cleanup85

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %argc.addr, align 4, !tbaa !2
  %cmp = icmp sgt i32 %5, 1
  br i1 %cmp, label %if.then7, label %if.else

if.then7:                                         ; preds = %if.end6
  %arrayidx8 = getelementptr inbounds i8*, i8** %argv, i64 1
  %6 = load i8*, i8** %arrayidx8, align 8, !tbaa !9
  %call9 = call i32 @atoi(i8* %6) #7
  call void @pb_InitializeTimerSet(%struct.pb_TimerSet* nonnull %timers)
  call void @pb_AddSubTimer(%struct.pb_TimerSet* nonnull %timers, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i64 0, i64 0), i32 1)
  call void @pb_AddSubTimer(%struct.pb_TimerSet* nonnull %timers, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), i32 1)
  call void @pb_SwitchToSubTimer(%struct.pb_TimerSet* nonnull %timers, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i64 0, i64 0), i32 1)
  %7 = bitcast i32* %img_width to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %7) #5
  %8 = bitcast i32* %img_height to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %8) #5
  %9 = bitcast i32* %histo_width to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %9) #5
  %10 = bitcast i32* %histo_height to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %10) #5
  %11 = load i8**, i8*** %inpFiles, align 8, !tbaa !6
  %12 = load i8*, i8** %11, align 8, !tbaa !9
  %call14 = call %struct._IO_FILE* @fopen(i8* %12, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i64 0, i64 0))
  %13 = call i64 @fread_unlocked(i8* nonnull %7, i64 4, i64 1, %struct._IO_FILE* %call14)
  %14 = call i64 @fread_unlocked(i8* nonnull %8, i64 4, i64 1, %struct._IO_FILE* %call14)
  %add19 = add i64 %14, %13
  %15 = call i64 @fread_unlocked(i8* nonnull %9, i64 4, i64 1, %struct._IO_FILE* %call14)
  %add23 = add i64 %add19, %15
  %16 = call i64 @fread_unlocked(i8* nonnull %10, i64 4, i64 1, %struct._IO_FILE* %call14)
  %add27 = add i64 %add23, %16
  %conv28 = trunc i64 %add27 to i32
  %cmp29 = icmp eq i32 %conv28, 4
  br i1 %cmp29, label %if.end32, label %if.then30

if.else:                                          ; preds = %if.end6
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !9
  %18 = call i64 @fwrite(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.3, i64 0, i64 0), i64 44, i64 1, %struct._IO_FILE* %17) #6
  br label %cleanup85

if.then30:                                        ; preds = %if.then7
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !9
  %20 = call i64 @fwrite(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.7, i64 0, i64 0), i64 52, i64 1, %struct._IO_FILE* %19) #6
  br label %cleanup76

if.end32:                                         ; preds = %if.then7
  %21 = load i32, i32* %img_width, align 4, !tbaa !2
  %22 = load i32, i32* %img_height, align 4, !tbaa !2
  %mul = mul i32 %22, %21
  %conv33 = zext i32 %mul to i64
  %mul34 = shl nuw nsw i64 %conv33, 2
  %call35 = call noalias i8* @malloc(i64 %mul34) #5
  %23 = bitcast i8* %call35 to i32*
  %24 = load i32, i32* %histo_width, align 4, !tbaa !2
  %25 = load i32, i32* %histo_height, align 4, !tbaa !2
  %mul36 = mul i32 %25, %24
  %conv37 = zext i32 %mul36 to i64
  %call38 = call noalias i8* @calloc(i64 %conv37, i64 1) #5
  call void @pb_SwitchToSubTimer(%struct.pb_TimerSet* nonnull %timers, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i64 0, i64 0), i32 1)
  %26 = call i64 @fread_unlocked(i8* %call35, i64 4, i64 %conv33, %struct._IO_FILE* %call14)
  %conv42 = trunc i64 %26 to i32
  %call43 = call i32 @fclose(%struct._IO_FILE* %call14)
  %cmp45 = icmp eq i32 %mul, %conv42
  br i1 %cmp45, label %if.end48, label %if.then46

if.then46:                                        ; preds = %if.end32
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !9
  %28 = call i64 @fwrite(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.8, i64 0, i64 0), i64 36, i64 1, %struct._IO_FILE* %27) #6
  br label %cleanup76

if.end48:                                         ; preds = %if.end32
  call void @pb_SwitchToTimer(%struct.pb_TimerSet* nonnull %timers, i32 6)
  %cmp49131 = icmp sgt i32 %call9, 0
  br i1 %cmp49131, label %for.body.lr.ph, label %for.end69

for.body.lr.ph:                                   ; preds = %if.end48
  %cmp55129 = icmp eq i32 %mul, 0
  br i1 %cmp55129, label %for.body, label %for.body.us

for.body.us:                                      ; preds = %for.body.lr.ph, %for.cond53.for.end_crit_edge.us
  %iter.0132.us = phi i32 [ %inc68.us, %for.cond53.for.end_crit_edge.us ], [ 0, %for.body.lr.ph ]
  call void @llvm.memset.p0i8.i64(i8* align 1 %call38, i8 0, i64 %conv37, i1 false)
  br label %for.body56.us

for.body56.us:                                    ; preds = %if.end65.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %if.end65.us ]
  %arrayidx57.us = getelementptr inbounds i32, i32* %23, i64 %indvars.iv
  %29 = load i32, i32* %arrayidx57.us, align 4, !tbaa !2
  %idxprom58.us = zext i32 %29 to i64
  %arrayidx59.us = getelementptr inbounds i8, i8* %call38, i64 %idxprom58.us
  %30 = load i8, i8* %arrayidx59.us, align 1, !tbaa !10
  %cmp61.us = icmp eq i8 %30, -1
  br i1 %cmp61.us, label %if.end65.us, label %if.then62.us

if.then62.us:                                     ; preds = %for.body56.us
  %inc.us = add i8 %30, 1
  store i8 %inc.us, i8* %arrayidx59.us, align 1, !tbaa !10
  br label %if.end65.us

if.end65.us:                                      ; preds = %if.then62.us, %for.body56.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %conv33
  br i1 %exitcond, label %for.cond53.for.end_crit_edge.us, label %for.body56.us

for.cond53.for.end_crit_edge.us:                  ; preds = %if.end65.us
  %inc68.us = add nuw nsw i32 %iter.0132.us, 1
  %exitcond134 = icmp eq i32 %inc68.us, %call9
  br i1 %exitcond134, label %for.end69, label %for.body.us

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %iter.0132 = phi i32 [ %inc68, %for.body ], [ 0, %for.body.lr.ph ]
  call void @llvm.memset.p0i8.i64(i8* align 1 %call38, i8 0, i64 %conv37, i1 false)
  %inc68 = add nuw nsw i32 %iter.0132, 1
  %exitcond135 = icmp eq i32 %inc68, %call9
  br i1 %exitcond135, label %for.end69, label %for.body

for.end69:                                        ; preds = %for.cond53.for.end_crit_edge.us, %for.body, %if.end48
  call void @pb_SwitchToSubTimer(%struct.pb_TimerSet* nonnull %timers, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), i32 1)
  %outFile = getelementptr inbounds %struct.pb_Parameters, %struct.pb_Parameters* %call2, i64 0, i32 0
  %31 = load i8*, i8** %outFile, align 8, !tbaa !11
  %tobool70 = icmp eq i8* %31, null
  br i1 %tobool70, label %if.end73, label %if.then71

if.then71:                                        ; preds = %for.end69
  call void @_Z14dump_histo_imgPhjjPKc(i8* %call38, i32 %25, i32 %24, i8* nonnull %31)
  br label %if.end73

if.end73:                                         ; preds = %for.end69, %if.then71
  call void @pb_SwitchToTimer(%struct.pb_TimerSet* nonnull %timers, i32 6)
  call void @free(i8* %call35) #5
  call void @free(i8* %call38) #5
  call void @pb_SwitchToTimer(%struct.pb_TimerSet* nonnull %timers, i32 0)
  %putchar = call i32 @putchar(i32 10)
  call void @pb_PrintTimerSet(%struct.pb_TimerSet* nonnull %timers)
  call void @pb_FreeParameters(%struct.pb_Parameters* nonnull %call2)
  br label %cleanup76

cleanup76:                                        ; preds = %if.then46, %if.end73, %if.then30
  %retval.1 = phi i32 [ -1, %if.then30 ], [ -1, %if.then46 ], [ 0, %if.end73 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %10) #5
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %9) #5
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %8) #5
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %7) #5
  br label %cleanup85

cleanup85:                                        ; preds = %if.else, %cleanup76, %entry, %if.then4
  %retval.3 = phi i32 [ -1, %if.then4 ], [ -1, %entry ], [ %retval.1, %cleanup76 ], [ -1, %if.else ]
  call void @llvm.lifetime.end.p0i8(i64 288, i8* nonnull %0) #5
  ret i32 %retval.3
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

declare dso_local %struct.pb_Parameters* @pb_ReadParameters(i32*, i8**) local_unnamed_addr #2

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8* nocapture) local_unnamed_addr #3

declare dso_local void @pb_InitializeTimerSet(%struct.pb_TimerSet*) local_unnamed_addr #2

declare dso_local void @pb_AddSubTimer(%struct.pb_TimerSet*, i8*, i32) local_unnamed_addr #2

declare dso_local void @pb_SwitchToSubTimer(%struct.pb_TimerSet*, i8*, i32) local_unnamed_addr #2

; Function Attrs: nounwind
declare dso_local noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #4

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) local_unnamed_addr #4

; Function Attrs: nounwind
declare dso_local noalias i8* @calloc(i64, i64) local_unnamed_addr #4

; Function Attrs: nounwind
declare dso_local i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #4

declare dso_local void @pb_SwitchToTimer(%struct.pb_TimerSet*, i32) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

declare dso_local void @_Z14dump_histo_imgPhjjPKc(i8*, i32, i32, i8*) local_unnamed_addr #2

; Function Attrs: nounwind
declare dso_local void @free(i8* nocapture) local_unnamed_addr #4

declare dso_local void @pb_PrintTimerSet(%struct.pb_TimerSet*) local_unnamed_addr #2

declare dso_local void @pb_FreeParameters(%struct.pb_Parameters*) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #5

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #5

; Function Attrs: nounwind
declare i64 @fread_unlocked(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @putchar(i32) local_unnamed_addr #5

attributes #0 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { cold }
attributes #7 = { nounwind readonly }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (/home/ts20/share/llvm9/llvm-project/clang 3775794812e582769e2ed1b53c00650a6b21387c)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C++ TBAA"}
!6 = !{!7, !8, i64 8}
!7 = !{!"_ZTS13pb_Parameters", !8, i64 0, !8, i64 8}
!8 = !{!"any pointer", !4, i64 0}
!9 = !{!8, !8, i64 0}
!10 = !{!4, !4, i64 0}
!11 = !{!7, !8, i64 0}

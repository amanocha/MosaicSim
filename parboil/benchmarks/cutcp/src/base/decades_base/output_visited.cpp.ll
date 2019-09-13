; ModuleID = 'decades_base/output_visited.cpp'
source_filename = "decades_base/output_visited.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.Lattice_t = type { %struct.LatticeDim_t, float* }
%struct.LatticeDim_t = type { i32, i32, i32, %struct.Vec3_t, float }
%struct.Vec3_t = type { float, float, float }

@.str = private unnamed_addr constant [2 x i8] c"w\00", align 1
@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [25 x i8] c"Cannot open output file\0A\00", align 1

; Function Attrs: nounwind uwtable
define dso_local void @_Z21write_lattice_summaryPKcP9Lattice_t(i8* nocapture readonly %filename, %struct.Lattice_t* nocapture readonly %lattice) local_unnamed_addr #0 {
entry:
  %tmp = alloca float, align 4
  %tmp12 = alloca i32, align 4
  %lattice1 = getelementptr inbounds %struct.Lattice_t, %struct.Lattice_t* %lattice, i64 0, i32 1
  %0 = load float*, float** %lattice1, align 8, !tbaa !2
  %nx2 = getelementptr inbounds %struct.Lattice_t, %struct.Lattice_t* %lattice, i64 0, i32 0, i32 0
  %1 = load i32, i32* %nx2, align 8, !tbaa !11
  %ny4 = getelementptr inbounds %struct.Lattice_t, %struct.Lattice_t* %lattice, i64 0, i32 0, i32 1
  %2 = load i32, i32* %ny4, align 4, !tbaa !12
  %nz6 = getelementptr inbounds %struct.Lattice_t, %struct.Lattice_t* %lattice, i64 0, i32 0, i32 2
  %3 = load i32, i32* %nz6, align 8, !tbaa !13
  %call = tail call %struct._IO_FILE* @fopen(i8* %filename, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0))
  %cmp = icmp eq %struct._IO_FILE* %call, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.1, i64 0, i64 0), i64 24, i64 1, %struct._IO_FILE* %4) #6
  tail call void @exit(i32 1) #7
  unreachable

if.end:                                           ; preds = %entry
  %6 = bitcast float* %tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %6) #4
  %mul = mul i32 %2, %1
  %mul8 = mul i32 %mul, %3
  %cmp954 = icmp sgt i32 %mul8, 0
  br i1 %cmp954, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %if.end
  %wide.trip.count = zext i32 %mul8 to i64
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %abspotential.056 = phi double [ 0.000000e+00, %for.body.preheader ], [ %add, %for.body ]
  %arrayidx = getelementptr inbounds float, float* %0, i64 %indvars.iv
  %7 = load float, float* %arrayidx, align 4, !tbaa !15
  %8 = tail call float @llvm.fabs.f32(float %7)
  %9 = fpext float %8 to double
  %add = fadd double %abspotential.056, %9
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %for.body
  %phitmp = fptrunc double %add to float
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %if.end
  %abspotential.0.lcssa = phi float [ 0.000000e+00, %if.end ], [ %phitmp, %for.end.loopexit ]
  store float %abspotential.0.lcssa, float* %tmp, align 4, !tbaa !15
  %10 = call i64 @fwrite_unlocked(i8* nonnull %6, i64 1, i64 4, %struct._IO_FILE* nonnull %call)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %6) #4
  %11 = bitcast i32* %tmp12 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %11) #4
  %12 = load i32, i32* %nx2, align 8, !tbaa !11
  %13 = load i32, i32* %ny4, align 4, !tbaa !12
  %mul17 = mul nsw i32 %13, %12
  store i32 %mul17, i32* %tmp12, align 4, !tbaa !16
  %14 = call i64 @fwrite_unlocked(i8* nonnull %11, i64 1, i64 4, %struct._IO_FILE* nonnull %call)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %11) #4
  %15 = bitcast float* %0 to i8*
  %conv20 = sext i32 %mul to i64
  %16 = tail call i64 @fwrite_unlocked(i8* %15, i64 %conv20, i64 4, %struct._IO_FILE* nonnull %call)
  %sub = add nsw i32 %3, -1
  %mul22 = mul nsw i32 %sub, %mul
  %idx.ext = sext i32 %mul22 to i64
  %add.ptr = getelementptr inbounds float, float* %0, i64 %idx.ext
  %17 = bitcast float* %add.ptr to i8*
  %18 = tail call i64 @fwrite_unlocked(i8* %17, i64 %conv20, i64 4, %struct._IO_FILE* nonnull %call)
  %call25 = tail call i32 @fclose(%struct._IO_FILE* nonnull %call)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind
declare dso_local noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind
declare dso_local i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite_unlocked(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind readnone speculatable
declare float @llvm.fabs.f32(float) #5

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readnone speculatable }
attributes #6 = { cold }
attributes #7 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (/home/ts20/share/llvm9/llvm-project/clang 3775794812e582769e2ed1b53c00650a6b21387c)"}
!2 = !{!3, !10, i64 32}
!3 = !{!"_ZTS9Lattice_t", !4, i64 0, !10, i64 32}
!4 = !{!"_ZTS12LatticeDim_t", !5, i64 0, !5, i64 4, !5, i64 8, !8, i64 12, !9, i64 24}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!"_ZTS6Vec3_t", !9, i64 0, !9, i64 4, !9, i64 8}
!9 = !{!"float", !6, i64 0}
!10 = !{!"any pointer", !6, i64 0}
!11 = !{!3, !5, i64 0}
!12 = !{!3, !5, i64 4}
!13 = !{!3, !5, i64 8}
!14 = !{!10, !10, i64 0}
!15 = !{!9, !9, i64 0}
!16 = !{!5, !5, i64 0}

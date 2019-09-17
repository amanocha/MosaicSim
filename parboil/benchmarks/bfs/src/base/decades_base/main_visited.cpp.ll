; ModuleID = 'decades_base/main_visited.cpp'
source_filename = "decades_base/main_visited.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%"class.std::ios_base::Init" = type { i8 }
%union.anon = type { i32 }
%struct.Node = type { i32, i32 }
%struct.Edge = type { i32, i32 }
%"class.std::deque" = type { %"class.std::_Deque_base" }
%"class.std::_Deque_base" = type { %"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl" }
%"struct.std::_Deque_base<int, std::allocator<int> >::_Deque_impl" = type { i32**, i64, %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator" }
%"struct.std::_Deque_iterator" = type { i32*, i32*, i32*, i32** }
%struct.pb_TimerSet = type { i32, %struct.pb_async_time_marker_list*, i64, i64, [8 x %struct.pb_Timer], [8 x %struct.pb_SubTimerList*] }
%struct.pb_async_time_marker_list = type { i8*, i32, i8*, %struct.pb_async_time_marker_list* }
%struct.pb_Timer = type { i32, i64, i64 }
%struct.pb_SubTimerList = type { %struct.pb_SubTimer*, %struct.pb_SubTimer* }
%struct.pb_SubTimer = type { i8*, %struct.pb_Timer, %struct.pb_SubTimer* }
%struct.pb_Parameters = type { i8*, i8** }

$__clang_call_terminate = comdat any

$_ZNSt11_Deque_baseIiSaIiEE17_M_initialize_mapEm = comdat any

@.str = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@0 = private unnamed_addr global %struct.ident_t { i32 0, i32 34, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@1 = private unnamed_addr global %struct.ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@no_of_nodes = dso_local global i32 0, align 4
@edge_list_size = dso_local global i32 0, align 4
@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [30 x i8] c"Expecting one input filename\0A\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@fp = dso_local local_unnamed_addr global %struct._IO_FILE* null, align 8
@.str.4 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"%d %d\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.7 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.8 = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1
@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_main_visited.cpp, i8* null }]
@str = private unnamed_addr constant [25 x i8] c"Error Reading graph file\00", align 1

; Function Attrs: noinline uwtable
define dso_local void @DECADES_BARRIER() local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @__kmpc_global_thread_num(%struct.ident_t* nonnull @1)
  tail call void @__kmpc_barrier(%struct.ident_t* nonnull @0, i32 %0)
  ret void
}

declare dso_local i32 @__kmpc_global_thread_num(%struct.ident_t*) local_unnamed_addr

declare dso_local void @__kmpc_barrier(%struct.ident_t*, i32) local_unnamed_addr

; Function Attrs: noinline norecurse nounwind uwtable
define dso_local i32 @DECADES_COMPARE_EXCHANGE_STRONG(i32* nocapture %addr, i32* nocapture %expected, i32 %desired) local_unnamed_addr #1 {
entry:
  %0 = load i32, i32* %expected, align 4
  %1 = cmpxchg i32* %addr, i32 %0, i32 %desired monotonic monotonic
  %2 = extractvalue { i32, i1 } %1, 1
  br i1 %2, label %cmpxchg.continue, label %cmpxchg.store_expected

cmpxchg.store_expected:                           ; preds = %entry
  %3 = extractvalue { i32, i1 } %1, 0
  store i32 %3, i32* %expected, align 4
  br label %cmpxchg.continue

cmpxchg.continue:                                 ; preds = %cmpxchg.store_expected, %entry
  %conv = zext i1 %2 to i32
  ret i32 %conv
}

; Function Attrs: noinline norecurse nounwind uwtable
define dso_local i32 @DECADES_COMPARE_EXCHANGE_WEAK(i32* nocapture %addr, i32* nocapture %expected, i32 %desired) local_unnamed_addr #1 {
entry:
  %0 = load i32, i32* %expected, align 4
  %1 = cmpxchg weak i32* %addr, i32 %0, i32 %desired monotonic monotonic
  %2 = extractvalue { i32, i1 } %1, 1
  br i1 %2, label %cmpxchg.continue, label %cmpxchg.store_expected

cmpxchg.store_expected:                           ; preds = %entry
  %3 = extractvalue { i32, i1 } %1, 0
  store i32 %3, i32* %expected, align 4
  br label %cmpxchg.continue

cmpxchg.continue:                                 ; preds = %cmpxchg.store_expected, %entry
  %conv = zext i1 %2 to i32
  ret i32 %conv
}

; Function Attrs: noinline norecurse nounwind uwtable
define dso_local i32 @DECADES_COMPARE_AND_SWAP(i32* %addr, i32 %to_compare, i32 %new_val) local_unnamed_addr #1 {
entry:
  %to_compare.addr = alloca i32, align 4
  store i32 %to_compare, i32* %to_compare.addr, align 4, !tbaa !2
  %0 = load volatile i32, i32* %addr, align 4, !tbaa !2
  %call = call i32 @DECADES_COMPARE_EXCHANGE_STRONG(i32* %addr, i32* nonnull %to_compare.addr, i32 %new_val)
  ret i32 %0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: noinline norecurse nounwind uwtable
define dso_local i32 @DECADES_FETCH_ADD(i32* nocapture %addr, i32 %to_add) local_unnamed_addr #1 {
entry:
  %0 = atomicrmw add i32* %addr, i32 %to_add monotonic
  ret i32 %0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @DECADES_FETCH_MIN(i32* %addr, i32 %to_min) local_unnamed_addr #3 {
entry:
  %value = alloca i32, align 4
  %0 = bitcast i32* %value to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %0) #11
  %1 = load volatile i32, i32* %addr, align 4, !tbaa !2
  store i32 %1, i32* %value, align 4, !tbaa !2
  %cmp5 = icmp sgt i32 %1, %to_min
  br i1 %cmp5, label %while.body, label %cleanup

while.body:                                       ; preds = %entry, %while.body.while.cond_crit_edge
  %call = call i32 @DECADES_COMPARE_EXCHANGE_WEAK(i32* %addr, i32* nonnull %value, i32 %to_min)
  %tobool = icmp eq i32 %call, 0
  br i1 %tobool, label %while.body.while.cond_crit_edge, label %cleanup

while.body.while.cond_crit_edge:                  ; preds = %while.body
  %.pre = load i32, i32* %value, align 4, !tbaa !2
  %cmp = icmp sgt i32 %.pre, %to_min
  br i1 %cmp, label %while.body, label %cleanup

cleanup:                                          ; preds = %while.body, %while.body.while.cond_crit_edge, %entry
  %retval.0 = phi i32 [ 0, %entry ], [ 1, %while.body ], [ 0, %while.body.while.cond_crit_edge ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %0) #11
  ret i32 %retval.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local float @DECADES_FETCH_ADD_FLOAT(float* %addr, float %to_add) local_unnamed_addr #3 {
entry:
  %value = alloca %union.anon, align 4
  %0 = bitcast %union.anon* %value to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %0) #11
  %float_val = bitcast %union.anon* %value to float*
  %1 = bitcast float* %addr to i32*
  %int_val = getelementptr inbounds %union.anon, %union.anon* %value, i64 0, i32 0
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %2 = load volatile float, float* %addr, align 4, !tbaa !6
  store float %2, float* %float_val, align 4, !tbaa !8
  %add = fadd float %2, %to_add
  %3 = bitcast float %add to i32
  %call = call i32 @DECADES_COMPARE_EXCHANGE_WEAK(i32* %1, i32* nonnull %int_val, i32 %3)
  %tobool = icmp eq i32 %call, 0
  br i1 %tobool, label %do.body, label %do.end

do.end:                                           ; preds = %do.body
  %4 = load float, float* %float_val, align 4, !tbaa !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %0) #11
  ret float %4
}

; Function Attrs: noinline uwtable
define dso_local void @_Z15_kernel_computeP4NodeP4EdgePiS3_iii(%struct.Node* nocapture readonly %h_graph_nodes, %struct.Edge* nocapture readonly %h_graph_edges, i32* nocapture %color, i32* nocapture %h_cost, i32 %source, i32 %tid, i32 %num_threads) local_unnamed_addr #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %wavefront = alloca %"class.std::deque", align 8
  %0 = bitcast %"class.std::deque"* %wavefront to i8*
  call void @llvm.lifetime.start.p0i8(i64 80, i8* nonnull %0) #11
  %1 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 %0, i8 0, i64 80, i1 false) #11
  call void @_ZNSt11_Deque_baseIiSaIiEE17_M_initialize_mapEm(%"class.std::_Deque_base"* nonnull %1, i64 0)
  %_M_cur.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3, i32 0
  %2 = load i32*, i32** %_M_cur.i, align 8, !tbaa !9
  %_M_last.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3, i32 2
  %3 = load i32*, i32** %_M_last.i, align 8, !tbaa !15
  %add.ptr.i = getelementptr inbounds i32, i32* %3, i64 -1
  %cmp.i = icmp eq i32* %2, %add.ptr.i
  br i1 %cmp.i, label %if.else.i, label %if.then.i

if.then.i:                                        ; preds = %entry
  store i32 %source, i32* %2, align 4, !tbaa !2
  %incdec.ptr.i = getelementptr inbounds i32, i32* %2, i64 1
  store i32* %incdec.ptr.i, i32** %_M_cur.i, align 8, !tbaa !9
  br label %invoke.cont

if.else.i:                                        ; preds = %entry
  %_M_map_size.i.i.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 1
  %4 = load i64, i64* %_M_map_size.i.i.i, align 8, !tbaa !16
  %_M_node.i.i.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3, i32 3
  %5 = bitcast i32*** %_M_node.i.i.i to i64*
  %6 = load i64, i64* %5, align 8, !tbaa !17
  %7 = bitcast %"class.std::deque"* %wavefront to i64*
  %8 = load i64, i64* %7, align 8, !tbaa !18
  %sub.ptr.sub.i.i.i = sub i64 %6, %8
  %sub.ptr.div.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i, 3
  %sub.i.i.i = sub i64 %4, %sub.ptr.div.i.i.i
  %cmp.i.i.i = icmp ult i64 %sub.i.i.i, 2
  %9 = inttoptr i64 %6 to i32**
  %10 = inttoptr i64 %8 to i32**
  br i1 %cmp.i.i.i, label %if.then.i.i.i, label %_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_.exit.i

if.then.i.i.i:                                    ; preds = %if.else.i
  %_M_node3.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 2, i32 3
  %11 = load i32**, i32*** %_M_node3.i, align 8, !tbaa !19
  %sub.ptr.rhs.cast.i = ptrtoint i32** %11 to i64
  %sub.ptr.sub.i = sub i64 %6, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, 3
  %add.i = add nsw i64 %sub.ptr.div.i, 1
  %add4.i = add nsw i64 %sub.ptr.div.i, 2
  %mul.i = shl nsw i64 %add4.i, 1
  %cmp.i45 = icmp ugt i64 %4, %mul.i
  br i1 %cmp.i45, label %if.then.i47, label %if.else31.i

if.then.i47:                                      ; preds = %if.then.i.i.i
  %sub.i = sub i64 %4, %add4.i
  %div.i = lshr i64 %sub.i, 1
  %add.ptr.i46 = getelementptr inbounds i32*, i32** %10, i64 %div.i
  %cmp13.i = icmp ult i32** %add.ptr.i46, %11
  %add.ptr21.i = getelementptr inbounds i32*, i32** %9, i64 1
  %sub.ptr.lhs.cast.i.i.i.i.i = ptrtoint i32** %add.ptr21.i to i64
  %sub.ptr.sub.i.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i.i, %sub.ptr.rhs.cast.i
  %tobool.i.i.i.i.i = icmp eq i64 %sub.ptr.sub.i.i.i.i.i, 0
  br i1 %cmp13.i, label %if.then14.i, label %if.else.i48

if.then14.i:                                      ; preds = %if.then.i47
  br i1 %tobool.i.i.i.i.i, label %.noexc, label %if.then.i.i.i.i.i

if.then.i.i.i.i.i:                                ; preds = %if.then14.i
  %12 = bitcast i32** %add.ptr.i46 to i8*
  %13 = bitcast i32** %11 to i8*
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %12, i8* align 8 %13, i64 %sub.ptr.sub.i.i.i.i.i, i1 false) #11
  br label %.noexc

if.else.i48:                                      ; preds = %if.then.i47
  br i1 %tobool.i.i.i.i.i, label %.noexc, label %if.then.i.i.i.i101.i

if.then.i.i.i.i101.i:                             ; preds = %if.else.i48
  %add.ptr29.i = getelementptr inbounds i32*, i32** %add.ptr.i46, i64 %add.i
  %sub.ptr.div.i.i.i.i99.i = ashr exact i64 %sub.ptr.sub.i.i.i.i.i, 3
  %idx.neg.i.i.i.i.i = sub nsw i64 0, %sub.ptr.div.i.i.i.i99.i
  %add.ptr.i.i.i.i100.i = getelementptr inbounds i32*, i32** %add.ptr29.i, i64 %idx.neg.i.i.i.i.i
  %14 = bitcast i32** %add.ptr.i.i.i.i100.i to i8*
  %15 = bitcast i32** %11 to i8*
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %14, i8* align 8 %15, i64 %sub.ptr.sub.i.i.i.i.i, i1 false) #11
  br label %.noexc

if.else31.i:                                      ; preds = %if.then.i.i.i
  %cmp.i.i = icmp eq i64 %4, 0
  %.sroa.speculated.i = select i1 %cmp.i.i, i64 1, i64 %4
  %add37.i = add i64 %4, 2
  %add38.i = add i64 %add37.i, %.sroa.speculated.i
  %cmp.i.i.i.i = icmp ugt i64 %add38.i, 2305843009213693951
  br i1 %cmp.i.i.i.i, label %if.then.i.i.i.i, label %_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm.exit.i

if.then.i.i.i.i:                                  ; preds = %if.else31.i
  invoke void @_ZSt17__throw_bad_allocv() #15
          to label %.noexc50 unwind label %lpad

.noexc50:                                         ; preds = %if.then.i.i.i.i
  unreachable

_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm.exit.i: ; preds = %if.else31.i
  %mul.i.i.i.i = shl i64 %add38.i, 3
  %call2.i.i3.i.i51 = invoke i8* @_Znwm(i64 %mul.i.i.i.i)
          to label %call2.i.i3.i.i.noexc unwind label %lpad

call2.i.i3.i.i.noexc:                             ; preds = %_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm.exit.i
  %16 = bitcast i8* %call2.i.i3.i.i51 to i32**
  %sub40.i = sub i64 %add38.i, %add4.i
  %div41.i = lshr i64 %sub40.i, 1
  %add.ptr42.i = getelementptr inbounds i32*, i32** %16, i64 %div41.i
  %17 = load i32**, i32*** %_M_node3.i, align 8, !tbaa !19
  %18 = load i32**, i32*** %_M_node.i.i.i, align 8, !tbaa !17
  %add.ptr55.i = getelementptr inbounds i32*, i32** %18, i64 1
  %sub.ptr.lhs.cast.i.i.i.i102.i = ptrtoint i32** %add.ptr55.i to i64
  %sub.ptr.rhs.cast.i.i.i.i103.i = ptrtoint i32** %17 to i64
  %sub.ptr.sub.i.i.i.i104.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i102.i, %sub.ptr.rhs.cast.i.i.i.i103.i
  %tobool.i.i.i.i106.i = icmp eq i64 %sub.ptr.sub.i.i.i.i104.i, 0
  br i1 %tobool.i.i.i.i106.i, label %_ZSt4copyIPPiS1_ET0_T_S3_S2_.exit109.i, label %if.then.i.i.i.i107.i

if.then.i.i.i.i107.i:                             ; preds = %call2.i.i3.i.i.noexc
  %19 = bitcast i32** %add.ptr42.i to i8*
  %20 = bitcast i32** %17 to i8*
  call void @llvm.memmove.p0i8.p0i8.i64(i8* nonnull align 8 %19, i8* align 8 %20, i64 %sub.ptr.sub.i.i.i.i104.i, i1 false) #11
  br label %_ZSt4copyIPPiS1_ET0_T_S3_S2_.exit109.i

_ZSt4copyIPPiS1_ET0_T_S3_S2_.exit109.i:           ; preds = %if.then.i.i.i.i107.i, %call2.i.i3.i.i.noexc
  %21 = bitcast %"class.std::deque"* %wavefront to i8**
  %22 = load i8*, i8** %21, align 8, !tbaa !18
  call void @_ZdlPv(i8* %22) #11
  store i8* %call2.i.i3.i.i51, i8** %21, align 8, !tbaa !18
  store i64 %add38.i, i64* %_M_map_size.i.i.i, align 8, !tbaa !16
  br label %.noexc

.noexc:                                           ; preds = %_ZSt4copyIPPiS1_ET0_T_S3_S2_.exit109.i, %if.then.i.i.i.i101.i, %if.else.i48, %if.then.i.i.i.i.i, %if.then14.i
  %__new_nstart.0.i = phi i32** [ %add.ptr42.i, %_ZSt4copyIPPiS1_ET0_T_S3_S2_.exit109.i ], [ %add.ptr.i46, %if.then14.i ], [ %add.ptr.i46, %if.then.i.i.i.i.i ], [ %add.ptr.i46, %if.else.i48 ], [ %add.ptr.i46, %if.then.i.i.i.i101.i ]
  store i32** %__new_nstart.0.i, i32*** %_M_node3.i, align 8, !tbaa !20
  %23 = load i32*, i32** %__new_nstart.0.i, align 8, !tbaa !21
  %_M_first.i92.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 2, i32 1
  store i32* %23, i32** %_M_first.i92.i, align 8, !tbaa !22
  %add.ptr.i93.i = getelementptr inbounds i32, i32* %23, i64 128
  %_M_last.i94.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 2, i32 2
  store i32* %add.ptr.i93.i, i32** %_M_last.i94.i, align 8, !tbaa !23
  %add.ptr71.i = getelementptr inbounds i32*, i32** %__new_nstart.0.i, i64 %sub.ptr.div.i
  store i32** %add.ptr71.i, i32*** %_M_node.i.i.i, align 8, !tbaa !20
  %24 = load i32*, i32** %add.ptr71.i, align 8, !tbaa !21
  %_M_first.i.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3, i32 1
  store i32* %24, i32** %_M_first.i.i, align 8, !tbaa !22
  %add.ptr.i.i49 = getelementptr inbounds i32, i32* %24, i64 128
  store i32* %add.ptr.i.i49, i32** %_M_last.i, align 8, !tbaa !23
  br label %_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_.exit.i

_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_.exit.i: ; preds = %.noexc, %if.else.i
  %call2.i.i.i.i.i44 = invoke i8* @_Znwm(i64 512)
          to label %call2.i.i.i.i.i.noexc unwind label %lpad

call2.i.i.i.i.i.noexc:                            ; preds = %_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_.exit.i
  %_M_finish.i.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3
  %25 = load i32**, i32*** %_M_node.i.i.i, align 8, !tbaa !17
  %add.ptr.i.i = getelementptr inbounds i32*, i32** %25, i64 1
  %26 = bitcast i32** %add.ptr.i.i to i8**
  store i8* %call2.i.i.i.i.i44, i8** %26, align 8, !tbaa !21
  %_M_cur.i.i = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish.i.i, i64 0, i32 0
  %27 = load i32*, i32** %_M_cur.i.i, align 8, !tbaa !9
  store i32 %source, i32* %27, align 4, !tbaa !2
  %28 = load i32**, i32*** %_M_node.i.i.i, align 8, !tbaa !17
  %add.ptr11.i.i = getelementptr inbounds i32*, i32** %28, i64 1
  store i32** %add.ptr11.i.i, i32*** %_M_node.i.i.i, align 8, !tbaa !20
  %29 = load i32*, i32** %add.ptr11.i.i, align 8, !tbaa !21
  %_M_first.i.i.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3, i32 1
  store i32* %29, i32** %_M_first.i.i.i, align 8, !tbaa !22
  %add.ptr.i.i.i = getelementptr inbounds i32, i32* %29, i64 128
  store i32* %add.ptr.i.i.i, i32** %_M_last.i, align 8, !tbaa !23
  %.cast.i.i = ptrtoint i32* %29 to i64
  %30 = bitcast %"struct.std::_Deque_iterator"* %_M_finish.i.i to i64*
  store i64 %.cast.i.i, i64* %30, align 8, !tbaa !9
  br label %invoke.cont

invoke.cont:                                      ; preds = %call2.i.i.i.i.i.noexc, %if.then.i
  %31 = phi i32* [ %29, %call2.i.i.i.i.i.noexc ], [ %incdec.ptr.i, %if.then.i ]
  %idxprom = sext i32 %source to i64
  %arrayidx = getelementptr inbounds i32, i32* %color, i64 %idxprom
  store i32 16677218, i32* %arrayidx, align 4, !tbaa !2
  %_M_cur1.i.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 2, i32 0
  %32 = load i32*, i32** %_M_cur1.i.i, align 8, !tbaa !24
  %cmp.i.i53178 = icmp eq i32* %31, %32
  br i1 %cmp.i.i53178, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %invoke.cont
  %_M_last.i55 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 2, i32 2
  %_M_start.i.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 2
  %_M_first.i.i59 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 2, i32 1
  %33 = bitcast i32** %_M_first.i.i59 to i8**
  %_M_node.i.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 2, i32 3
  %34 = bitcast %"struct.std::_Deque_iterator"* %_M_start.i.i to i64*
  %_M_map_size.i.i.i70 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 1
  %_M_node.i.i.i71 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3, i32 3
  %35 = bitcast i32*** %_M_node.i.i.i71 to i64*
  %36 = bitcast %"class.std::deque"* %wavefront to i64*
  %37 = bitcast %"class.std::deque"* %wavefront to i8**
  %_M_first.i.i143 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3, i32 1
  %_M_finish.i.i78 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3
  %_M_cur.i.i80 = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish.i.i78, i64 0, i32 0
  %38 = bitcast %"struct.std::_Deque_iterator"* %_M_finish.i.i78 to i64*
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %for.cond.cleanup
  %39 = phi i32* [ %32, %while.body.lr.ph ], [ %49, %for.cond.cleanup ]
  %40 = load i32, i32* %39, align 4, !tbaa !2
  %41 = load i32*, i32** %_M_last.i55, align 8, !tbaa !25
  %add.ptr.i56 = getelementptr inbounds i32, i32* %41, i64 -1
  %cmp.i57 = icmp eq i32* %39, %add.ptr.i56
  br i1 %cmp.i57, label %if.else.i63, label %invoke.cont.i

invoke.cont.i:                                    ; preds = %while.body
  %incdec.ptr.i58 = getelementptr inbounds i32, i32* %39, i64 1
  store i32* %incdec.ptr.i58, i32** %_M_cur1.i.i, align 8, !tbaa !26
  br label %_ZNSt5dequeIiSaIiEE9pop_frontEv.exit

if.else.i63:                                      ; preds = %while.body
  %42 = load i8*, i8** %33, align 8, !tbaa !27
  call void @_ZdlPv(i8* %42) #11
  %43 = load i32**, i32*** %_M_node.i.i, align 8, !tbaa !19
  %add.ptr.i.i60 = getelementptr inbounds i32*, i32** %43, i64 1
  store i32** %add.ptr.i.i60, i32*** %_M_node.i.i, align 8, !tbaa !20
  %44 = load i32*, i32** %add.ptr.i.i60, align 8, !tbaa !21
  store i32* %44, i32** %_M_first.i.i59, align 8, !tbaa !22
  %add.ptr.i.i.i61 = getelementptr inbounds i32, i32* %44, i64 128
  store i32* %add.ptr.i.i.i61, i32** %_M_last.i55, align 8, !tbaa !23
  %.cast.i.i62 = ptrtoint i32* %44 to i64
  store i64 %.cast.i.i62, i64* %34, align 8, !tbaa !26
  br label %_ZNSt5dequeIiSaIiEE9pop_frontEv.exit

_ZNSt5dequeIiSaIiEE9pop_frontEv.exit:             ; preds = %invoke.cont.i, %if.else.i63
  %45 = phi i32* [ %incdec.ptr.i58, %invoke.cont.i ], [ %44, %if.else.i63 ]
  %idxprom2 = sext i32 %40 to i64
  %x = getelementptr inbounds %struct.Node, %struct.Node* %h_graph_nodes, i64 %idxprom2, i32 0
  %y = getelementptr inbounds %struct.Node, %struct.Node* %h_graph_nodes, i64 %idxprom2, i32 1
  %46 = load i32, i32* %y, align 4, !tbaa !28
  %cmp176 = icmp sgt i32 %46, 0
  br i1 %cmp176, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %_ZNSt5dequeIiSaIiEE9pop_frontEv.exit
  %47 = load i32, i32* %x, align 4, !tbaa !30
  %arrayidx16 = getelementptr inbounds i32, i32* %h_cost, i64 %idxprom2
  %48 = sext i32 %47 to i64
  br label %for.body

for.cond.cleanup.loopexit:                        ; preds = %if.end
  %.pre180 = load i32*, i32** %_M_cur1.i.i, align 8, !tbaa !24
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %_ZNSt5dequeIiSaIiEE9pop_frontEv.exit
  %49 = phi i32* [ %.pre180, %for.cond.cleanup.loopexit ], [ %45, %_ZNSt5dequeIiSaIiEE9pop_frontEv.exit ]
  %arrayidx25 = getelementptr inbounds i32, i32* %color, i64 %idxprom2
  store i32 16677221, i32* %arrayidx25, align 4, !tbaa !2
  %50 = load i32*, i32** %_M_cur.i, align 8, !tbaa !24
  %cmp.i.i53 = icmp eq i32* %50, %49
  br i1 %cmp.i.i53, label %while.end, label %while.body

lpad:                                             ; preds = %_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm.exit.i, %if.then.i.i.i.i, %_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_.exit.i
  %51 = landingpad { i8*, i32 }
          cleanup
  br label %ehcleanup

for.body:                                         ; preds = %for.body.lr.ph, %if.end
  %52 = phi i32 [ %47, %for.body.lr.ph ], [ %82, %if.end ]
  %53 = phi i32 [ %46, %for.body.lr.ph ], [ %83, %if.end ]
  %indvars.iv = phi i64 [ %48, %for.body.lr.ph ], [ %indvars.iv.next, %if.end ]
  %x11 = getelementptr inbounds %struct.Edge, %struct.Edge* %h_graph_edges, i64 %indvars.iv, i32 0
  %54 = load i32, i32* %x11, align 4, !tbaa !31
  %idxprom12 = sext i32 %54 to i64
  %arrayidx13 = getelementptr inbounds i32, i32* %color, i64 %idxprom12
  %55 = load i32, i32* %arrayidx13, align 4, !tbaa !2
  %cmp14 = icmp eq i32 %55, 16677217
  br i1 %cmp14, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %56 = load i32, i32* %arrayidx16, align 4, !tbaa !2
  %add17 = add nsw i32 %56, 1
  %arrayidx19 = getelementptr inbounds i32, i32* %h_cost, i64 %idxprom12
  store i32 %add17, i32* %arrayidx19, align 4, !tbaa !2
  %57 = load i32*, i32** %_M_cur.i, align 8, !tbaa !9
  %58 = load i32*, i32** %_M_last.i, align 8, !tbaa !15
  %add.ptr.i66 = getelementptr inbounds i32, i32* %58, i64 -1
  %cmp.i67 = icmp eq i32* %57, %add.ptr.i66
  br i1 %cmp.i67, label %if.else.i76, label %if.then.i69

if.then.i69:                                      ; preds = %if.then
  store i32 %54, i32* %57, align 4, !tbaa !2
  %incdec.ptr.i68 = getelementptr inbounds i32, i32* %57, i64 1
  store i32* %incdec.ptr.i68, i32** %_M_cur.i, align 8, !tbaa !9
  br label %invoke.cont21

if.else.i76:                                      ; preds = %if.then
  %59 = load i64, i64* %_M_map_size.i.i.i70, align 8, !tbaa !16
  %60 = load i64, i64* %35, align 8, !tbaa !17
  %61 = load i64, i64* %36, align 8, !tbaa !18
  %sub.ptr.sub.i.i.i72 = sub i64 %60, %61
  %sub.ptr.div.i.i.i73 = ashr exact i64 %sub.ptr.sub.i.i.i72, 3
  %sub.i.i.i74 = sub i64 %59, %sub.ptr.div.i.i.i73
  %cmp.i.i.i75 = icmp ult i64 %sub.i.i.i74, 2
  %62 = inttoptr i64 %60 to i32**
  %63 = inttoptr i64 %61 to i32**
  br i1 %cmp.i.i.i75, label %if.then.i.i.i77, label %_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_.exit.i85

if.then.i.i.i77:                                  ; preds = %if.else.i76
  %64 = load i32**, i32*** %_M_node.i.i, align 8, !tbaa !19
  %sub.ptr.rhs.cast.i93 = ptrtoint i32** %64 to i64
  %sub.ptr.sub.i94 = sub i64 %60, %sub.ptr.rhs.cast.i93
  %sub.ptr.div.i95 = ashr exact i64 %sub.ptr.sub.i94, 3
  %add.i96 = add nsw i64 %sub.ptr.div.i95, 1
  %add4.i97 = add nsw i64 %sub.ptr.div.i95, 2
  %mul.i99 = shl nsw i64 %add4.i97, 1
  %cmp.i100 = icmp ugt i64 %59, %mul.i99
  br i1 %cmp.i100, label %if.then.i110, label %if.else31.i124

if.then.i110:                                     ; preds = %if.then.i.i.i77
  %sub.i102 = sub i64 %59, %add4.i97
  %div.i103 = lshr i64 %sub.i102, 1
  %add.ptr.i104 = getelementptr inbounds i32*, i32** %63, i64 %div.i103
  %cmp13.i105 = icmp ult i32** %add.ptr.i104, %64
  %add.ptr21.i106 = getelementptr inbounds i32*, i32** %62, i64 1
  %sub.ptr.lhs.cast.i.i.i.i.i107 = ptrtoint i32** %add.ptr21.i106 to i64
  %sub.ptr.sub.i.i.i.i.i108 = sub i64 %sub.ptr.lhs.cast.i.i.i.i.i107, %sub.ptr.rhs.cast.i93
  %tobool.i.i.i.i.i109 = icmp eq i64 %sub.ptr.sub.i.i.i.i.i108, 0
  br i1 %cmp13.i105, label %if.then14.i111, label %if.else.i113

if.then14.i111:                                   ; preds = %if.then.i110
  br i1 %tobool.i.i.i.i.i109, label %.noexc86, label %if.then.i.i.i.i.i112

if.then.i.i.i.i.i112:                             ; preds = %if.then14.i111
  %65 = bitcast i32** %add.ptr.i104 to i8*
  %66 = bitcast i32** %64 to i8*
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %65, i8* align 8 %66, i64 %sub.ptr.sub.i.i.i.i.i108, i1 false) #11
  br label %.noexc86

if.else.i113:                                     ; preds = %if.then.i110
  br i1 %tobool.i.i.i.i.i109, label %.noexc86, label %if.then.i.i.i.i101.i118

if.then.i.i.i.i101.i118:                          ; preds = %if.else.i113
  %add.ptr29.i114 = getelementptr inbounds i32*, i32** %add.ptr.i104, i64 %add.i96
  %sub.ptr.div.i.i.i.i99.i115 = ashr exact i64 %sub.ptr.sub.i.i.i.i.i108, 3
  %idx.neg.i.i.i.i.i116 = sub nsw i64 0, %sub.ptr.div.i.i.i.i99.i115
  %add.ptr.i.i.i.i100.i117 = getelementptr inbounds i32*, i32** %add.ptr29.i114, i64 %idx.neg.i.i.i.i.i116
  %67 = bitcast i32** %add.ptr.i.i.i.i100.i117 to i8*
  %68 = bitcast i32** %64 to i8*
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %67, i8* align 8 %68, i64 %sub.ptr.sub.i.i.i.i.i108, i1 false) #11
  br label %.noexc86

if.else31.i124:                                   ; preds = %if.then.i.i.i77
  %cmp.i.i119 = icmp eq i64 %59, 0
  %.sroa.speculated.i120 = select i1 %cmp.i.i119, i64 1, i64 %59
  %add37.i121 = add i64 %59, 2
  %add38.i122 = add i64 %add37.i121, %.sroa.speculated.i120
  %cmp.i.i.i.i123 = icmp ugt i64 %add38.i122, 2305843009213693951
  br i1 %cmp.i.i.i.i123, label %if.then.i.i.i.i125, label %_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm.exit.i135

if.then.i.i.i.i125:                               ; preds = %if.else31.i124
  invoke void @_ZSt17__throw_bad_allocv() #15
          to label %.noexc146 unwind label %lpad20.loopexit.split-lp

.noexc146:                                        ; preds = %if.then.i.i.i.i125
  unreachable

_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm.exit.i135: ; preds = %if.else31.i124
  %mul.i.i.i.i126 = shl i64 %add38.i122, 3
  %call2.i.i3.i.i148 = invoke i8* @_Znwm(i64 %mul.i.i.i.i126)
          to label %call2.i.i3.i.i.noexc147 unwind label %lpad20.loopexit

call2.i.i3.i.i.noexc147:                          ; preds = %_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm.exit.i135
  %69 = bitcast i8* %call2.i.i3.i.i148 to i32**
  %sub40.i127 = sub i64 %add38.i122, %add4.i97
  %div41.i128 = lshr i64 %sub40.i127, 1
  %add.ptr42.i129 = getelementptr inbounds i32*, i32** %69, i64 %div41.i128
  %70 = load i32**, i32*** %_M_node.i.i, align 8, !tbaa !19
  %71 = load i32**, i32*** %_M_node.i.i.i71, align 8, !tbaa !17
  %add.ptr55.i130 = getelementptr inbounds i32*, i32** %71, i64 1
  %sub.ptr.lhs.cast.i.i.i.i102.i131 = ptrtoint i32** %add.ptr55.i130 to i64
  %sub.ptr.rhs.cast.i.i.i.i103.i132 = ptrtoint i32** %70 to i64
  %sub.ptr.sub.i.i.i.i104.i133 = sub i64 %sub.ptr.lhs.cast.i.i.i.i102.i131, %sub.ptr.rhs.cast.i.i.i.i103.i132
  %tobool.i.i.i.i106.i134 = icmp eq i64 %sub.ptr.sub.i.i.i.i104.i133, 0
  br i1 %tobool.i.i.i.i106.i134, label %_ZSt4copyIPPiS1_ET0_T_S3_S2_.exit109.i137, label %if.then.i.i.i.i107.i136

if.then.i.i.i.i107.i136:                          ; preds = %call2.i.i3.i.i.noexc147
  %72 = bitcast i32** %add.ptr42.i129 to i8*
  %73 = bitcast i32** %70 to i8*
  call void @llvm.memmove.p0i8.p0i8.i64(i8* nonnull align 8 %72, i8* align 8 %73, i64 %sub.ptr.sub.i.i.i.i104.i133, i1 false) #11
  br label %_ZSt4copyIPPiS1_ET0_T_S3_S2_.exit109.i137

_ZSt4copyIPPiS1_ET0_T_S3_S2_.exit109.i137:        ; preds = %if.then.i.i.i.i107.i136, %call2.i.i3.i.i.noexc147
  %74 = load i8*, i8** %37, align 8, !tbaa !18
  call void @_ZdlPv(i8* %74) #11
  store i8* %call2.i.i3.i.i148, i8** %37, align 8, !tbaa !18
  store i64 %add38.i122, i64* %_M_map_size.i.i.i70, align 8, !tbaa !16
  br label %.noexc86

.noexc86:                                         ; preds = %_ZSt4copyIPPiS1_ET0_T_S3_S2_.exit109.i137, %if.then.i.i.i.i101.i118, %if.else.i113, %if.then.i.i.i.i.i112, %if.then14.i111
  %__new_nstart.0.i138 = phi i32** [ %add.ptr42.i129, %_ZSt4copyIPPiS1_ET0_T_S3_S2_.exit109.i137 ], [ %add.ptr.i104, %if.then14.i111 ], [ %add.ptr.i104, %if.then.i.i.i.i.i112 ], [ %add.ptr.i104, %if.else.i113 ], [ %add.ptr.i104, %if.then.i.i.i.i101.i118 ]
  store i32** %__new_nstart.0.i138, i32*** %_M_node.i.i, align 8, !tbaa !20
  %75 = load i32*, i32** %__new_nstart.0.i138, align 8, !tbaa !21
  store i32* %75, i32** %_M_first.i.i59, align 8, !tbaa !22
  %add.ptr.i93.i140 = getelementptr inbounds i32, i32* %75, i64 128
  store i32* %add.ptr.i93.i140, i32** %_M_last.i55, align 8, !tbaa !23
  %add.ptr71.i142 = getelementptr inbounds i32*, i32** %__new_nstart.0.i138, i64 %sub.ptr.div.i95
  store i32** %add.ptr71.i142, i32*** %_M_node.i.i.i71, align 8, !tbaa !20
  %76 = load i32*, i32** %add.ptr71.i142, align 8, !tbaa !21
  store i32* %76, i32** %_M_first.i.i143, align 8, !tbaa !22
  %add.ptr.i.i144 = getelementptr inbounds i32, i32* %76, i64 128
  store i32* %add.ptr.i.i144, i32** %_M_last.i, align 8, !tbaa !23
  br label %_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_.exit.i85

_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_.exit.i85: ; preds = %.noexc86, %if.else.i76
  %call2.i.i.i.i.i88 = invoke i8* @_Znwm(i64 512)
          to label %call2.i.i.i.i.i.noexc87 unwind label %lpad20.loopexit

call2.i.i.i.i.i.noexc87:                          ; preds = %_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_.exit.i85
  %77 = load i32**, i32*** %_M_node.i.i.i71, align 8, !tbaa !17
  %add.ptr.i.i79 = getelementptr inbounds i32*, i32** %77, i64 1
  %78 = bitcast i32** %add.ptr.i.i79 to i8**
  store i8* %call2.i.i.i.i.i88, i8** %78, align 8, !tbaa !21
  %79 = load i32*, i32** %_M_cur.i.i80, align 8, !tbaa !9
  store i32 %54, i32* %79, align 4, !tbaa !2
  %80 = load i32**, i32*** %_M_node.i.i.i71, align 8, !tbaa !17
  %add.ptr11.i.i81 = getelementptr inbounds i32*, i32** %80, i64 1
  store i32** %add.ptr11.i.i81, i32*** %_M_node.i.i.i71, align 8, !tbaa !20
  %81 = load i32*, i32** %add.ptr11.i.i81, align 8, !tbaa !21
  store i32* %81, i32** %_M_first.i.i143, align 8, !tbaa !22
  %add.ptr.i.i.i83 = getelementptr inbounds i32, i32* %81, i64 128
  store i32* %add.ptr.i.i.i83, i32** %_M_last.i, align 8, !tbaa !23
  %.cast.i.i84 = ptrtoint i32* %81 to i64
  store i64 %.cast.i.i84, i64* %38, align 8, !tbaa !9
  br label %invoke.cont21

invoke.cont21:                                    ; preds = %call2.i.i.i.i.i.noexc87, %if.then.i69
  store i32 16677218, i32* %arrayidx13, align 4, !tbaa !2
  %.pre = load i32, i32* %y, align 4, !tbaa !28
  %.pre179 = load i32, i32* %x, align 4, !tbaa !30
  br label %if.end

lpad20.loopexit:                                  ; preds = %_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_.exit.i85, %_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm.exit.i135
  %lpad.loopexit = landingpad { i8*, i32 }
          cleanup
  br label %ehcleanup

lpad20.loopexit.split-lp:                         ; preds = %if.then.i.i.i.i125
  %lpad.loopexit.split-lp = landingpad { i8*, i32 }
          cleanup
  br label %ehcleanup

if.end:                                           ; preds = %invoke.cont21, %for.body
  %82 = phi i32 [ %.pre179, %invoke.cont21 ], [ %52, %for.body ]
  %83 = phi i32 [ %.pre, %invoke.cont21 ], [ %53, %for.body ]
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %add = add nsw i32 %82, %83
  %84 = sext i32 %add to i64
  %cmp = icmp slt i64 %indvars.iv.next, %84
  br i1 %cmp, label %for.body, label %for.cond.cleanup.loopexit

while.end:                                        ; preds = %for.cond.cleanup, %invoke.cont
  %_M_map.i.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 0
  %85 = load i32**, i32*** %_M_map.i.i, align 8, !tbaa !18
  %tobool.i.i = icmp eq i32** %85, null
  br i1 %tobool.i.i, label %_ZNSt5dequeIiSaIiEED2Ev.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %while.end
  %86 = bitcast i32** %85 to i8*
  %_M_node.i.i150 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 2, i32 3
  %87 = load i32**, i32*** %_M_node.i.i150, align 8, !tbaa !19
  %_M_node4.i.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3, i32 3
  %88 = load i32**, i32*** %_M_node4.i.i, align 8, !tbaa !17
  %add.ptr.i.i151 = getelementptr inbounds i32*, i32** %88, i64 1
  %cmp5.i.i.i = icmp ult i32** %87, %add.ptr.i.i151
  br i1 %cmp5.i.i.i, label %for.body.i.i.i, label %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.i.i

for.body.i.i.i:                                   ; preds = %if.then.i.i, %for.body.i.i.i
  %__n.06.i.i.i = phi i32** [ %incdec.ptr.i.i.i, %for.body.i.i.i ], [ %87, %if.then.i.i ]
  %89 = bitcast i32** %__n.06.i.i.i to i8**
  %90 = load i8*, i8** %89, align 8, !tbaa !21
  call void @_ZdlPv(i8* %90) #11
  %incdec.ptr.i.i.i = getelementptr inbounds i32*, i32** %__n.06.i.i.i, i64 1
  %cmp.i.i.i152 = icmp ult i32** %__n.06.i.i.i, %88
  br i1 %cmp.i.i.i152, label %for.body.i.i.i, label %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.loopexit.i.i

_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.loopexit.i.i: ; preds = %for.body.i.i.i
  %.phi.trans.insert.i.i = bitcast %"class.std::deque"* %wavefront to i8**
  %.pre.i.i = load i8*, i8** %.phi.trans.insert.i.i, align 8, !tbaa !18
  br label %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.i.i

_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.i.i: ; preds = %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.loopexit.i.i, %if.then.i.i
  %91 = phi i8* [ %.pre.i.i, %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.loopexit.i.i ], [ %86, %if.then.i.i ]
  call void @_ZdlPv(i8* %91) #11
  br label %_ZNSt5dequeIiSaIiEED2Ev.exit

_ZNSt5dequeIiSaIiEED2Ev.exit:                     ; preds = %while.end, %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.i.i
  call void @llvm.lifetime.end.p0i8(i64 80, i8* nonnull %0) #11
  ret void

ehcleanup:                                        ; preds = %lpad20.loopexit, %lpad20.loopexit.split-lp, %lpad
  %lpad.phi.sink181 = phi { i8*, i32 } [ %51, %lpad ], [ %lpad.loopexit, %lpad20.loopexit ], [ %lpad.loopexit.split-lp, %lpad20.loopexit.split-lp ]
  %_M_map.i.i153 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 0
  %92 = load i32**, i32*** %_M_map.i.i153, align 8, !tbaa !18
  %tobool.i.i154 = icmp eq i32** %92, null
  br i1 %tobool.i.i154, label %_ZNSt5dequeIiSaIiEED2Ev.exit168, label %if.then.i.i159

if.then.i.i159:                                   ; preds = %ehcleanup
  %93 = bitcast i32** %92 to i8*
  %_M_node.i.i155 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 2, i32 3
  %94 = load i32**, i32*** %_M_node.i.i155, align 8, !tbaa !19
  %_M_node4.i.i156 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3, i32 3
  %95 = load i32**, i32*** %_M_node4.i.i156, align 8, !tbaa !17
  %add.ptr.i.i157 = getelementptr inbounds i32*, i32** %95, i64 1
  %cmp5.i.i.i158 = icmp ult i32** %94, %add.ptr.i.i157
  br i1 %cmp5.i.i.i158, label %for.body.i.i.i163, label %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.i.i167

for.body.i.i.i163:                                ; preds = %if.then.i.i159, %for.body.i.i.i163
  %__n.06.i.i.i160 = phi i32** [ %incdec.ptr.i.i.i161, %for.body.i.i.i163 ], [ %94, %if.then.i.i159 ]
  %96 = bitcast i32** %__n.06.i.i.i160 to i8**
  %97 = load i8*, i8** %96, align 8, !tbaa !21
  call void @_ZdlPv(i8* %97) #11
  %incdec.ptr.i.i.i161 = getelementptr inbounds i32*, i32** %__n.06.i.i.i160, i64 1
  %cmp.i.i.i162 = icmp ult i32** %__n.06.i.i.i160, %95
  br i1 %cmp.i.i.i162, label %for.body.i.i.i163, label %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.loopexit.i.i166

_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.loopexit.i.i166: ; preds = %for.body.i.i.i163
  %.phi.trans.insert.i.i164 = bitcast %"class.std::deque"* %wavefront to i8**
  %.pre.i.i165 = load i8*, i8** %.phi.trans.insert.i.i164, align 8, !tbaa !18
  br label %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.i.i167

_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.i.i167: ; preds = %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.loopexit.i.i166, %if.then.i.i159
  %98 = phi i8* [ %.pre.i.i165, %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.loopexit.i.i166 ], [ %93, %if.then.i.i159 ]
  call void @_ZdlPv(i8* %98) #11
  br label %_ZNSt5dequeIiSaIiEED2Ev.exit168

_ZNSt5dequeIiSaIiEED2Ev.exit168:                  ; preds = %ehcleanup, %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.i.i167
  call void @llvm.lifetime.end.p0i8(i64 80, i8* nonnull %0) #11
  resume { i8*, i32 } %lpad.phi.sink181
}

declare dso_local i32 @__gxx_personality_v0(...)

; Function Attrs: noinline uwtable
define dso_local void @_Z14_kernel_supplyP4NodeP4EdgePiS3_iii(%struct.Node* nocapture readonly %h_graph_nodes, %struct.Edge* nocapture readonly %h_graph_edges, i32* nocapture %color, i32* nocapture %h_cost, i32 %source, i32 %tid, i32 %num_threads) local_unnamed_addr #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %wavefront = alloca %"class.std::deque", align 8
  %0 = bitcast %"class.std::deque"* %wavefront to i8*
  call void @llvm.lifetime.start.p0i8(i64 80, i8* nonnull %0) #11
  %1 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 %0, i8 0, i64 80, i1 false) #11
  call void @_ZNSt11_Deque_baseIiSaIiEE17_M_initialize_mapEm(%"class.std::_Deque_base"* nonnull %1, i64 0)
  %_M_cur.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3, i32 0
  %2 = load i32*, i32** %_M_cur.i, align 8, !tbaa !9
  %_M_last.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3, i32 2
  %3 = load i32*, i32** %_M_last.i, align 8, !tbaa !15
  %add.ptr.i = getelementptr inbounds i32, i32* %3, i64 -1
  %cmp.i = icmp eq i32* %2, %add.ptr.i
  br i1 %cmp.i, label %if.else.i, label %if.then.i

if.then.i:                                        ; preds = %entry
  store i32 %source, i32* %2, align 4, !tbaa !2
  %incdec.ptr.i = getelementptr inbounds i32, i32* %2, i64 1
  store i32* %incdec.ptr.i, i32** %_M_cur.i, align 8, !tbaa !9
  br label %invoke.cont

if.else.i:                                        ; preds = %entry
  %_M_map_size.i.i.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 1
  %4 = load i64, i64* %_M_map_size.i.i.i, align 8, !tbaa !16
  %_M_node.i.i.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3, i32 3
  %5 = bitcast i32*** %_M_node.i.i.i to i64*
  %6 = load i64, i64* %5, align 8, !tbaa !17
  %7 = bitcast %"class.std::deque"* %wavefront to i64*
  %8 = load i64, i64* %7, align 8, !tbaa !18
  %sub.ptr.sub.i.i.i = sub i64 %6, %8
  %sub.ptr.div.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i, 3
  %sub.i.i.i = sub i64 %4, %sub.ptr.div.i.i.i
  %cmp.i.i.i = icmp ult i64 %sub.i.i.i, 2
  %9 = inttoptr i64 %6 to i32**
  %10 = inttoptr i64 %8 to i32**
  br i1 %cmp.i.i.i, label %if.then.i.i.i, label %_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_.exit.i

if.then.i.i.i:                                    ; preds = %if.else.i
  %_M_node3.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 2, i32 3
  %11 = load i32**, i32*** %_M_node3.i, align 8, !tbaa !19
  %sub.ptr.rhs.cast.i = ptrtoint i32** %11 to i64
  %sub.ptr.sub.i = sub i64 %6, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, 3
  %add.i = add nsw i64 %sub.ptr.div.i, 1
  %add4.i = add nsw i64 %sub.ptr.div.i, 2
  %mul.i = shl nsw i64 %add4.i, 1
  %cmp.i45 = icmp ugt i64 %4, %mul.i
  br i1 %cmp.i45, label %if.then.i47, label %if.else31.i

if.then.i47:                                      ; preds = %if.then.i.i.i
  %sub.i = sub i64 %4, %add4.i
  %div.i = lshr i64 %sub.i, 1
  %add.ptr.i46 = getelementptr inbounds i32*, i32** %10, i64 %div.i
  %cmp13.i = icmp ult i32** %add.ptr.i46, %11
  %add.ptr21.i = getelementptr inbounds i32*, i32** %9, i64 1
  %sub.ptr.lhs.cast.i.i.i.i.i = ptrtoint i32** %add.ptr21.i to i64
  %sub.ptr.sub.i.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i.i, %sub.ptr.rhs.cast.i
  %tobool.i.i.i.i.i = icmp eq i64 %sub.ptr.sub.i.i.i.i.i, 0
  br i1 %cmp13.i, label %if.then14.i, label %if.else.i48

if.then14.i:                                      ; preds = %if.then.i47
  br i1 %tobool.i.i.i.i.i, label %.noexc, label %if.then.i.i.i.i.i

if.then.i.i.i.i.i:                                ; preds = %if.then14.i
  %12 = bitcast i32** %add.ptr.i46 to i8*
  %13 = bitcast i32** %11 to i8*
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %12, i8* align 8 %13, i64 %sub.ptr.sub.i.i.i.i.i, i1 false) #11
  br label %.noexc

if.else.i48:                                      ; preds = %if.then.i47
  br i1 %tobool.i.i.i.i.i, label %.noexc, label %if.then.i.i.i.i101.i

if.then.i.i.i.i101.i:                             ; preds = %if.else.i48
  %add.ptr29.i = getelementptr inbounds i32*, i32** %add.ptr.i46, i64 %add.i
  %sub.ptr.div.i.i.i.i99.i = ashr exact i64 %sub.ptr.sub.i.i.i.i.i, 3
  %idx.neg.i.i.i.i.i = sub nsw i64 0, %sub.ptr.div.i.i.i.i99.i
  %add.ptr.i.i.i.i100.i = getelementptr inbounds i32*, i32** %add.ptr29.i, i64 %idx.neg.i.i.i.i.i
  %14 = bitcast i32** %add.ptr.i.i.i.i100.i to i8*
  %15 = bitcast i32** %11 to i8*
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %14, i8* align 8 %15, i64 %sub.ptr.sub.i.i.i.i.i, i1 false) #11
  br label %.noexc

if.else31.i:                                      ; preds = %if.then.i.i.i
  %cmp.i.i = icmp eq i64 %4, 0
  %.sroa.speculated.i = select i1 %cmp.i.i, i64 1, i64 %4
  %add37.i = add i64 %4, 2
  %add38.i = add i64 %add37.i, %.sroa.speculated.i
  %cmp.i.i.i.i = icmp ugt i64 %add38.i, 2305843009213693951
  br i1 %cmp.i.i.i.i, label %if.then.i.i.i.i, label %_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm.exit.i

if.then.i.i.i.i:                                  ; preds = %if.else31.i
  invoke void @_ZSt17__throw_bad_allocv() #15
          to label %.noexc50 unwind label %lpad

.noexc50:                                         ; preds = %if.then.i.i.i.i
  unreachable

_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm.exit.i: ; preds = %if.else31.i
  %mul.i.i.i.i = shl i64 %add38.i, 3
  %call2.i.i3.i.i51 = invoke i8* @_Znwm(i64 %mul.i.i.i.i)
          to label %call2.i.i3.i.i.noexc unwind label %lpad

call2.i.i3.i.i.noexc:                             ; preds = %_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm.exit.i
  %16 = bitcast i8* %call2.i.i3.i.i51 to i32**
  %sub40.i = sub i64 %add38.i, %add4.i
  %div41.i = lshr i64 %sub40.i, 1
  %add.ptr42.i = getelementptr inbounds i32*, i32** %16, i64 %div41.i
  %17 = load i32**, i32*** %_M_node3.i, align 8, !tbaa !19
  %18 = load i32**, i32*** %_M_node.i.i.i, align 8, !tbaa !17
  %add.ptr55.i = getelementptr inbounds i32*, i32** %18, i64 1
  %sub.ptr.lhs.cast.i.i.i.i102.i = ptrtoint i32** %add.ptr55.i to i64
  %sub.ptr.rhs.cast.i.i.i.i103.i = ptrtoint i32** %17 to i64
  %sub.ptr.sub.i.i.i.i104.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i102.i, %sub.ptr.rhs.cast.i.i.i.i103.i
  %tobool.i.i.i.i106.i = icmp eq i64 %sub.ptr.sub.i.i.i.i104.i, 0
  br i1 %tobool.i.i.i.i106.i, label %_ZSt4copyIPPiS1_ET0_T_S3_S2_.exit109.i, label %if.then.i.i.i.i107.i

if.then.i.i.i.i107.i:                             ; preds = %call2.i.i3.i.i.noexc
  %19 = bitcast i32** %add.ptr42.i to i8*
  %20 = bitcast i32** %17 to i8*
  call void @llvm.memmove.p0i8.p0i8.i64(i8* nonnull align 8 %19, i8* align 8 %20, i64 %sub.ptr.sub.i.i.i.i104.i, i1 false) #11
  br label %_ZSt4copyIPPiS1_ET0_T_S3_S2_.exit109.i

_ZSt4copyIPPiS1_ET0_T_S3_S2_.exit109.i:           ; preds = %if.then.i.i.i.i107.i, %call2.i.i3.i.i.noexc
  %21 = bitcast %"class.std::deque"* %wavefront to i8**
  %22 = load i8*, i8** %21, align 8, !tbaa !18
  call void @_ZdlPv(i8* %22) #11
  store i8* %call2.i.i3.i.i51, i8** %21, align 8, !tbaa !18
  store i64 %add38.i, i64* %_M_map_size.i.i.i, align 8, !tbaa !16
  br label %.noexc

.noexc:                                           ; preds = %_ZSt4copyIPPiS1_ET0_T_S3_S2_.exit109.i, %if.then.i.i.i.i101.i, %if.else.i48, %if.then.i.i.i.i.i, %if.then14.i
  %__new_nstart.0.i = phi i32** [ %add.ptr42.i, %_ZSt4copyIPPiS1_ET0_T_S3_S2_.exit109.i ], [ %add.ptr.i46, %if.then14.i ], [ %add.ptr.i46, %if.then.i.i.i.i.i ], [ %add.ptr.i46, %if.else.i48 ], [ %add.ptr.i46, %if.then.i.i.i.i101.i ]
  store i32** %__new_nstart.0.i, i32*** %_M_node3.i, align 8, !tbaa !20
  %23 = load i32*, i32** %__new_nstart.0.i, align 8, !tbaa !21
  %_M_first.i92.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 2, i32 1
  store i32* %23, i32** %_M_first.i92.i, align 8, !tbaa !22
  %add.ptr.i93.i = getelementptr inbounds i32, i32* %23, i64 128
  %_M_last.i94.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 2, i32 2
  store i32* %add.ptr.i93.i, i32** %_M_last.i94.i, align 8, !tbaa !23
  %add.ptr71.i = getelementptr inbounds i32*, i32** %__new_nstart.0.i, i64 %sub.ptr.div.i
  store i32** %add.ptr71.i, i32*** %_M_node.i.i.i, align 8, !tbaa !20
  %24 = load i32*, i32** %add.ptr71.i, align 8, !tbaa !21
  %_M_first.i.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3, i32 1
  store i32* %24, i32** %_M_first.i.i, align 8, !tbaa !22
  %add.ptr.i.i49 = getelementptr inbounds i32, i32* %24, i64 128
  store i32* %add.ptr.i.i49, i32** %_M_last.i, align 8, !tbaa !23
  br label %_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_.exit.i

_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_.exit.i: ; preds = %.noexc, %if.else.i
  %call2.i.i.i.i.i44 = invoke i8* @_Znwm(i64 512)
          to label %call2.i.i.i.i.i.noexc unwind label %lpad

call2.i.i.i.i.i.noexc:                            ; preds = %_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_.exit.i
  %_M_finish.i.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3
  %25 = load i32**, i32*** %_M_node.i.i.i, align 8, !tbaa !17
  %add.ptr.i.i = getelementptr inbounds i32*, i32** %25, i64 1
  %26 = bitcast i32** %add.ptr.i.i to i8**
  store i8* %call2.i.i.i.i.i44, i8** %26, align 8, !tbaa !21
  %_M_cur.i.i = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish.i.i, i64 0, i32 0
  %27 = load i32*, i32** %_M_cur.i.i, align 8, !tbaa !9
  store i32 %source, i32* %27, align 4, !tbaa !2
  %28 = load i32**, i32*** %_M_node.i.i.i, align 8, !tbaa !17
  %add.ptr11.i.i = getelementptr inbounds i32*, i32** %28, i64 1
  store i32** %add.ptr11.i.i, i32*** %_M_node.i.i.i, align 8, !tbaa !20
  %29 = load i32*, i32** %add.ptr11.i.i, align 8, !tbaa !21
  %_M_first.i.i.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3, i32 1
  store i32* %29, i32** %_M_first.i.i.i, align 8, !tbaa !22
  %add.ptr.i.i.i = getelementptr inbounds i32, i32* %29, i64 128
  store i32* %add.ptr.i.i.i, i32** %_M_last.i, align 8, !tbaa !23
  %.cast.i.i = ptrtoint i32* %29 to i64
  %30 = bitcast %"struct.std::_Deque_iterator"* %_M_finish.i.i to i64*
  store i64 %.cast.i.i, i64* %30, align 8, !tbaa !9
  br label %invoke.cont

invoke.cont:                                      ; preds = %call2.i.i.i.i.i.noexc, %if.then.i
  %31 = phi i32* [ %29, %call2.i.i.i.i.i.noexc ], [ %incdec.ptr.i, %if.then.i ]
  %idxprom = sext i32 %source to i64
  %arrayidx = getelementptr inbounds i32, i32* %color, i64 %idxprom
  store i32 16677218, i32* %arrayidx, align 4, !tbaa !2
  %_M_cur1.i.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 2, i32 0
  %32 = load i32*, i32** %_M_cur1.i.i, align 8, !tbaa !24
  %cmp.i.i53178 = icmp eq i32* %31, %32
  br i1 %cmp.i.i53178, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %invoke.cont
  %_M_last.i55 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 2, i32 2
  %_M_start.i.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 2
  %_M_first.i.i59 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 2, i32 1
  %33 = bitcast i32** %_M_first.i.i59 to i8**
  %_M_node.i.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 2, i32 3
  %34 = bitcast %"struct.std::_Deque_iterator"* %_M_start.i.i to i64*
  %_M_map_size.i.i.i70 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 1
  %_M_node.i.i.i71 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3, i32 3
  %35 = bitcast i32*** %_M_node.i.i.i71 to i64*
  %36 = bitcast %"class.std::deque"* %wavefront to i64*
  %37 = bitcast %"class.std::deque"* %wavefront to i8**
  %_M_first.i.i143 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3, i32 1
  %_M_finish.i.i78 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3
  %_M_cur.i.i80 = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish.i.i78, i64 0, i32 0
  %38 = bitcast %"struct.std::_Deque_iterator"* %_M_finish.i.i78 to i64*
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %for.cond.cleanup
  %39 = phi i32* [ %32, %while.body.lr.ph ], [ %49, %for.cond.cleanup ]
  %40 = load i32, i32* %39, align 4, !tbaa !2
  %41 = load i32*, i32** %_M_last.i55, align 8, !tbaa !25
  %add.ptr.i56 = getelementptr inbounds i32, i32* %41, i64 -1
  %cmp.i57 = icmp eq i32* %39, %add.ptr.i56
  br i1 %cmp.i57, label %if.else.i63, label %invoke.cont.i

invoke.cont.i:                                    ; preds = %while.body
  %incdec.ptr.i58 = getelementptr inbounds i32, i32* %39, i64 1
  store i32* %incdec.ptr.i58, i32** %_M_cur1.i.i, align 8, !tbaa !26
  br label %_ZNSt5dequeIiSaIiEE9pop_frontEv.exit

if.else.i63:                                      ; preds = %while.body
  %42 = load i8*, i8** %33, align 8, !tbaa !27
  call void @_ZdlPv(i8* %42) #11
  %43 = load i32**, i32*** %_M_node.i.i, align 8, !tbaa !19
  %add.ptr.i.i60 = getelementptr inbounds i32*, i32** %43, i64 1
  store i32** %add.ptr.i.i60, i32*** %_M_node.i.i, align 8, !tbaa !20
  %44 = load i32*, i32** %add.ptr.i.i60, align 8, !tbaa !21
  store i32* %44, i32** %_M_first.i.i59, align 8, !tbaa !22
  %add.ptr.i.i.i61 = getelementptr inbounds i32, i32* %44, i64 128
  store i32* %add.ptr.i.i.i61, i32** %_M_last.i55, align 8, !tbaa !23
  %.cast.i.i62 = ptrtoint i32* %44 to i64
  store i64 %.cast.i.i62, i64* %34, align 8, !tbaa !26
  br label %_ZNSt5dequeIiSaIiEE9pop_frontEv.exit

_ZNSt5dequeIiSaIiEE9pop_frontEv.exit:             ; preds = %invoke.cont.i, %if.else.i63
  %45 = phi i32* [ %incdec.ptr.i58, %invoke.cont.i ], [ %44, %if.else.i63 ]
  %idxprom2 = sext i32 %40 to i64
  %x = getelementptr inbounds %struct.Node, %struct.Node* %h_graph_nodes, i64 %idxprom2, i32 0
  %y = getelementptr inbounds %struct.Node, %struct.Node* %h_graph_nodes, i64 %idxprom2, i32 1
  %46 = load i32, i32* %y, align 4, !tbaa !28
  %cmp176 = icmp sgt i32 %46, 0
  br i1 %cmp176, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %_ZNSt5dequeIiSaIiEE9pop_frontEv.exit
  %47 = load i32, i32* %x, align 4, !tbaa !30
  %arrayidx16 = getelementptr inbounds i32, i32* %h_cost, i64 %idxprom2
  %48 = sext i32 %47 to i64
  br label %for.body

for.cond.cleanup.loopexit:                        ; preds = %if.end
  %.pre180 = load i32*, i32** %_M_cur1.i.i, align 8, !tbaa !24
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %_ZNSt5dequeIiSaIiEE9pop_frontEv.exit
  %49 = phi i32* [ %.pre180, %for.cond.cleanup.loopexit ], [ %45, %_ZNSt5dequeIiSaIiEE9pop_frontEv.exit ]
  %arrayidx25 = getelementptr inbounds i32, i32* %color, i64 %idxprom2
  store i32 16677221, i32* %arrayidx25, align 4, !tbaa !2
  %50 = load i32*, i32** %_M_cur.i, align 8, !tbaa !24
  %cmp.i.i53 = icmp eq i32* %50, %49
  br i1 %cmp.i.i53, label %while.end, label %while.body

lpad:                                             ; preds = %_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm.exit.i, %if.then.i.i.i.i, %_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_.exit.i
  %51 = landingpad { i8*, i32 }
          cleanup
  br label %ehcleanup

for.body:                                         ; preds = %for.body.lr.ph, %if.end
  %52 = phi i32 [ %47, %for.body.lr.ph ], [ %82, %if.end ]
  %53 = phi i32 [ %46, %for.body.lr.ph ], [ %83, %if.end ]
  %indvars.iv = phi i64 [ %48, %for.body.lr.ph ], [ %indvars.iv.next, %if.end ]
  %x11 = getelementptr inbounds %struct.Edge, %struct.Edge* %h_graph_edges, i64 %indvars.iv, i32 0
  %54 = load i32, i32* %x11, align 4, !tbaa !31
  %idxprom12 = sext i32 %54 to i64
  %arrayidx13 = getelementptr inbounds i32, i32* %color, i64 %idxprom12
  %55 = load i32, i32* %arrayidx13, align 4, !tbaa !2
  %cmp14 = icmp eq i32 %55, 16677217
  br i1 %cmp14, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %56 = load i32, i32* %arrayidx16, align 4, !tbaa !2
  %add17 = add nsw i32 %56, 1
  %arrayidx19 = getelementptr inbounds i32, i32* %h_cost, i64 %idxprom12
  store i32 %add17, i32* %arrayidx19, align 4, !tbaa !2
  %57 = load i32*, i32** %_M_cur.i, align 8, !tbaa !9
  %58 = load i32*, i32** %_M_last.i, align 8, !tbaa !15
  %add.ptr.i66 = getelementptr inbounds i32, i32* %58, i64 -1
  %cmp.i67 = icmp eq i32* %57, %add.ptr.i66
  br i1 %cmp.i67, label %if.else.i76, label %if.then.i69

if.then.i69:                                      ; preds = %if.then
  store i32 %54, i32* %57, align 4, !tbaa !2
  %incdec.ptr.i68 = getelementptr inbounds i32, i32* %57, i64 1
  store i32* %incdec.ptr.i68, i32** %_M_cur.i, align 8, !tbaa !9
  br label %invoke.cont21

if.else.i76:                                      ; preds = %if.then
  %59 = load i64, i64* %_M_map_size.i.i.i70, align 8, !tbaa !16
  %60 = load i64, i64* %35, align 8, !tbaa !17
  %61 = load i64, i64* %36, align 8, !tbaa !18
  %sub.ptr.sub.i.i.i72 = sub i64 %60, %61
  %sub.ptr.div.i.i.i73 = ashr exact i64 %sub.ptr.sub.i.i.i72, 3
  %sub.i.i.i74 = sub i64 %59, %sub.ptr.div.i.i.i73
  %cmp.i.i.i75 = icmp ult i64 %sub.i.i.i74, 2
  %62 = inttoptr i64 %60 to i32**
  %63 = inttoptr i64 %61 to i32**
  br i1 %cmp.i.i.i75, label %if.then.i.i.i77, label %_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_.exit.i85

if.then.i.i.i77:                                  ; preds = %if.else.i76
  %64 = load i32**, i32*** %_M_node.i.i, align 8, !tbaa !19
  %sub.ptr.rhs.cast.i93 = ptrtoint i32** %64 to i64
  %sub.ptr.sub.i94 = sub i64 %60, %sub.ptr.rhs.cast.i93
  %sub.ptr.div.i95 = ashr exact i64 %sub.ptr.sub.i94, 3
  %add.i96 = add nsw i64 %sub.ptr.div.i95, 1
  %add4.i97 = add nsw i64 %sub.ptr.div.i95, 2
  %mul.i99 = shl nsw i64 %add4.i97, 1
  %cmp.i100 = icmp ugt i64 %59, %mul.i99
  br i1 %cmp.i100, label %if.then.i110, label %if.else31.i124

if.then.i110:                                     ; preds = %if.then.i.i.i77
  %sub.i102 = sub i64 %59, %add4.i97
  %div.i103 = lshr i64 %sub.i102, 1
  %add.ptr.i104 = getelementptr inbounds i32*, i32** %63, i64 %div.i103
  %cmp13.i105 = icmp ult i32** %add.ptr.i104, %64
  %add.ptr21.i106 = getelementptr inbounds i32*, i32** %62, i64 1
  %sub.ptr.lhs.cast.i.i.i.i.i107 = ptrtoint i32** %add.ptr21.i106 to i64
  %sub.ptr.sub.i.i.i.i.i108 = sub i64 %sub.ptr.lhs.cast.i.i.i.i.i107, %sub.ptr.rhs.cast.i93
  %tobool.i.i.i.i.i109 = icmp eq i64 %sub.ptr.sub.i.i.i.i.i108, 0
  br i1 %cmp13.i105, label %if.then14.i111, label %if.else.i113

if.then14.i111:                                   ; preds = %if.then.i110
  br i1 %tobool.i.i.i.i.i109, label %.noexc86, label %if.then.i.i.i.i.i112

if.then.i.i.i.i.i112:                             ; preds = %if.then14.i111
  %65 = bitcast i32** %add.ptr.i104 to i8*
  %66 = bitcast i32** %64 to i8*
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %65, i8* align 8 %66, i64 %sub.ptr.sub.i.i.i.i.i108, i1 false) #11
  br label %.noexc86

if.else.i113:                                     ; preds = %if.then.i110
  br i1 %tobool.i.i.i.i.i109, label %.noexc86, label %if.then.i.i.i.i101.i118

if.then.i.i.i.i101.i118:                          ; preds = %if.else.i113
  %add.ptr29.i114 = getelementptr inbounds i32*, i32** %add.ptr.i104, i64 %add.i96
  %sub.ptr.div.i.i.i.i99.i115 = ashr exact i64 %sub.ptr.sub.i.i.i.i.i108, 3
  %idx.neg.i.i.i.i.i116 = sub nsw i64 0, %sub.ptr.div.i.i.i.i99.i115
  %add.ptr.i.i.i.i100.i117 = getelementptr inbounds i32*, i32** %add.ptr29.i114, i64 %idx.neg.i.i.i.i.i116
  %67 = bitcast i32** %add.ptr.i.i.i.i100.i117 to i8*
  %68 = bitcast i32** %64 to i8*
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %67, i8* align 8 %68, i64 %sub.ptr.sub.i.i.i.i.i108, i1 false) #11
  br label %.noexc86

if.else31.i124:                                   ; preds = %if.then.i.i.i77
  %cmp.i.i119 = icmp eq i64 %59, 0
  %.sroa.speculated.i120 = select i1 %cmp.i.i119, i64 1, i64 %59
  %add37.i121 = add i64 %59, 2
  %add38.i122 = add i64 %add37.i121, %.sroa.speculated.i120
  %cmp.i.i.i.i123 = icmp ugt i64 %add38.i122, 2305843009213693951
  br i1 %cmp.i.i.i.i123, label %if.then.i.i.i.i125, label %_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm.exit.i135

if.then.i.i.i.i125:                               ; preds = %if.else31.i124
  invoke void @_ZSt17__throw_bad_allocv() #15
          to label %.noexc146 unwind label %lpad20.loopexit.split-lp

.noexc146:                                        ; preds = %if.then.i.i.i.i125
  unreachable

_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm.exit.i135: ; preds = %if.else31.i124
  %mul.i.i.i.i126 = shl i64 %add38.i122, 3
  %call2.i.i3.i.i148 = invoke i8* @_Znwm(i64 %mul.i.i.i.i126)
          to label %call2.i.i3.i.i.noexc147 unwind label %lpad20.loopexit

call2.i.i3.i.i.noexc147:                          ; preds = %_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm.exit.i135
  %69 = bitcast i8* %call2.i.i3.i.i148 to i32**
  %sub40.i127 = sub i64 %add38.i122, %add4.i97
  %div41.i128 = lshr i64 %sub40.i127, 1
  %add.ptr42.i129 = getelementptr inbounds i32*, i32** %69, i64 %div41.i128
  %70 = load i32**, i32*** %_M_node.i.i, align 8, !tbaa !19
  %71 = load i32**, i32*** %_M_node.i.i.i71, align 8, !tbaa !17
  %add.ptr55.i130 = getelementptr inbounds i32*, i32** %71, i64 1
  %sub.ptr.lhs.cast.i.i.i.i102.i131 = ptrtoint i32** %add.ptr55.i130 to i64
  %sub.ptr.rhs.cast.i.i.i.i103.i132 = ptrtoint i32** %70 to i64
  %sub.ptr.sub.i.i.i.i104.i133 = sub i64 %sub.ptr.lhs.cast.i.i.i.i102.i131, %sub.ptr.rhs.cast.i.i.i.i103.i132
  %tobool.i.i.i.i106.i134 = icmp eq i64 %sub.ptr.sub.i.i.i.i104.i133, 0
  br i1 %tobool.i.i.i.i106.i134, label %_ZSt4copyIPPiS1_ET0_T_S3_S2_.exit109.i137, label %if.then.i.i.i.i107.i136

if.then.i.i.i.i107.i136:                          ; preds = %call2.i.i3.i.i.noexc147
  %72 = bitcast i32** %add.ptr42.i129 to i8*
  %73 = bitcast i32** %70 to i8*
  call void @llvm.memmove.p0i8.p0i8.i64(i8* nonnull align 8 %72, i8* align 8 %73, i64 %sub.ptr.sub.i.i.i.i104.i133, i1 false) #11
  br label %_ZSt4copyIPPiS1_ET0_T_S3_S2_.exit109.i137

_ZSt4copyIPPiS1_ET0_T_S3_S2_.exit109.i137:        ; preds = %if.then.i.i.i.i107.i136, %call2.i.i3.i.i.noexc147
  %74 = load i8*, i8** %37, align 8, !tbaa !18
  call void @_ZdlPv(i8* %74) #11
  store i8* %call2.i.i3.i.i148, i8** %37, align 8, !tbaa !18
  store i64 %add38.i122, i64* %_M_map_size.i.i.i70, align 8, !tbaa !16
  br label %.noexc86

.noexc86:                                         ; preds = %_ZSt4copyIPPiS1_ET0_T_S3_S2_.exit109.i137, %if.then.i.i.i.i101.i118, %if.else.i113, %if.then.i.i.i.i.i112, %if.then14.i111
  %__new_nstart.0.i138 = phi i32** [ %add.ptr42.i129, %_ZSt4copyIPPiS1_ET0_T_S3_S2_.exit109.i137 ], [ %add.ptr.i104, %if.then14.i111 ], [ %add.ptr.i104, %if.then.i.i.i.i.i112 ], [ %add.ptr.i104, %if.else.i113 ], [ %add.ptr.i104, %if.then.i.i.i.i101.i118 ]
  store i32** %__new_nstart.0.i138, i32*** %_M_node.i.i, align 8, !tbaa !20
  %75 = load i32*, i32** %__new_nstart.0.i138, align 8, !tbaa !21
  store i32* %75, i32** %_M_first.i.i59, align 8, !tbaa !22
  %add.ptr.i93.i140 = getelementptr inbounds i32, i32* %75, i64 128
  store i32* %add.ptr.i93.i140, i32** %_M_last.i55, align 8, !tbaa !23
  %add.ptr71.i142 = getelementptr inbounds i32*, i32** %__new_nstart.0.i138, i64 %sub.ptr.div.i95
  store i32** %add.ptr71.i142, i32*** %_M_node.i.i.i71, align 8, !tbaa !20
  %76 = load i32*, i32** %add.ptr71.i142, align 8, !tbaa !21
  store i32* %76, i32** %_M_first.i.i143, align 8, !tbaa !22
  %add.ptr.i.i144 = getelementptr inbounds i32, i32* %76, i64 128
  store i32* %add.ptr.i.i144, i32** %_M_last.i, align 8, !tbaa !23
  br label %_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_.exit.i85

_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_.exit.i85: ; preds = %.noexc86, %if.else.i76
  %call2.i.i.i.i.i88 = invoke i8* @_Znwm(i64 512)
          to label %call2.i.i.i.i.i.noexc87 unwind label %lpad20.loopexit

call2.i.i.i.i.i.noexc87:                          ; preds = %_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_.exit.i85
  %77 = load i32**, i32*** %_M_node.i.i.i71, align 8, !tbaa !17
  %add.ptr.i.i79 = getelementptr inbounds i32*, i32** %77, i64 1
  %78 = bitcast i32** %add.ptr.i.i79 to i8**
  store i8* %call2.i.i.i.i.i88, i8** %78, align 8, !tbaa !21
  %79 = load i32*, i32** %_M_cur.i.i80, align 8, !tbaa !9
  store i32 %54, i32* %79, align 4, !tbaa !2
  %80 = load i32**, i32*** %_M_node.i.i.i71, align 8, !tbaa !17
  %add.ptr11.i.i81 = getelementptr inbounds i32*, i32** %80, i64 1
  store i32** %add.ptr11.i.i81, i32*** %_M_node.i.i.i71, align 8, !tbaa !20
  %81 = load i32*, i32** %add.ptr11.i.i81, align 8, !tbaa !21
  store i32* %81, i32** %_M_first.i.i143, align 8, !tbaa !22
  %add.ptr.i.i.i83 = getelementptr inbounds i32, i32* %81, i64 128
  store i32* %add.ptr.i.i.i83, i32** %_M_last.i, align 8, !tbaa !23
  %.cast.i.i84 = ptrtoint i32* %81 to i64
  store i64 %.cast.i.i84, i64* %38, align 8, !tbaa !9
  br label %invoke.cont21

invoke.cont21:                                    ; preds = %call2.i.i.i.i.i.noexc87, %if.then.i69
  store i32 16677218, i32* %arrayidx13, align 4, !tbaa !2
  %.pre = load i32, i32* %y, align 4, !tbaa !28
  %.pre179 = load i32, i32* %x, align 4, !tbaa !30
  br label %if.end

lpad20.loopexit:                                  ; preds = %_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_.exit.i85, %_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm.exit.i135
  %lpad.loopexit = landingpad { i8*, i32 }
          cleanup
  br label %ehcleanup

lpad20.loopexit.split-lp:                         ; preds = %if.then.i.i.i.i125
  %lpad.loopexit.split-lp = landingpad { i8*, i32 }
          cleanup
  br label %ehcleanup

if.end:                                           ; preds = %invoke.cont21, %for.body
  %82 = phi i32 [ %.pre179, %invoke.cont21 ], [ %52, %for.body ]
  %83 = phi i32 [ %.pre, %invoke.cont21 ], [ %53, %for.body ]
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %add = add nsw i32 %82, %83
  %84 = sext i32 %add to i64
  %cmp = icmp slt i64 %indvars.iv.next, %84
  br i1 %cmp, label %for.body, label %for.cond.cleanup.loopexit

while.end:                                        ; preds = %for.cond.cleanup, %invoke.cont
  %_M_map.i.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 0
  %85 = load i32**, i32*** %_M_map.i.i, align 8, !tbaa !18
  %tobool.i.i = icmp eq i32** %85, null
  br i1 %tobool.i.i, label %_ZNSt5dequeIiSaIiEED2Ev.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %while.end
  %86 = bitcast i32** %85 to i8*
  %_M_node.i.i150 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 2, i32 3
  %87 = load i32**, i32*** %_M_node.i.i150, align 8, !tbaa !19
  %_M_node4.i.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3, i32 3
  %88 = load i32**, i32*** %_M_node4.i.i, align 8, !tbaa !17
  %add.ptr.i.i151 = getelementptr inbounds i32*, i32** %88, i64 1
  %cmp5.i.i.i = icmp ult i32** %87, %add.ptr.i.i151
  br i1 %cmp5.i.i.i, label %for.body.i.i.i, label %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.i.i

for.body.i.i.i:                                   ; preds = %if.then.i.i, %for.body.i.i.i
  %__n.06.i.i.i = phi i32** [ %incdec.ptr.i.i.i, %for.body.i.i.i ], [ %87, %if.then.i.i ]
  %89 = bitcast i32** %__n.06.i.i.i to i8**
  %90 = load i8*, i8** %89, align 8, !tbaa !21
  call void @_ZdlPv(i8* %90) #11
  %incdec.ptr.i.i.i = getelementptr inbounds i32*, i32** %__n.06.i.i.i, i64 1
  %cmp.i.i.i152 = icmp ult i32** %__n.06.i.i.i, %88
  br i1 %cmp.i.i.i152, label %for.body.i.i.i, label %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.loopexit.i.i

_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.loopexit.i.i: ; preds = %for.body.i.i.i
  %.phi.trans.insert.i.i = bitcast %"class.std::deque"* %wavefront to i8**
  %.pre.i.i = load i8*, i8** %.phi.trans.insert.i.i, align 8, !tbaa !18
  br label %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.i.i

_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.i.i: ; preds = %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.loopexit.i.i, %if.then.i.i
  %91 = phi i8* [ %.pre.i.i, %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.loopexit.i.i ], [ %86, %if.then.i.i ]
  call void @_ZdlPv(i8* %91) #11
  br label %_ZNSt5dequeIiSaIiEED2Ev.exit

_ZNSt5dequeIiSaIiEED2Ev.exit:                     ; preds = %while.end, %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.i.i
  call void @llvm.lifetime.end.p0i8(i64 80, i8* nonnull %0) #11
  ret void

ehcleanup:                                        ; preds = %lpad20.loopexit, %lpad20.loopexit.split-lp, %lpad
  %lpad.phi.sink181 = phi { i8*, i32 } [ %51, %lpad ], [ %lpad.loopexit, %lpad20.loopexit ], [ %lpad.loopexit.split-lp, %lpad20.loopexit.split-lp ]
  %_M_map.i.i153 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 0
  %92 = load i32**, i32*** %_M_map.i.i153, align 8, !tbaa !18
  %tobool.i.i154 = icmp eq i32** %92, null
  br i1 %tobool.i.i154, label %_ZNSt5dequeIiSaIiEED2Ev.exit168, label %if.then.i.i159

if.then.i.i159:                                   ; preds = %ehcleanup
  %93 = bitcast i32** %92 to i8*
  %_M_node.i.i155 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 2, i32 3
  %94 = load i32**, i32*** %_M_node.i.i155, align 8, !tbaa !19
  %_M_node4.i.i156 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3, i32 3
  %95 = load i32**, i32*** %_M_node4.i.i156, align 8, !tbaa !17
  %add.ptr.i.i157 = getelementptr inbounds i32*, i32** %95, i64 1
  %cmp5.i.i.i158 = icmp ult i32** %94, %add.ptr.i.i157
  br i1 %cmp5.i.i.i158, label %for.body.i.i.i163, label %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.i.i167

for.body.i.i.i163:                                ; preds = %if.then.i.i159, %for.body.i.i.i163
  %__n.06.i.i.i160 = phi i32** [ %incdec.ptr.i.i.i161, %for.body.i.i.i163 ], [ %94, %if.then.i.i159 ]
  %96 = bitcast i32** %__n.06.i.i.i160 to i8**
  %97 = load i8*, i8** %96, align 8, !tbaa !21
  call void @_ZdlPv(i8* %97) #11
  %incdec.ptr.i.i.i161 = getelementptr inbounds i32*, i32** %__n.06.i.i.i160, i64 1
  %cmp.i.i.i162 = icmp ult i32** %__n.06.i.i.i160, %95
  br i1 %cmp.i.i.i162, label %for.body.i.i.i163, label %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.loopexit.i.i166

_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.loopexit.i.i166: ; preds = %for.body.i.i.i163
  %.phi.trans.insert.i.i164 = bitcast %"class.std::deque"* %wavefront to i8**
  %.pre.i.i165 = load i8*, i8** %.phi.trans.insert.i.i164, align 8, !tbaa !18
  br label %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.i.i167

_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.i.i167: ; preds = %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.loopexit.i.i166, %if.then.i.i159
  %98 = phi i8* [ %.pre.i.i165, %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.loopexit.i.i166 ], [ %93, %if.then.i.i159 ]
  call void @_ZdlPv(i8* %98) #11
  br label %_ZNSt5dequeIiSaIiEED2Ev.exit168

_ZNSt5dequeIiSaIiEED2Ev.exit168:                  ; preds = %ehcleanup, %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.i.i167
  call void @llvm.lifetime.end.p0i8(i64 80, i8* nonnull %0) #11
  resume { i8*, i32 } %lpad.phi.sink181
}

; Function Attrs: uwtable
define dso_local void @_Z8_kernel_P4NodeP4EdgePiS3_iii(%struct.Node* nocapture readonly %h_graph_nodes, %struct.Edge* nocapture readonly %h_graph_edges, i32* nocapture %color, i32* nocapture %h_cost, i32 %source, i32 %tid, i32 %num_threads) local_unnamed_addr #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %wavefront = alloca %"class.std::deque", align 8
  %0 = bitcast %"class.std::deque"* %wavefront to i8*
  call void @llvm.lifetime.start.p0i8(i64 80, i8* nonnull %0) #11
  %1 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 %0, i8 0, i64 80, i1 false) #11
  call void @_ZNSt11_Deque_baseIiSaIiEE17_M_initialize_mapEm(%"class.std::_Deque_base"* nonnull %1, i64 0)
  %_M_cur.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3, i32 0
  %2 = load i32*, i32** %_M_cur.i, align 8, !tbaa !9
  %_M_last.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3, i32 2
  %3 = load i32*, i32** %_M_last.i, align 8, !tbaa !15
  %add.ptr.i = getelementptr inbounds i32, i32* %3, i64 -1
  %cmp.i = icmp eq i32* %2, %add.ptr.i
  br i1 %cmp.i, label %if.else.i, label %if.then.i

if.then.i:                                        ; preds = %entry
  store i32 %source, i32* %2, align 4, !tbaa !2
  %incdec.ptr.i = getelementptr inbounds i32, i32* %2, i64 1
  store i32* %incdec.ptr.i, i32** %_M_cur.i, align 8, !tbaa !9
  br label %invoke.cont

if.else.i:                                        ; preds = %entry
  %_M_map_size.i.i.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 1
  %4 = load i64, i64* %_M_map_size.i.i.i, align 8, !tbaa !16
  %_M_node.i.i.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3, i32 3
  %5 = bitcast i32*** %_M_node.i.i.i to i64*
  %6 = load i64, i64* %5, align 8, !tbaa !17
  %7 = bitcast %"class.std::deque"* %wavefront to i64*
  %8 = load i64, i64* %7, align 8, !tbaa !18
  %sub.ptr.sub.i.i.i = sub i64 %6, %8
  %sub.ptr.div.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i, 3
  %sub.i.i.i = sub i64 %4, %sub.ptr.div.i.i.i
  %cmp.i.i.i = icmp ult i64 %sub.i.i.i, 2
  %9 = inttoptr i64 %6 to i32**
  %10 = inttoptr i64 %8 to i32**
  br i1 %cmp.i.i.i, label %if.then.i.i.i, label %_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_.exit.i

if.then.i.i.i:                                    ; preds = %if.else.i
  %_M_node3.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 2, i32 3
  %11 = load i32**, i32*** %_M_node3.i, align 8, !tbaa !19
  %sub.ptr.rhs.cast.i = ptrtoint i32** %11 to i64
  %sub.ptr.sub.i = sub i64 %6, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, 3
  %add.i = add nsw i64 %sub.ptr.div.i, 1
  %add4.i = add nsw i64 %sub.ptr.div.i, 2
  %mul.i = shl nsw i64 %add4.i, 1
  %cmp.i45 = icmp ugt i64 %4, %mul.i
  br i1 %cmp.i45, label %if.then.i47, label %if.else31.i

if.then.i47:                                      ; preds = %if.then.i.i.i
  %sub.i = sub i64 %4, %add4.i
  %div.i = lshr i64 %sub.i, 1
  %add.ptr.i46 = getelementptr inbounds i32*, i32** %10, i64 %div.i
  %cmp13.i = icmp ult i32** %add.ptr.i46, %11
  %add.ptr21.i = getelementptr inbounds i32*, i32** %9, i64 1
  %sub.ptr.lhs.cast.i.i.i.i.i = ptrtoint i32** %add.ptr21.i to i64
  %sub.ptr.sub.i.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i.i, %sub.ptr.rhs.cast.i
  %tobool.i.i.i.i.i = icmp eq i64 %sub.ptr.sub.i.i.i.i.i, 0
  br i1 %cmp13.i, label %if.then14.i, label %if.else.i48

if.then14.i:                                      ; preds = %if.then.i47
  br i1 %tobool.i.i.i.i.i, label %.noexc, label %if.then.i.i.i.i.i

if.then.i.i.i.i.i:                                ; preds = %if.then14.i
  %12 = bitcast i32** %add.ptr.i46 to i8*
  %13 = bitcast i32** %11 to i8*
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %12, i8* align 8 %13, i64 %sub.ptr.sub.i.i.i.i.i, i1 false) #11
  br label %.noexc

if.else.i48:                                      ; preds = %if.then.i47
  br i1 %tobool.i.i.i.i.i, label %.noexc, label %if.then.i.i.i.i101.i

if.then.i.i.i.i101.i:                             ; preds = %if.else.i48
  %add.ptr29.i = getelementptr inbounds i32*, i32** %add.ptr.i46, i64 %add.i
  %sub.ptr.div.i.i.i.i99.i = ashr exact i64 %sub.ptr.sub.i.i.i.i.i, 3
  %idx.neg.i.i.i.i.i = sub nsw i64 0, %sub.ptr.div.i.i.i.i99.i
  %add.ptr.i.i.i.i100.i = getelementptr inbounds i32*, i32** %add.ptr29.i, i64 %idx.neg.i.i.i.i.i
  %14 = bitcast i32** %add.ptr.i.i.i.i100.i to i8*
  %15 = bitcast i32** %11 to i8*
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %14, i8* align 8 %15, i64 %sub.ptr.sub.i.i.i.i.i, i1 false) #11
  br label %.noexc

if.else31.i:                                      ; preds = %if.then.i.i.i
  %cmp.i.i = icmp eq i64 %4, 0
  %.sroa.speculated.i = select i1 %cmp.i.i, i64 1, i64 %4
  %add37.i = add i64 %4, 2
  %add38.i = add i64 %add37.i, %.sroa.speculated.i
  %cmp.i.i.i.i = icmp ugt i64 %add38.i, 2305843009213693951
  br i1 %cmp.i.i.i.i, label %if.then.i.i.i.i, label %_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm.exit.i

if.then.i.i.i.i:                                  ; preds = %if.else31.i
  invoke void @_ZSt17__throw_bad_allocv() #15
          to label %.noexc50 unwind label %lpad

.noexc50:                                         ; preds = %if.then.i.i.i.i
  unreachable

_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm.exit.i: ; preds = %if.else31.i
  %mul.i.i.i.i = shl i64 %add38.i, 3
  %call2.i.i3.i.i51 = invoke i8* @_Znwm(i64 %mul.i.i.i.i)
          to label %call2.i.i3.i.i.noexc unwind label %lpad

call2.i.i3.i.i.noexc:                             ; preds = %_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm.exit.i
  %16 = bitcast i8* %call2.i.i3.i.i51 to i32**
  %sub40.i = sub i64 %add38.i, %add4.i
  %div41.i = lshr i64 %sub40.i, 1
  %add.ptr42.i = getelementptr inbounds i32*, i32** %16, i64 %div41.i
  %17 = load i32**, i32*** %_M_node3.i, align 8, !tbaa !19
  %18 = load i32**, i32*** %_M_node.i.i.i, align 8, !tbaa !17
  %add.ptr55.i = getelementptr inbounds i32*, i32** %18, i64 1
  %sub.ptr.lhs.cast.i.i.i.i102.i = ptrtoint i32** %add.ptr55.i to i64
  %sub.ptr.rhs.cast.i.i.i.i103.i = ptrtoint i32** %17 to i64
  %sub.ptr.sub.i.i.i.i104.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i102.i, %sub.ptr.rhs.cast.i.i.i.i103.i
  %tobool.i.i.i.i106.i = icmp eq i64 %sub.ptr.sub.i.i.i.i104.i, 0
  br i1 %tobool.i.i.i.i106.i, label %_ZSt4copyIPPiS1_ET0_T_S3_S2_.exit109.i, label %if.then.i.i.i.i107.i

if.then.i.i.i.i107.i:                             ; preds = %call2.i.i3.i.i.noexc
  %19 = bitcast i32** %add.ptr42.i to i8*
  %20 = bitcast i32** %17 to i8*
  call void @llvm.memmove.p0i8.p0i8.i64(i8* nonnull align 8 %19, i8* align 8 %20, i64 %sub.ptr.sub.i.i.i.i104.i, i1 false) #11
  br label %_ZSt4copyIPPiS1_ET0_T_S3_S2_.exit109.i

_ZSt4copyIPPiS1_ET0_T_S3_S2_.exit109.i:           ; preds = %if.then.i.i.i.i107.i, %call2.i.i3.i.i.noexc
  %21 = bitcast %"class.std::deque"* %wavefront to i8**
  %22 = load i8*, i8** %21, align 8, !tbaa !18
  call void @_ZdlPv(i8* %22) #11
  store i8* %call2.i.i3.i.i51, i8** %21, align 8, !tbaa !18
  store i64 %add38.i, i64* %_M_map_size.i.i.i, align 8, !tbaa !16
  br label %.noexc

.noexc:                                           ; preds = %_ZSt4copyIPPiS1_ET0_T_S3_S2_.exit109.i, %if.then.i.i.i.i101.i, %if.else.i48, %if.then.i.i.i.i.i, %if.then14.i
  %__new_nstart.0.i = phi i32** [ %add.ptr42.i, %_ZSt4copyIPPiS1_ET0_T_S3_S2_.exit109.i ], [ %add.ptr.i46, %if.then14.i ], [ %add.ptr.i46, %if.then.i.i.i.i.i ], [ %add.ptr.i46, %if.else.i48 ], [ %add.ptr.i46, %if.then.i.i.i.i101.i ]
  store i32** %__new_nstart.0.i, i32*** %_M_node3.i, align 8, !tbaa !20
  %23 = load i32*, i32** %__new_nstart.0.i, align 8, !tbaa !21
  %_M_first.i92.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 2, i32 1
  store i32* %23, i32** %_M_first.i92.i, align 8, !tbaa !22
  %add.ptr.i93.i = getelementptr inbounds i32, i32* %23, i64 128
  %_M_last.i94.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 2, i32 2
  store i32* %add.ptr.i93.i, i32** %_M_last.i94.i, align 8, !tbaa !23
  %add.ptr71.i = getelementptr inbounds i32*, i32** %__new_nstart.0.i, i64 %sub.ptr.div.i
  store i32** %add.ptr71.i, i32*** %_M_node.i.i.i, align 8, !tbaa !20
  %24 = load i32*, i32** %add.ptr71.i, align 8, !tbaa !21
  %_M_first.i.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3, i32 1
  store i32* %24, i32** %_M_first.i.i, align 8, !tbaa !22
  %add.ptr.i.i49 = getelementptr inbounds i32, i32* %24, i64 128
  store i32* %add.ptr.i.i49, i32** %_M_last.i, align 8, !tbaa !23
  br label %_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_.exit.i

_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_.exit.i: ; preds = %.noexc, %if.else.i
  %call2.i.i.i.i.i44 = invoke i8* @_Znwm(i64 512)
          to label %call2.i.i.i.i.i.noexc unwind label %lpad

call2.i.i.i.i.i.noexc:                            ; preds = %_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_.exit.i
  %_M_finish.i.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3
  %25 = load i32**, i32*** %_M_node.i.i.i, align 8, !tbaa !17
  %add.ptr.i.i = getelementptr inbounds i32*, i32** %25, i64 1
  %26 = bitcast i32** %add.ptr.i.i to i8**
  store i8* %call2.i.i.i.i.i44, i8** %26, align 8, !tbaa !21
  %_M_cur.i.i = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish.i.i, i64 0, i32 0
  %27 = load i32*, i32** %_M_cur.i.i, align 8, !tbaa !9
  store i32 %source, i32* %27, align 4, !tbaa !2
  %28 = load i32**, i32*** %_M_node.i.i.i, align 8, !tbaa !17
  %add.ptr11.i.i = getelementptr inbounds i32*, i32** %28, i64 1
  store i32** %add.ptr11.i.i, i32*** %_M_node.i.i.i, align 8, !tbaa !20
  %29 = load i32*, i32** %add.ptr11.i.i, align 8, !tbaa !21
  %_M_first.i.i.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3, i32 1
  store i32* %29, i32** %_M_first.i.i.i, align 8, !tbaa !22
  %add.ptr.i.i.i = getelementptr inbounds i32, i32* %29, i64 128
  store i32* %add.ptr.i.i.i, i32** %_M_last.i, align 8, !tbaa !23
  %.cast.i.i = ptrtoint i32* %29 to i64
  %30 = bitcast %"struct.std::_Deque_iterator"* %_M_finish.i.i to i64*
  store i64 %.cast.i.i, i64* %30, align 8, !tbaa !9
  br label %invoke.cont

invoke.cont:                                      ; preds = %call2.i.i.i.i.i.noexc, %if.then.i
  %31 = phi i32* [ %29, %call2.i.i.i.i.i.noexc ], [ %incdec.ptr.i, %if.then.i ]
  %idxprom = sext i32 %source to i64
  %arrayidx = getelementptr inbounds i32, i32* %color, i64 %idxprom
  store i32 16677218, i32* %arrayidx, align 4, !tbaa !2
  %_M_cur1.i.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 2, i32 0
  %32 = load i32*, i32** %_M_cur1.i.i, align 8, !tbaa !24
  %cmp.i.i53178 = icmp eq i32* %31, %32
  br i1 %cmp.i.i53178, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %invoke.cont
  %_M_last.i55 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 2, i32 2
  %_M_start.i.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 2
  %_M_first.i.i59 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 2, i32 1
  %33 = bitcast i32** %_M_first.i.i59 to i8**
  %_M_node.i.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 2, i32 3
  %34 = bitcast %"struct.std::_Deque_iterator"* %_M_start.i.i to i64*
  %_M_map_size.i.i.i70 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 1
  %_M_node.i.i.i71 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3, i32 3
  %35 = bitcast i32*** %_M_node.i.i.i71 to i64*
  %36 = bitcast %"class.std::deque"* %wavefront to i64*
  %37 = bitcast %"class.std::deque"* %wavefront to i8**
  %_M_first.i.i143 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3, i32 1
  %_M_finish.i.i78 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3
  %_M_cur.i.i80 = getelementptr inbounds %"struct.std::_Deque_iterator", %"struct.std::_Deque_iterator"* %_M_finish.i.i78, i64 0, i32 0
  %38 = bitcast %"struct.std::_Deque_iterator"* %_M_finish.i.i78 to i64*
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %for.cond.cleanup
  %39 = phi i32* [ %32, %while.body.lr.ph ], [ %49, %for.cond.cleanup ]
  %40 = load i32, i32* %39, align 4, !tbaa !2
  %41 = load i32*, i32** %_M_last.i55, align 8, !tbaa !25
  %add.ptr.i56 = getelementptr inbounds i32, i32* %41, i64 -1
  %cmp.i57 = icmp eq i32* %39, %add.ptr.i56
  br i1 %cmp.i57, label %if.else.i63, label %invoke.cont.i

invoke.cont.i:                                    ; preds = %while.body
  %incdec.ptr.i58 = getelementptr inbounds i32, i32* %39, i64 1
  store i32* %incdec.ptr.i58, i32** %_M_cur1.i.i, align 8, !tbaa !26
  br label %_ZNSt5dequeIiSaIiEE9pop_frontEv.exit

if.else.i63:                                      ; preds = %while.body
  %42 = load i8*, i8** %33, align 8, !tbaa !27
  call void @_ZdlPv(i8* %42) #11
  %43 = load i32**, i32*** %_M_node.i.i, align 8, !tbaa !19
  %add.ptr.i.i60 = getelementptr inbounds i32*, i32** %43, i64 1
  store i32** %add.ptr.i.i60, i32*** %_M_node.i.i, align 8, !tbaa !20
  %44 = load i32*, i32** %add.ptr.i.i60, align 8, !tbaa !21
  store i32* %44, i32** %_M_first.i.i59, align 8, !tbaa !22
  %add.ptr.i.i.i61 = getelementptr inbounds i32, i32* %44, i64 128
  store i32* %add.ptr.i.i.i61, i32** %_M_last.i55, align 8, !tbaa !23
  %.cast.i.i62 = ptrtoint i32* %44 to i64
  store i64 %.cast.i.i62, i64* %34, align 8, !tbaa !26
  br label %_ZNSt5dequeIiSaIiEE9pop_frontEv.exit

_ZNSt5dequeIiSaIiEE9pop_frontEv.exit:             ; preds = %invoke.cont.i, %if.else.i63
  %45 = phi i32* [ %incdec.ptr.i58, %invoke.cont.i ], [ %44, %if.else.i63 ]
  %idxprom2 = sext i32 %40 to i64
  %x = getelementptr inbounds %struct.Node, %struct.Node* %h_graph_nodes, i64 %idxprom2, i32 0
  %y = getelementptr inbounds %struct.Node, %struct.Node* %h_graph_nodes, i64 %idxprom2, i32 1
  %46 = load i32, i32* %y, align 4, !tbaa !28
  %cmp176 = icmp sgt i32 %46, 0
  br i1 %cmp176, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %_ZNSt5dequeIiSaIiEE9pop_frontEv.exit
  %47 = load i32, i32* %x, align 4, !tbaa !30
  %arrayidx16 = getelementptr inbounds i32, i32* %h_cost, i64 %idxprom2
  %48 = sext i32 %47 to i64
  br label %for.body

for.cond.cleanup.loopexit:                        ; preds = %if.end
  %.pre180 = load i32*, i32** %_M_cur1.i.i, align 8, !tbaa !24
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %_ZNSt5dequeIiSaIiEE9pop_frontEv.exit
  %49 = phi i32* [ %.pre180, %for.cond.cleanup.loopexit ], [ %45, %_ZNSt5dequeIiSaIiEE9pop_frontEv.exit ]
  %arrayidx25 = getelementptr inbounds i32, i32* %color, i64 %idxprom2
  store i32 16677221, i32* %arrayidx25, align 4, !tbaa !2
  %50 = load i32*, i32** %_M_cur.i, align 8, !tbaa !24
  %cmp.i.i53 = icmp eq i32* %50, %49
  br i1 %cmp.i.i53, label %while.end, label %while.body

lpad:                                             ; preds = %_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm.exit.i, %if.then.i.i.i.i, %_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_.exit.i
  %51 = landingpad { i8*, i32 }
          cleanup
  br label %ehcleanup

for.body:                                         ; preds = %for.body.lr.ph, %if.end
  %52 = phi i32 [ %47, %for.body.lr.ph ], [ %82, %if.end ]
  %53 = phi i32 [ %46, %for.body.lr.ph ], [ %83, %if.end ]
  %indvars.iv = phi i64 [ %48, %for.body.lr.ph ], [ %indvars.iv.next, %if.end ]
  %x11 = getelementptr inbounds %struct.Edge, %struct.Edge* %h_graph_edges, i64 %indvars.iv, i32 0
  %54 = load i32, i32* %x11, align 4, !tbaa !31
  %idxprom12 = sext i32 %54 to i64
  %arrayidx13 = getelementptr inbounds i32, i32* %color, i64 %idxprom12
  %55 = load i32, i32* %arrayidx13, align 4, !tbaa !2
  %cmp14 = icmp eq i32 %55, 16677217
  br i1 %cmp14, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %56 = load i32, i32* %arrayidx16, align 4, !tbaa !2
  %add17 = add nsw i32 %56, 1
  %arrayidx19 = getelementptr inbounds i32, i32* %h_cost, i64 %idxprom12
  store i32 %add17, i32* %arrayidx19, align 4, !tbaa !2
  %57 = load i32*, i32** %_M_cur.i, align 8, !tbaa !9
  %58 = load i32*, i32** %_M_last.i, align 8, !tbaa !15
  %add.ptr.i66 = getelementptr inbounds i32, i32* %58, i64 -1
  %cmp.i67 = icmp eq i32* %57, %add.ptr.i66
  br i1 %cmp.i67, label %if.else.i76, label %if.then.i69

if.then.i69:                                      ; preds = %if.then
  store i32 %54, i32* %57, align 4, !tbaa !2
  %incdec.ptr.i68 = getelementptr inbounds i32, i32* %57, i64 1
  store i32* %incdec.ptr.i68, i32** %_M_cur.i, align 8, !tbaa !9
  br label %invoke.cont21

if.else.i76:                                      ; preds = %if.then
  %59 = load i64, i64* %_M_map_size.i.i.i70, align 8, !tbaa !16
  %60 = load i64, i64* %35, align 8, !tbaa !17
  %61 = load i64, i64* %36, align 8, !tbaa !18
  %sub.ptr.sub.i.i.i72 = sub i64 %60, %61
  %sub.ptr.div.i.i.i73 = ashr exact i64 %sub.ptr.sub.i.i.i72, 3
  %sub.i.i.i74 = sub i64 %59, %sub.ptr.div.i.i.i73
  %cmp.i.i.i75 = icmp ult i64 %sub.i.i.i74, 2
  %62 = inttoptr i64 %60 to i32**
  %63 = inttoptr i64 %61 to i32**
  br i1 %cmp.i.i.i75, label %if.then.i.i.i77, label %_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_.exit.i85

if.then.i.i.i77:                                  ; preds = %if.else.i76
  %64 = load i32**, i32*** %_M_node.i.i, align 8, !tbaa !19
  %sub.ptr.rhs.cast.i93 = ptrtoint i32** %64 to i64
  %sub.ptr.sub.i94 = sub i64 %60, %sub.ptr.rhs.cast.i93
  %sub.ptr.div.i95 = ashr exact i64 %sub.ptr.sub.i94, 3
  %add.i96 = add nsw i64 %sub.ptr.div.i95, 1
  %add4.i97 = add nsw i64 %sub.ptr.div.i95, 2
  %mul.i99 = shl nsw i64 %add4.i97, 1
  %cmp.i100 = icmp ugt i64 %59, %mul.i99
  br i1 %cmp.i100, label %if.then.i110, label %if.else31.i124

if.then.i110:                                     ; preds = %if.then.i.i.i77
  %sub.i102 = sub i64 %59, %add4.i97
  %div.i103 = lshr i64 %sub.i102, 1
  %add.ptr.i104 = getelementptr inbounds i32*, i32** %63, i64 %div.i103
  %cmp13.i105 = icmp ult i32** %add.ptr.i104, %64
  %add.ptr21.i106 = getelementptr inbounds i32*, i32** %62, i64 1
  %sub.ptr.lhs.cast.i.i.i.i.i107 = ptrtoint i32** %add.ptr21.i106 to i64
  %sub.ptr.sub.i.i.i.i.i108 = sub i64 %sub.ptr.lhs.cast.i.i.i.i.i107, %sub.ptr.rhs.cast.i93
  %tobool.i.i.i.i.i109 = icmp eq i64 %sub.ptr.sub.i.i.i.i.i108, 0
  br i1 %cmp13.i105, label %if.then14.i111, label %if.else.i113

if.then14.i111:                                   ; preds = %if.then.i110
  br i1 %tobool.i.i.i.i.i109, label %.noexc86, label %if.then.i.i.i.i.i112

if.then.i.i.i.i.i112:                             ; preds = %if.then14.i111
  %65 = bitcast i32** %add.ptr.i104 to i8*
  %66 = bitcast i32** %64 to i8*
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %65, i8* align 8 %66, i64 %sub.ptr.sub.i.i.i.i.i108, i1 false) #11
  br label %.noexc86

if.else.i113:                                     ; preds = %if.then.i110
  br i1 %tobool.i.i.i.i.i109, label %.noexc86, label %if.then.i.i.i.i101.i118

if.then.i.i.i.i101.i118:                          ; preds = %if.else.i113
  %add.ptr29.i114 = getelementptr inbounds i32*, i32** %add.ptr.i104, i64 %add.i96
  %sub.ptr.div.i.i.i.i99.i115 = ashr exact i64 %sub.ptr.sub.i.i.i.i.i108, 3
  %idx.neg.i.i.i.i.i116 = sub nsw i64 0, %sub.ptr.div.i.i.i.i99.i115
  %add.ptr.i.i.i.i100.i117 = getelementptr inbounds i32*, i32** %add.ptr29.i114, i64 %idx.neg.i.i.i.i.i116
  %67 = bitcast i32** %add.ptr.i.i.i.i100.i117 to i8*
  %68 = bitcast i32** %64 to i8*
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %67, i8* align 8 %68, i64 %sub.ptr.sub.i.i.i.i.i108, i1 false) #11
  br label %.noexc86

if.else31.i124:                                   ; preds = %if.then.i.i.i77
  %cmp.i.i119 = icmp eq i64 %59, 0
  %.sroa.speculated.i120 = select i1 %cmp.i.i119, i64 1, i64 %59
  %add37.i121 = add i64 %59, 2
  %add38.i122 = add i64 %add37.i121, %.sroa.speculated.i120
  %cmp.i.i.i.i123 = icmp ugt i64 %add38.i122, 2305843009213693951
  br i1 %cmp.i.i.i.i123, label %if.then.i.i.i.i125, label %_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm.exit.i135

if.then.i.i.i.i125:                               ; preds = %if.else31.i124
  invoke void @_ZSt17__throw_bad_allocv() #15
          to label %.noexc146 unwind label %lpad20.loopexit.split-lp

.noexc146:                                        ; preds = %if.then.i.i.i.i125
  unreachable

_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm.exit.i135: ; preds = %if.else31.i124
  %mul.i.i.i.i126 = shl i64 %add38.i122, 3
  %call2.i.i3.i.i148 = invoke i8* @_Znwm(i64 %mul.i.i.i.i126)
          to label %call2.i.i3.i.i.noexc147 unwind label %lpad20.loopexit

call2.i.i3.i.i.noexc147:                          ; preds = %_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm.exit.i135
  %69 = bitcast i8* %call2.i.i3.i.i148 to i32**
  %sub40.i127 = sub i64 %add38.i122, %add4.i97
  %div41.i128 = lshr i64 %sub40.i127, 1
  %add.ptr42.i129 = getelementptr inbounds i32*, i32** %69, i64 %div41.i128
  %70 = load i32**, i32*** %_M_node.i.i, align 8, !tbaa !19
  %71 = load i32**, i32*** %_M_node.i.i.i71, align 8, !tbaa !17
  %add.ptr55.i130 = getelementptr inbounds i32*, i32** %71, i64 1
  %sub.ptr.lhs.cast.i.i.i.i102.i131 = ptrtoint i32** %add.ptr55.i130 to i64
  %sub.ptr.rhs.cast.i.i.i.i103.i132 = ptrtoint i32** %70 to i64
  %sub.ptr.sub.i.i.i.i104.i133 = sub i64 %sub.ptr.lhs.cast.i.i.i.i102.i131, %sub.ptr.rhs.cast.i.i.i.i103.i132
  %tobool.i.i.i.i106.i134 = icmp eq i64 %sub.ptr.sub.i.i.i.i104.i133, 0
  br i1 %tobool.i.i.i.i106.i134, label %_ZSt4copyIPPiS1_ET0_T_S3_S2_.exit109.i137, label %if.then.i.i.i.i107.i136

if.then.i.i.i.i107.i136:                          ; preds = %call2.i.i3.i.i.noexc147
  %72 = bitcast i32** %add.ptr42.i129 to i8*
  %73 = bitcast i32** %70 to i8*
  call void @llvm.memmove.p0i8.p0i8.i64(i8* nonnull align 8 %72, i8* align 8 %73, i64 %sub.ptr.sub.i.i.i.i104.i133, i1 false) #11
  br label %_ZSt4copyIPPiS1_ET0_T_S3_S2_.exit109.i137

_ZSt4copyIPPiS1_ET0_T_S3_S2_.exit109.i137:        ; preds = %if.then.i.i.i.i107.i136, %call2.i.i3.i.i.noexc147
  %74 = load i8*, i8** %37, align 8, !tbaa !18
  call void @_ZdlPv(i8* %74) #11
  store i8* %call2.i.i3.i.i148, i8** %37, align 8, !tbaa !18
  store i64 %add38.i122, i64* %_M_map_size.i.i.i70, align 8, !tbaa !16
  br label %.noexc86

.noexc86:                                         ; preds = %_ZSt4copyIPPiS1_ET0_T_S3_S2_.exit109.i137, %if.then.i.i.i.i101.i118, %if.else.i113, %if.then.i.i.i.i.i112, %if.then14.i111
  %__new_nstart.0.i138 = phi i32** [ %add.ptr42.i129, %_ZSt4copyIPPiS1_ET0_T_S3_S2_.exit109.i137 ], [ %add.ptr.i104, %if.then14.i111 ], [ %add.ptr.i104, %if.then.i.i.i.i.i112 ], [ %add.ptr.i104, %if.else.i113 ], [ %add.ptr.i104, %if.then.i.i.i.i101.i118 ]
  store i32** %__new_nstart.0.i138, i32*** %_M_node.i.i, align 8, !tbaa !20
  %75 = load i32*, i32** %__new_nstart.0.i138, align 8, !tbaa !21
  store i32* %75, i32** %_M_first.i.i59, align 8, !tbaa !22
  %add.ptr.i93.i140 = getelementptr inbounds i32, i32* %75, i64 128
  store i32* %add.ptr.i93.i140, i32** %_M_last.i55, align 8, !tbaa !23
  %add.ptr71.i142 = getelementptr inbounds i32*, i32** %__new_nstart.0.i138, i64 %sub.ptr.div.i95
  store i32** %add.ptr71.i142, i32*** %_M_node.i.i.i71, align 8, !tbaa !20
  %76 = load i32*, i32** %add.ptr71.i142, align 8, !tbaa !21
  store i32* %76, i32** %_M_first.i.i143, align 8, !tbaa !22
  %add.ptr.i.i144 = getelementptr inbounds i32, i32* %76, i64 128
  store i32* %add.ptr.i.i144, i32** %_M_last.i, align 8, !tbaa !23
  br label %_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_.exit.i85

_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_.exit.i85: ; preds = %.noexc86, %if.else.i76
  %call2.i.i.i.i.i88 = invoke i8* @_Znwm(i64 512)
          to label %call2.i.i.i.i.i.noexc87 unwind label %lpad20.loopexit

call2.i.i.i.i.i.noexc87:                          ; preds = %_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_.exit.i85
  %77 = load i32**, i32*** %_M_node.i.i.i71, align 8, !tbaa !17
  %add.ptr.i.i79 = getelementptr inbounds i32*, i32** %77, i64 1
  %78 = bitcast i32** %add.ptr.i.i79 to i8**
  store i8* %call2.i.i.i.i.i88, i8** %78, align 8, !tbaa !21
  %79 = load i32*, i32** %_M_cur.i.i80, align 8, !tbaa !9
  store i32 %54, i32* %79, align 4, !tbaa !2
  %80 = load i32**, i32*** %_M_node.i.i.i71, align 8, !tbaa !17
  %add.ptr11.i.i81 = getelementptr inbounds i32*, i32** %80, i64 1
  store i32** %add.ptr11.i.i81, i32*** %_M_node.i.i.i71, align 8, !tbaa !20
  %81 = load i32*, i32** %add.ptr11.i.i81, align 8, !tbaa !21
  store i32* %81, i32** %_M_first.i.i143, align 8, !tbaa !22
  %add.ptr.i.i.i83 = getelementptr inbounds i32, i32* %81, i64 128
  store i32* %add.ptr.i.i.i83, i32** %_M_last.i, align 8, !tbaa !23
  %.cast.i.i84 = ptrtoint i32* %81 to i64
  store i64 %.cast.i.i84, i64* %38, align 8, !tbaa !9
  br label %invoke.cont21

invoke.cont21:                                    ; preds = %call2.i.i.i.i.i.noexc87, %if.then.i69
  store i32 16677218, i32* %arrayidx13, align 4, !tbaa !2
  %.pre = load i32, i32* %y, align 4, !tbaa !28
  %.pre179 = load i32, i32* %x, align 4, !tbaa !30
  br label %if.end

lpad20.loopexit:                                  ; preds = %_ZNSt5dequeIiSaIiEE16_M_push_back_auxIJRKiEEEvDpOT_.exit.i85, %_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm.exit.i135
  %lpad.loopexit = landingpad { i8*, i32 }
          cleanup
  br label %ehcleanup

lpad20.loopexit.split-lp:                         ; preds = %if.then.i.i.i.i125
  %lpad.loopexit.split-lp = landingpad { i8*, i32 }
          cleanup
  br label %ehcleanup

if.end:                                           ; preds = %invoke.cont21, %for.body
  %82 = phi i32 [ %.pre179, %invoke.cont21 ], [ %52, %for.body ]
  %83 = phi i32 [ %.pre, %invoke.cont21 ], [ %53, %for.body ]
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %add = add nsw i32 %82, %83
  %84 = sext i32 %add to i64
  %cmp = icmp slt i64 %indvars.iv.next, %84
  br i1 %cmp, label %for.body, label %for.cond.cleanup.loopexit

while.end:                                        ; preds = %for.cond.cleanup, %invoke.cont
  %_M_map.i.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 0
  %85 = load i32**, i32*** %_M_map.i.i, align 8, !tbaa !18
  %tobool.i.i = icmp eq i32** %85, null
  br i1 %tobool.i.i, label %_ZNSt5dequeIiSaIiEED2Ev.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %while.end
  %86 = bitcast i32** %85 to i8*
  %_M_node.i.i150 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 2, i32 3
  %87 = load i32**, i32*** %_M_node.i.i150, align 8, !tbaa !19
  %_M_node4.i.i = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3, i32 3
  %88 = load i32**, i32*** %_M_node4.i.i, align 8, !tbaa !17
  %add.ptr.i.i151 = getelementptr inbounds i32*, i32** %88, i64 1
  %cmp5.i.i.i = icmp ult i32** %87, %add.ptr.i.i151
  br i1 %cmp5.i.i.i, label %for.body.i.i.i, label %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.i.i

for.body.i.i.i:                                   ; preds = %if.then.i.i, %for.body.i.i.i
  %__n.06.i.i.i = phi i32** [ %incdec.ptr.i.i.i, %for.body.i.i.i ], [ %87, %if.then.i.i ]
  %89 = bitcast i32** %__n.06.i.i.i to i8**
  %90 = load i8*, i8** %89, align 8, !tbaa !21
  call void @_ZdlPv(i8* %90) #11
  %incdec.ptr.i.i.i = getelementptr inbounds i32*, i32** %__n.06.i.i.i, i64 1
  %cmp.i.i.i152 = icmp ult i32** %__n.06.i.i.i, %88
  br i1 %cmp.i.i.i152, label %for.body.i.i.i, label %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.loopexit.i.i

_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.loopexit.i.i: ; preds = %for.body.i.i.i
  %.phi.trans.insert.i.i = bitcast %"class.std::deque"* %wavefront to i8**
  %.pre.i.i = load i8*, i8** %.phi.trans.insert.i.i, align 8, !tbaa !18
  br label %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.i.i

_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.i.i: ; preds = %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.loopexit.i.i, %if.then.i.i
  %91 = phi i8* [ %.pre.i.i, %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.loopexit.i.i ], [ %86, %if.then.i.i ]
  call void @_ZdlPv(i8* %91) #11
  br label %_ZNSt5dequeIiSaIiEED2Ev.exit

_ZNSt5dequeIiSaIiEED2Ev.exit:                     ; preds = %while.end, %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.i.i
  call void @llvm.lifetime.end.p0i8(i64 80, i8* nonnull %0) #11
  ret void

ehcleanup:                                        ; preds = %lpad20.loopexit, %lpad20.loopexit.split-lp, %lpad
  %lpad.phi.sink181 = phi { i8*, i32 } [ %51, %lpad ], [ %lpad.loopexit, %lpad20.loopexit ], [ %lpad.loopexit.split-lp, %lpad20.loopexit.split-lp ]
  %_M_map.i.i153 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 0
  %92 = load i32**, i32*** %_M_map.i.i153, align 8, !tbaa !18
  %tobool.i.i154 = icmp eq i32** %92, null
  br i1 %tobool.i.i154, label %_ZNSt5dequeIiSaIiEED2Ev.exit168, label %if.then.i.i159

if.then.i.i159:                                   ; preds = %ehcleanup
  %93 = bitcast i32** %92 to i8*
  %_M_node.i.i155 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 2, i32 3
  %94 = load i32**, i32*** %_M_node.i.i155, align 8, !tbaa !19
  %_M_node4.i.i156 = getelementptr inbounds %"class.std::deque", %"class.std::deque"* %wavefront, i64 0, i32 0, i32 0, i32 3, i32 3
  %95 = load i32**, i32*** %_M_node4.i.i156, align 8, !tbaa !17
  %add.ptr.i.i157 = getelementptr inbounds i32*, i32** %95, i64 1
  %cmp5.i.i.i158 = icmp ult i32** %94, %add.ptr.i.i157
  br i1 %cmp5.i.i.i158, label %for.body.i.i.i163, label %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.i.i167

for.body.i.i.i163:                                ; preds = %if.then.i.i159, %for.body.i.i.i163
  %__n.06.i.i.i160 = phi i32** [ %incdec.ptr.i.i.i161, %for.body.i.i.i163 ], [ %94, %if.then.i.i159 ]
  %96 = bitcast i32** %__n.06.i.i.i160 to i8**
  %97 = load i8*, i8** %96, align 8, !tbaa !21
  call void @_ZdlPv(i8* %97) #11
  %incdec.ptr.i.i.i161 = getelementptr inbounds i32*, i32** %__n.06.i.i.i160, i64 1
  %cmp.i.i.i162 = icmp ult i32** %__n.06.i.i.i160, %95
  br i1 %cmp.i.i.i162, label %for.body.i.i.i163, label %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.loopexit.i.i166

_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.loopexit.i.i166: ; preds = %for.body.i.i.i163
  %.phi.trans.insert.i.i164 = bitcast %"class.std::deque"* %wavefront to i8**
  %.pre.i.i165 = load i8*, i8** %.phi.trans.insert.i.i164, align 8, !tbaa !18
  br label %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.i.i167

_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.i.i167: ; preds = %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.loopexit.i.i166, %if.then.i.i159
  %98 = phi i8* [ %.pre.i.i165, %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.loopexit.i.i166 ], [ %93, %if.then.i.i159 ]
  call void @_ZdlPv(i8* %98) #11
  br label %_ZNSt5dequeIiSaIiEED2Ev.exit168

_ZNSt5dequeIiSaIiEED2Ev.exit168:                  ; preds = %ehcleanup, %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.i.i167
  call void @llvm.lifetime.end.p0i8(i64 80, i8* nonnull %0) #11
  resume { i8*, i32 } %lpad.phi.sink181
}

; Function Attrs: norecurse uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #5 {
entry:
  store i32 0, i32* @no_of_nodes, align 4, !tbaa !2
  store i32 0, i32* @edge_list_size, align 4, !tbaa !2
  tail call void @_Z6runCPUiPPc(i32 %argc, i8** %argv)
  ret i32 0
}

; Function Attrs: uwtable
define dso_local void @_Z6runCPUiPPc(i32 %argc, i8** %argv) local_unnamed_addr #4 {
entry:
  %argc.addr = alloca i32, align 4
  %timers = alloca %struct.pb_TimerSet, align 8
  %source = alloca i32, align 4
  %h_graph_nodes = alloca %struct.Node*, align 8
  %color = alloca i32*, align 8
  %start = alloca i32, align 4
  %edgeno = alloca i32, align 4
  %id = alloca i32, align 4
  %cost = alloca i32, align 4
  %h_graph_edges = alloca %struct.Edge*, align 8
  %h_cost = alloca i32*, align 8
  store i32 %argc, i32* %argc.addr, align 4, !tbaa !2
  %0 = bitcast %struct.pb_TimerSet* %timers to i8*
  call void @llvm.lifetime.start.p0i8(i64 288, i8* nonnull %0) #11
  call void @pb_InitializeTimerSet(%struct.pb_TimerSet* nonnull %timers)
  %call = call %struct.pb_Parameters* @pb_ReadParameters(i32* nonnull %argc.addr, i8** %argv)
  %inpFiles = getelementptr inbounds %struct.pb_Parameters, %struct.pb_Parameters* %call, i64 0, i32 1
  %1 = load i8**, i8*** %inpFiles, align 8, !tbaa !33
  %2 = load i8*, i8** %1, align 8, !tbaa !21
  %cmp = icmp eq i8* %2, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %arrayidx2 = getelementptr inbounds i8*, i8** %1, i64 1
  %3 = load i8*, i8** %arrayidx2, align 8, !tbaa !21
  %cmp3 = icmp eq i8* %3, null
  br i1 %cmp3, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !21
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.1, i64 0, i64 0), i64 29, i64 1, %struct._IO_FILE* %4) #16
  call void @exit(i32 -1) #17
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  call void @pb_SwitchToTimer(%struct.pb_TimerSet* nonnull %timers, i32 1)
  %6 = load i8**, i8*** %inpFiles, align 8, !tbaa !33
  %7 = load i8*, i8** %6, align 8, !tbaa !21
  %call7 = call %struct._IO_FILE* @fopen(i8* %7, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0))
  store %struct._IO_FILE* %call7, %struct._IO_FILE** @fp, align 8, !tbaa !21
  %tobool = icmp eq %struct._IO_FILE* %call7, null
  br i1 %tobool, label %if.then8, label %if.end10

if.then8:                                         ; preds = %if.end
  %puts = call i32 @puts(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @str, i64 0, i64 0))
  br label %cleanup

if.end10:                                         ; preds = %if.end
  %8 = bitcast i32* %source to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %8) #11
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* nonnull %call7, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i32* nonnull @no_of_nodes)
  %9 = bitcast %struct.Node** %h_graph_nodes to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %9) #11
  %10 = load i32, i32* @no_of_nodes, align 4, !tbaa !2
  %conv = sext i32 %10 to i64
  %mul = shl nsw i64 %conv, 3
  %call12 = call noalias i8* @malloc(i64 %mul) #11
  %11 = bitcast %struct.Node** %h_graph_nodes to i8**
  store i8* %call12, i8** %11, align 8, !tbaa !21
  %12 = bitcast i32** %color to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %12) #11
  %mul14 = shl nsw i64 %conv, 2
  %call15 = call noalias i8* @malloc(i64 %mul14) #11
  %13 = bitcast i32** %color to i8**
  store i8* %call15, i8** %13, align 8, !tbaa !21
  %14 = bitcast i32* %start to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %14) #11
  %15 = bitcast i32* %edgeno to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %15) #11
  %cmp16118 = icmp eq i32 %10, 0
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !tbaa !21
  br i1 %cmp16118, label %for.cond.cleanup, label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %if.end10
  %.lcssa110 = phi %struct._IO_FILE* [ %16, %if.end10 ], [ %31, %for.body ]
  %call23 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %.lcssa110, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i32* nonnull %source)
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !tbaa !21
  %call24 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i32* nonnull @edge_list_size)
  %18 = bitcast i32* %id to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %18) #11
  %19 = bitcast i32* %cost to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %19) #11
  %20 = bitcast %struct.Edge** %h_graph_edges to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %20) #11
  %21 = load i32, i32* @edge_list_size, align 4, !tbaa !2
  %conv25 = sext i32 %21 to i64
  %mul26 = shl nsw i64 %conv25, 3
  %call27 = call noalias i8* @malloc(i64 %mul26) #11
  %22 = bitcast %struct.Edge** %h_graph_edges to i8**
  store i8* %call27, i8** %22, align 8, !tbaa !21
  %cmp30115 = icmp sgt i32 %21, 0
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !tbaa !21
  br i1 %cmp30115, label %for.body32, label %for.cond.cleanup31

for.body:                                         ; preds = %if.end10, %for.body
  %indvars.iv127 = phi i64 [ %indvars.iv.next128, %for.body ], [ 0, %if.end10 ]
  %24 = phi %struct._IO_FILE* [ %31, %for.body ], [ %16, %if.end10 ]
  %call17 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i64 0, i64 0), i32* nonnull %start, i32* nonnull %edgeno)
  %25 = load i32, i32* %start, align 4, !tbaa !2
  %26 = load %struct.Node*, %struct.Node** %h_graph_nodes, align 8, !tbaa !21
  %x = getelementptr inbounds %struct.Node, %struct.Node* %26, i64 %indvars.iv127, i32 0
  store i32 %25, i32* %x, align 4, !tbaa !30
  %27 = load i32, i32* %edgeno, align 4, !tbaa !2
  %y = getelementptr inbounds %struct.Node, %struct.Node* %26, i64 %indvars.iv127, i32 1
  store i32 %27, i32* %y, align 4, !tbaa !28
  %28 = load i32*, i32** %color, align 8, !tbaa !21
  %arrayidx22 = getelementptr inbounds i32, i32* %28, i64 %indvars.iv127
  store i32 16677217, i32* %arrayidx22, align 4, !tbaa !2
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  %29 = load i32, i32* @no_of_nodes, align 4, !tbaa !2
  %30 = zext i32 %29 to i64
  %cmp16 = icmp ult i64 %indvars.iv.next128, %30
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !tbaa !21
  br i1 %cmp16, label %for.body, label %for.cond.cleanup

for.cond.cleanup31:                               ; preds = %for.body32, %for.cond.cleanup
  %.lcssa109 = phi %struct._IO_FILE* [ %23, %for.cond.cleanup ], [ %39, %for.body32 ]
  %tobool44 = icmp eq %struct._IO_FILE* %.lcssa109, null
  br i1 %tobool44, label %if.end47, label %if.then45

for.body32:                                       ; preds = %for.cond.cleanup, %for.body32
  %indvars.iv125 = phi i64 [ %indvars.iv.next126, %for.body32 ], [ 0, %for.cond.cleanup ]
  %32 = phi %struct._IO_FILE* [ %39, %for.body32 ], [ %23, %for.cond.cleanup ]
  %call33 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i32* nonnull %id)
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !tbaa !21
  %call34 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i32* nonnull %cost)
  %34 = load i32, i32* %id, align 4, !tbaa !2
  %35 = load %struct.Edge*, %struct.Edge** %h_graph_edges, align 8, !tbaa !21
  %x37 = getelementptr inbounds %struct.Edge, %struct.Edge* %35, i64 %indvars.iv125, i32 0
  store i32 %34, i32* %x37, align 4, !tbaa !31
  %36 = load i32, i32* %cost, align 4, !tbaa !2
  %y40 = getelementptr inbounds %struct.Edge, %struct.Edge* %35, i64 %indvars.iv125, i32 1
  store i32 %36, i32* %y40, align 4, !tbaa !35
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  %37 = load i32, i32* @edge_list_size, align 4, !tbaa !2
  %38 = sext i32 %37 to i64
  %cmp30 = icmp slt i64 %indvars.iv.next126, %38
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !tbaa !21
  br i1 %cmp30, label %for.body32, label %for.cond.cleanup31

if.then45:                                        ; preds = %for.cond.cleanup31
  %call46 = call i32 @fclose(%struct._IO_FILE* nonnull %.lcssa109)
  br label %if.end47

if.end47:                                         ; preds = %for.cond.cleanup31, %if.then45
  %40 = bitcast i32** %h_cost to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %40) #11
  %41 = load i32, i32* @no_of_nodes, align 4, !tbaa !2
  %conv48 = sext i32 %41 to i64
  %mul49 = shl nsw i64 %conv48, 2
  %call50 = call noalias i8* @malloc(i64 %mul49) #11
  %42 = bitcast i32** %h_cost to i8**
  store i8* %call50, i8** %42, align 8, !tbaa !21
  %cmp53113 = icmp sgt i32 %41, 0
  %.cast = bitcast i8* %call50 to i32*
  br i1 %cmp53113, label %for.body55, label %for.cond.cleanup54

for.cond.cleanup54:                               ; preds = %for.body55, %if.end47
  %43 = load i32, i32* %source, align 4, !tbaa !2
  %idxprom61 = sext i32 %43 to i64
  %arrayidx62 = getelementptr inbounds i32, i32* %.cast, i64 %idxprom61
  store i32 0, i32* %arrayidx62, align 4, !tbaa !2
  call void @pb_SwitchToTimer(%struct.pb_TimerSet* nonnull %timers, i32 6)
  call void @omp_set_dynamic(i32 0)
  call void @omp_set_num_threads(i32 1)
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%struct.ident_t* nonnull @1, i32 5, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, %struct.Node**, %struct.Edge**, i32**, i32**, i32*)* @.omp_outlined. to void (i32*, i32*, ...)*), %struct.Node** nonnull %h_graph_nodes, %struct.Edge** nonnull %h_graph_edges, i32** nonnull %color, i32** nonnull %h_cost, i32* nonnull %source)
  call void @pb_SwitchToTimer(%struct.pb_TimerSet* nonnull %timers, i32 1)
  %outFile = getelementptr inbounds %struct.pb_Parameters, %struct.pb_Parameters* %call, i64 0, i32 0
  %44 = load i8*, i8** %outFile, align 8, !tbaa !36
  %cmp63 = icmp eq i8* %44, null
  br i1 %cmp63, label %if.end80, label %if.then64

for.body55:                                       ; preds = %if.end47, %for.body55
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %for.body55 ], [ 0, %if.end47 ]
  %arrayidx57 = getelementptr inbounds i32, i32* %.cast, i64 %indvars.iv123
  store i32 2147483647, i32* %arrayidx57, align 4, !tbaa !2
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %cmp53 = icmp slt i64 %indvars.iv.next124, %conv48
  br i1 %cmp53, label %for.body55, label %for.cond.cleanup54

if.then64:                                        ; preds = %for.cond.cleanup54
  %call66 = call %struct._IO_FILE* @fopen(i8* nonnull %44, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i64 0, i64 0))
  %45 = load i32, i32* @no_of_nodes, align 4, !tbaa !2
  %call67 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %call66, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i64 0, i64 0), i32 %45)
  %46 = load i32, i32* @no_of_nodes, align 4, !tbaa !2
  %cmp70111 = icmp sgt i32 %46, 0
  br i1 %cmp70111, label %for.body72, label %for.cond.cleanup71

for.cond.cleanup71:                               ; preds = %for.body72, %if.then64
  %call79 = call i32 @fclose(%struct._IO_FILE* %call66)
  br label %if.end80

for.body72:                                       ; preds = %if.then64, %for.body72
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body72 ], [ 0, %if.then64 ]
  %47 = load i32*, i32** %h_cost, align 8, !tbaa !21
  %arrayidx74 = getelementptr inbounds i32, i32* %47, i64 %indvars.iv
  %48 = load i32, i32* %arrayidx74, align 4, !tbaa !2
  %49 = trunc i64 %indvars.iv to i32
  %call75 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %call66, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i64 0, i64 0), i32 %49, i32 %48)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %50 = load i32, i32* @no_of_nodes, align 4, !tbaa !2
  %51 = sext i32 %50 to i64
  %cmp70 = icmp slt i64 %indvars.iv.next, %51
  br i1 %cmp70, label %for.body72, label %for.cond.cleanup71

if.end80:                                         ; preds = %for.cond.cleanup54, %for.cond.cleanup71
  call void @pb_SwitchToTimer(%struct.pb_TimerSet* nonnull %timers, i32 6)
  %52 = load i8*, i8** %11, align 8, !tbaa !21
  call void @free(i8* %52) #11
  %53 = load i8*, i8** %22, align 8, !tbaa !21
  call void @free(i8* %53) #11
  %54 = load i8*, i8** %13, align 8, !tbaa !21
  call void @free(i8* %54) #11
  %55 = load i8*, i8** %42, align 8, !tbaa !21
  call void @free(i8* %55) #11
  call void @pb_SwitchToTimer(%struct.pb_TimerSet* nonnull %timers, i32 0)
  call void @pb_PrintTimerSet(%struct.pb_TimerSet* nonnull %timers)
  call void @pb_FreeParameters(%struct.pb_Parameters* %call)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %40) #11
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %20) #11
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %19) #11
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %18) #11
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %15) #11
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %14) #11
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %12) #11
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %9) #11
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %8) #11
  br label %cleanup

cleanup:                                          ; preds = %if.end80, %if.then8
  call void @llvm.lifetime.end.p0i8(i64 288, i8* nonnull %0) #11
  ret void
}

declare dso_local void @pb_InitializeTimerSet(%struct.pb_TimerSet*) local_unnamed_addr #6

declare dso_local %struct.pb_Parameters* @pb_ReadParameters(i32*, i8**) local_unnamed_addr #6

; Function Attrs: nounwind
declare dso_local i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #7

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) local_unnamed_addr #8

declare dso_local void @pb_SwitchToTimer(%struct.pb_TimerSet*, i32) local_unnamed_addr #6

; Function Attrs: nounwind
declare dso_local noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #7

; Function Attrs: nounwind
declare dso_local i32 @fscanf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #7

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) local_unnamed_addr #7

; Function Attrs: nounwind
declare dso_local i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #7

declare dso_local void @omp_set_dynamic(i32) local_unnamed_addr #6

declare dso_local void @omp_set_num_threads(i32) local_unnamed_addr #6

; Function Attrs: norecurse nounwind uwtable
define internal void @.omp_outlined.(i32* noalias nocapture readnone %.global_tid., i32* noalias nocapture readnone %.bound_tid., %struct.Node** nocapture readonly dereferenceable(8) %h_graph_nodes, %struct.Edge** nocapture readonly dereferenceable(8) %h_graph_edges, i32** nocapture readonly dereferenceable(8) %color, i32** nocapture readonly dereferenceable(8) %h_cost, i32* nocapture readonly dereferenceable(4) %source) #9 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %call = invoke i32 @omp_get_thread_num()
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %0 = load %struct.Node*, %struct.Node** %h_graph_nodes, align 8, !tbaa !21
  %1 = load %struct.Edge*, %struct.Edge** %h_graph_edges, align 8, !tbaa !21
  %2 = load i32*, i32** %color, align 8, !tbaa !21
  %3 = load i32*, i32** %h_cost, align 8, !tbaa !21
  %4 = load i32, i32* %source, align 4, !tbaa !2
  invoke void @_Z15_kernel_computeP4NodeP4EdgePiS3_iii(%struct.Node* %0, %struct.Edge* %1, i32* %2, i32* %3, i32 %4, i32 undef, i32 undef)
          to label %invoke.cont1 unwind label %lpad

invoke.cont1:                                     ; preds = %invoke.cont
  ret void

lpad:                                             ; preds = %invoke.cont, %entry
  %5 = landingpad { i8*, i32 }
          catch i8* null
  %6 = extractvalue { i8*, i32 } %5, 0
  tail call void @__clang_call_terminate(i8* %6) #17
  unreachable
}

declare dso_local i32 @omp_get_thread_num() local_unnamed_addr #6

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8*) local_unnamed_addr #10 comdat {
  %2 = tail call i8* @__cxa_begin_catch(i8* %0) #11
  tail call void @_ZSt9terminatev() #17
  unreachable
}

declare dso_local i8* @__cxa_begin_catch(i8*) local_unnamed_addr

declare dso_local void @_ZSt9terminatev() local_unnamed_addr

declare !callback !37 dso_local void @__kmpc_fork_call(%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) local_unnamed_addr

; Function Attrs: nounwind
declare dso_local void @free(i8* nocapture) local_unnamed_addr #7

declare dso_local void @pb_PrintTimerSet(%struct.pb_TimerSet*) local_unnamed_addr #6

declare dso_local void @pb_FreeParameters(%struct.pb_Parameters*) local_unnamed_addr #6

declare dso_local void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #6

; Function Attrs: nounwind
declare dso_local void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #7

; Function Attrs: nounwind
declare dso_local i32 @__cxa_atexit(void (i8*)*, i8*, i8*) local_unnamed_addr #11

; Function Attrs: uwtable
define linkonce_odr dso_local void @_ZNSt11_Deque_baseIiSaIiEE17_M_initialize_mapEm(%"class.std::_Deque_base"* %this, i64 %__num_elements) local_unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %div = lshr i64 %__num_elements, 7
  %add = add nuw nsw i64 %div, 1
  %0 = icmp ugt i64 %div, 5
  %1 = select i1 %0, i64 %div, i64 5
  %.sroa.speculated = add nuw nsw i64 %1, 3
  %_M_map_size = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i64 0, i32 0, i32 1
  store i64 %.sroa.speculated, i64* %_M_map_size, align 8, !tbaa !16
  %cmp.i.i.i = icmp ugt i64 %.sroa.speculated, 2305843009213693951
  br i1 %cmp.i.i.i, label %if.then.i.i.i, label %_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm.exit

if.then.i.i.i:                                    ; preds = %entry
  tail call void @_ZSt17__throw_bad_allocv() #15
  unreachable

_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm.exit: ; preds = %entry
  %mul.i.i.i = shl nuw nsw i64 %.sroa.speculated, 3
  %call2.i.i3.i = tail call i8* @_Znwm(i64 %mul.i.i.i)
  %2 = bitcast i8* %call2.i.i3.i to i32**
  %3 = bitcast %"class.std::_Deque_base"* %this to i8**
  store i8* %call2.i.i3.i, i8** %3, align 8, !tbaa !18
  %4 = load i64, i64* %_M_map_size, align 8, !tbaa !16
  %sub = sub i64 %4, %add
  %div13 = lshr i64 %sub, 1
  %add.ptr = getelementptr inbounds i32*, i32** %2, i64 %div13
  %add.ptr14 = getelementptr inbounds i32*, i32** %add.ptr, i64 %add
  br label %for.body.i

for.body.i:                                       ; preds = %_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm.exit, %invoke.cont.i
  %__cur.015.i = phi i32** [ %incdec.ptr.i, %invoke.cont.i ], [ %add.ptr, %_ZNSt11_Deque_baseIiSaIiEE15_M_allocate_mapEm.exit ]
  %call2.i.i.i12.i = invoke i8* @_Znwm(i64 512)
          to label %invoke.cont.i unwind label %lpad.i

invoke.cont.i:                                    ; preds = %for.body.i
  %5 = bitcast i32** %__cur.015.i to i8**
  store i8* %call2.i.i.i12.i, i8** %5, align 8, !tbaa !21
  %incdec.ptr.i = getelementptr inbounds i32*, i32** %__cur.015.i, i64 1
  %cmp.i58 = icmp ult i32** %incdec.ptr.i, %add.ptr14
  br i1 %cmp.i58, label %for.body.i, label %try.cont

lpad.i:                                           ; preds = %for.body.i
  %6 = landingpad { i8*, i32 }
          catch i8* null
  %7 = extractvalue { i8*, i32 } %6, 0
  %8 = tail call i8* @__cxa_begin_catch(i8* %7) #11
  %cmp5.i.i = icmp ugt i32** %__cur.015.i, %add.ptr
  br i1 %cmp5.i.i, label %for.body.i.i, label %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.i

for.body.i.i:                                     ; preds = %lpad.i, %for.body.i.i
  %__n.06.i.i = phi i32** [ %incdec.ptr.i.i, %for.body.i.i ], [ %add.ptr, %lpad.i ]
  %9 = bitcast i32** %__n.06.i.i to i8**
  %10 = load i8*, i8** %9, align 8, !tbaa !21
  tail call void @_ZdlPv(i8* %10) #11
  %incdec.ptr.i.i = getelementptr inbounds i32*, i32** %__n.06.i.i, i64 1
  %cmp.i.i = icmp ult i32** %incdec.ptr.i.i, %__cur.015.i
  br i1 %cmp.i.i, label %for.body.i.i, label %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.i

_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.i: ; preds = %for.body.i.i, %lpad.i
  invoke void @__cxa_rethrow() #15
          to label %unreachable.i unwind label %lpad2.i

lpad2.i:                                          ; preds = %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.i
  %11 = landingpad { i8*, i32 }
          catch i8* null
  invoke void @__cxa_end_catch()
          to label %lpad.body unwind label %terminate.lpad.i

terminate.lpad.i:                                 ; preds = %lpad2.i
  %12 = landingpad { i8*, i32 }
          catch i8* null
  %13 = extractvalue { i8*, i32 } %12, 0
  tail call void @__clang_call_terminate(i8* %13) #17
  unreachable

unreachable.i:                                    ; preds = %_ZNSt11_Deque_baseIiSaIiEE16_M_destroy_nodesEPPiS3_.exit.i
  unreachable

lpad.body:                                        ; preds = %lpad2.i
  %14 = extractvalue { i8*, i32 } %11, 0
  %15 = tail call i8* @__cxa_begin_catch(i8* %14) #11
  %16 = load i8*, i8** %3, align 8, !tbaa !18
  tail call void @_ZdlPv(i8* %16) #11
  %17 = bitcast %"class.std::_Deque_base"* %this to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %17, i8 0, i64 16, i1 false)
  invoke void @__cxa_rethrow() #15
          to label %unreachable unwind label %lpad23

lpad23:                                           ; preds = %lpad.body
  %18 = landingpad { i8*, i32 }
          cleanup
  invoke void @__cxa_end_catch()
          to label %invoke.cont24 unwind label %terminate.lpad

invoke.cont24:                                    ; preds = %lpad23
  resume { i8*, i32 } %18

try.cont:                                         ; preds = %invoke.cont.i
  %_M_start = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i64 0, i32 0, i32 2
  %_M_node.i54 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i64 0, i32 0, i32 2, i32 3
  store i32** %add.ptr, i32*** %_M_node.i54, align 8, !tbaa !20
  %19 = load i32*, i32** %add.ptr, align 8, !tbaa !21
  %_M_first.i55 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i64 0, i32 0, i32 2, i32 1
  store i32* %19, i32** %_M_first.i55, align 8, !tbaa !22
  %add.ptr.i56 = getelementptr inbounds i32, i32* %19, i64 128
  %_M_last.i57 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i64 0, i32 0, i32 2, i32 2
  store i32* %add.ptr.i56, i32** %_M_last.i57, align 8, !tbaa !23
  %add.ptr27 = getelementptr inbounds i32*, i32** %add.ptr14, i64 -1
  %_M_node.i = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i64 0, i32 0, i32 3, i32 3
  store i32** %add.ptr27, i32*** %_M_node.i, align 8, !tbaa !20
  %20 = load i32*, i32** %add.ptr27, align 8, !tbaa !21
  %_M_first.i = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i64 0, i32 0, i32 3, i32 1
  store i32* %20, i32** %_M_first.i, align 8, !tbaa !22
  %add.ptr.i = getelementptr inbounds i32, i32* %20, i64 128
  %_M_last.i = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i64 0, i32 0, i32 3, i32 2
  store i32* %add.ptr.i, i32** %_M_last.i, align 8, !tbaa !23
  %21 = ptrtoint i32* %19 to i64
  %22 = bitcast %"struct.std::_Deque_iterator"* %_M_start to i64*
  store i64 %21, i64* %22, align 8, !tbaa !26
  %rem = and i64 %__num_elements, 127
  %add.ptr36 = getelementptr inbounds i32, i32* %20, i64 %rem
  %_M_cur39 = getelementptr inbounds %"class.std::_Deque_base", %"class.std::_Deque_base"* %this, i64 0, i32 0, i32 3, i32 0
  store i32* %add.ptr36, i32** %_M_cur39, align 8, !tbaa !9
  ret void

terminate.lpad:                                   ; preds = %lpad23
  %23 = landingpad { i8*, i32 }
          catch i8* null
  %24 = extractvalue { i8*, i32 } %23, 0
  tail call void @__clang_call_terminate(i8* %24) #17
  unreachable

unreachable:                                      ; preds = %lpad.body
  unreachable
}

declare dso_local void @__cxa_rethrow() local_unnamed_addr

declare dso_local void @__cxa_end_catch() local_unnamed_addr

; Function Attrs: noreturn
declare dso_local void @_ZSt17__throw_bad_allocv() local_unnamed_addr #12

; Function Attrs: nobuiltin
declare dso_local noalias nonnull i8* @_Znwm(i64) local_unnamed_addr #13

; Function Attrs: nobuiltin nounwind
declare dso_local void @_ZdlPv(i8*) local_unnamed_addr #14

; Function Attrs: argmemonly nounwind
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i1 immarg) #2

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_main_visited.cpp() #4 section ".text.startup" {
entry:
  tail call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull @_ZStL8__ioinit)
  %0 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #11
  ret void
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #11

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #11

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

attributes #0 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { noinline noreturn nounwind }
attributes #11 = { nounwind }
attributes #12 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { nobuiltin "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #14 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #15 = { noreturn }
attributes #16 = { cold }
attributes #17 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (/home/ts20/share/llvm9/llvm-project/clang 3775794812e582769e2ed1b53c00650a6b21387c)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"float", !4, i64 0}
!8 = !{!4, !4, i64 0}
!9 = !{!10, !12, i64 48}
!10 = !{!"_ZTSSt11_Deque_baseIiSaIiEE", !11, i64 0}
!11 = !{!"_ZTSNSt11_Deque_baseIiSaIiEE11_Deque_implE", !12, i64 0, !13, i64 8, !14, i64 16, !14, i64 48}
!12 = !{!"any pointer", !4, i64 0}
!13 = !{!"long", !4, i64 0}
!14 = !{!"_ZTSSt15_Deque_iteratorIiRiPiE", !12, i64 0, !12, i64 8, !12, i64 16, !12, i64 24}
!15 = !{!10, !12, i64 64}
!16 = !{!10, !13, i64 8}
!17 = !{!10, !12, i64 72}
!18 = !{!10, !12, i64 0}
!19 = !{!10, !12, i64 40}
!20 = !{!14, !12, i64 24}
!21 = !{!12, !12, i64 0}
!22 = !{!14, !12, i64 8}
!23 = !{!14, !12, i64 16}
!24 = !{!14, !12, i64 0}
!25 = !{!10, !12, i64 32}
!26 = !{!10, !12, i64 16}
!27 = !{!10, !12, i64 24}
!28 = !{!29, !3, i64 4}
!29 = !{!"_ZTS4Node", !3, i64 0, !3, i64 4}
!30 = !{!29, !3, i64 0}
!31 = !{!32, !3, i64 0}
!32 = !{!"_ZTS4Edge", !3, i64 0, !3, i64 4}
!33 = !{!34, !12, i64 8}
!34 = !{!"_ZTS13pb_Parameters", !12, i64 0, !12, i64 8}
!35 = !{!32, !3, i64 4}
!36 = !{!34, !12, i64 0}
!37 = !{!38}
!38 = !{i64 2, i64 -1, i64 -1, i1 true}

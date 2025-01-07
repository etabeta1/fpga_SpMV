; ModuleID = 'D:/Desktop/SpMV/hls_component/hls_component/hls/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_uint<9>" = type { %"struct.ap_int_base<9, false>" }
%"struct.ap_int_base<9, false>" = type { %"struct.ssdm_int<9, false>" }
%"struct.ssdm_int<9, false>" = type { i9 }
%"struct.ap_uint<5>" = type { %"struct.ap_int_base<5, false>" }
%"struct.ap_int_base<5, false>" = type { %"struct.ssdm_int<5, false>" }
%"struct.ssdm_int<5, false>" = type { i5 }

; Function Attrs: inaccessiblemem_or_argmemonly noinline willreturn
define void @apatb_SpMV_ir(i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="100" "maxi" %values, %"struct.ap_uint<5>"* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="100" "maxi" %columnIndexes, %"struct.ap_uint<9>"* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="11" "maxi" %rowPointers, %"struct.ap_uint<5>"* nocapture readonly %numOfRows, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="10" "maxi" %vector, i32* noalias nocapture nonnull "fpga.decayed.dim.hint"="10" "maxi" %output) local_unnamed_addr #0 {
entry:
  %values_copy = alloca [100 x i32], align 512
  %columnIndexes_copy = alloca [100 x i5], align 512
  %rowPointers_copy = alloca [11 x i9], align 512
  %vector_copy = alloca [10 x i32], align 512
  %output_copy = alloca [10 x i32], align 512
  %0 = bitcast i32* %values to [100 x i32]*
  %1 = bitcast %"struct.ap_uint<5>"* %columnIndexes to [100 x %"struct.ap_uint<5>"]*
  %2 = bitcast %"struct.ap_uint<9>"* %rowPointers to [11 x %"struct.ap_uint<9>"]*
  %3 = bitcast i32* %vector to [10 x i32]*
  %4 = bitcast i32* %output to [10 x i32]*
  call fastcc void @copy_in([100 x i32]* nonnull %0, [100 x i32]* nonnull align 512 %values_copy, [100 x %"struct.ap_uint<5>"]* nonnull %1, [100 x i5]* nonnull align 512 %columnIndexes_copy, [11 x %"struct.ap_uint<9>"]* nonnull %2, [11 x i9]* nonnull align 512 %rowPointers_copy, [10 x i32]* nonnull %3, [10 x i32]* nonnull align 512 %vector_copy, [10 x i32]* nonnull %4, [10 x i32]* nonnull align 512 %output_copy)
  call void @apatb_SpMV_hw([100 x i32]* %values_copy, [100 x i5]* %columnIndexes_copy, [11 x i9]* %rowPointers_copy, %"struct.ap_uint<5>"* %numOfRows, [10 x i32]* %vector_copy, [10 x i32]* %output_copy)
  call void @copy_back([100 x i32]* %0, [100 x i32]* %values_copy, [100 x %"struct.ap_uint<5>"]* %1, [100 x i5]* %columnIndexes_copy, [11 x %"struct.ap_uint<9>"]* %2, [11 x i9]* %rowPointers_copy, [10 x i32]* %3, [10 x i32]* %vector_copy, [10 x i32]* %4, [10 x i32]* %output_copy)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in([100 x i32]* noalias readonly "unpacked"="0", [100 x i32]* noalias align 512 "unpacked"="1", [100 x %"struct.ap_uint<5>"]* noalias readonly "unpacked"="2", [100 x i5]* noalias nocapture align 512 "unpacked"="3.0", [11 x %"struct.ap_uint<9>"]* noalias readonly "unpacked"="4", [11 x i9]* noalias nocapture align 512 "unpacked"="5.0", [10 x i32]* noalias readonly "unpacked"="6", [10 x i32]* noalias align 512 "unpacked"="7", [10 x i32]* noalias readonly "unpacked"="8", [10 x i32]* noalias align 512 "unpacked"="9") unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a100i32([100 x i32]* align 512 %1, [100 x i32]* %0)
  call fastcc void @"onebyonecpy_hls.p0a100struct.ap_uint<5>.15"([100 x i5]* align 512 %3, [100 x %"struct.ap_uint<5>"]* %2)
  call fastcc void @"onebyonecpy_hls.p0a11struct.ap_uint<9>"([11 x i9]* align 512 %5, [11 x %"struct.ap_uint<9>"]* %4)
  call fastcc void @onebyonecpy_hls.p0a10i32([10 x i32]* align 512 %7, [10 x i32]* %6)
  call fastcc void @onebyonecpy_hls.p0a10i32([10 x i32]* align 512 %9, [10 x i32]* %8)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a100i32([100 x i32]* noalias align 512 %dst, [100 x i32]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [100 x i32]* %dst, null
  %1 = icmp eq [100 x i32]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a100i32([100 x i32]* nonnull %dst, [100 x i32]* nonnull %src, i64 100)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a100i32([100 x i32]* %dst, [100 x i32]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [100 x i32]* %src, null
  %1 = icmp eq [100 x i32]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [100 x i32], [100 x i32]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [100 x i32], [100 x i32]* %src, i64 0, i64 %for.loop.idx2
  %3 = load i32, i32* %src.addr, align 4
  store i32 %3, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a100struct.ap_uint<5>"([100 x %"struct.ap_uint<5>"]* noalias "unpacked"="0" %dst, [100 x i5]* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [100 x %"struct.ap_uint<5>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a100struct.ap_uint<5>"([100 x %"struct.ap_uint<5>"]* nonnull %dst, [100 x i5]* %src, i64 100)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a100struct.ap_uint<5>"([100 x %"struct.ap_uint<5>"]* "unpacked"="0" %dst, [100 x i5]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [100 x %"struct.ap_uint<5>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [100 x i5], [100 x i5]* %src, i64 0, i64 %for.loop.idx2
  %dst.addr.0.0.06 = getelementptr [100 x %"struct.ap_uint<5>"], [100 x %"struct.ap_uint<5>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %1 = bitcast i5* %src.addr.0.0.05 to i8*
  %2 = load i8, i8* %1
  %3 = trunc i8 %2 to i5
  store i5 %3, i5* %dst.addr.0.0.06, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a11struct.ap_uint<9>"([11 x i9]* noalias nocapture align 512 "unpacked"="0.0" %dst, [11 x %"struct.ap_uint<9>"]* noalias readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [11 x %"struct.ap_uint<9>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a11struct.ap_uint<9>"([11 x i9]* %dst, [11 x %"struct.ap_uint<9>"]* nonnull %src, i64 11)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a11struct.ap_uint<9>"([11 x i9]* nocapture "unpacked"="0.0" %dst, [11 x %"struct.ap_uint<9>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [11 x %"struct.ap_uint<9>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [11 x %"struct.ap_uint<9>"], [11 x %"struct.ap_uint<9>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [11 x i9], [11 x i9]* %dst, i64 0, i64 %for.loop.idx2
  %1 = bitcast i9* %src.addr.0.0.05 to i16*
  %2 = load i16, i16* %1
  %3 = trunc i16 %2 to i9
  store i9 %3, i9* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a10i32([10 x i32]* noalias align 512 %dst, [10 x i32]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [10 x i32]* %dst, null
  %1 = icmp eq [10 x i32]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a10i32([10 x i32]* nonnull %dst, [10 x i32]* nonnull %src, i64 10)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a10i32([10 x i32]* %dst, [10 x i32]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [10 x i32]* %src, null
  %1 = icmp eq [10 x i32]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [10 x i32], [10 x i32]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [10 x i32], [10 x i32]* %src, i64 0, i64 %for.loop.idx2
  %3 = load i32, i32* %src.addr, align 4
  store i32 %3, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_out([100 x i32]* noalias "unpacked"="0", [100 x i32]* noalias readonly align 512 "unpacked"="1", [100 x %"struct.ap_uint<5>"]* noalias "unpacked"="2", [100 x i5]* noalias nocapture readonly align 512 "unpacked"="3.0", [11 x %"struct.ap_uint<9>"]* noalias "unpacked"="4", [11 x i9]* noalias nocapture readonly align 512 "unpacked"="5.0", [10 x i32]* noalias "unpacked"="6", [10 x i32]* noalias readonly align 512 "unpacked"="7", [10 x i32]* noalias "unpacked"="8", [10 x i32]* noalias readonly align 512 "unpacked"="9") unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a100i32([100 x i32]* %0, [100 x i32]* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0a100struct.ap_uint<5>"([100 x %"struct.ap_uint<5>"]* %2, [100 x i5]* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0a11struct.ap_uint<9>.5"([11 x %"struct.ap_uint<9>"]* %4, [11 x i9]* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0a10i32([10 x i32]* %6, [10 x i32]* align 512 %7)
  call fastcc void @onebyonecpy_hls.p0a10i32([10 x i32]* %8, [10 x i32]* align 512 %9)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a11struct.ap_uint<9>.5"([11 x %"struct.ap_uint<9>"]* noalias "unpacked"="0" %dst, [11 x i9]* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [11 x %"struct.ap_uint<9>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a11struct.ap_uint<9>.8"([11 x %"struct.ap_uint<9>"]* nonnull %dst, [11 x i9]* %src, i64 11)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a11struct.ap_uint<9>.8"([11 x %"struct.ap_uint<9>"]* "unpacked"="0" %dst, [11 x i9]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [11 x %"struct.ap_uint<9>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [11 x i9], [11 x i9]* %src, i64 0, i64 %for.loop.idx2
  %dst.addr.0.0.06 = getelementptr [11 x %"struct.ap_uint<9>"], [11 x %"struct.ap_uint<9>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %1 = bitcast i9* %src.addr.0.0.05 to i16*
  %2 = load i16, i16* %1
  %3 = trunc i16 %2 to i9
  store i9 %3, i9* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a100struct.ap_uint<5>.15"([100 x i5]* noalias nocapture align 512 "unpacked"="0.0" %dst, [100 x %"struct.ap_uint<5>"]* noalias readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [100 x %"struct.ap_uint<5>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a100struct.ap_uint<5>.18"([100 x i5]* %dst, [100 x %"struct.ap_uint<5>"]* nonnull %src, i64 100)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a100struct.ap_uint<5>.18"([100 x i5]* nocapture "unpacked"="0.0" %dst, [100 x %"struct.ap_uint<5>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [100 x %"struct.ap_uint<5>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [100 x %"struct.ap_uint<5>"], [100 x %"struct.ap_uint<5>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [100 x i5], [100 x i5]* %dst, i64 0, i64 %for.loop.idx2
  %1 = bitcast i5* %src.addr.0.0.05 to i8*
  %2 = load i8, i8* %1
  %3 = trunc i8 %2 to i5
  store i5 %3, i5* %dst.addr.0.0.06, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

declare void @apatb_SpMV_hw([100 x i32]*, [100 x i5]*, [11 x i9]*, %"struct.ap_uint<5>"*, [10 x i32]*, [10 x i32]*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([100 x i32]* noalias "unpacked"="0", [100 x i32]* noalias readonly align 512 "unpacked"="1", [100 x %"struct.ap_uint<5>"]* noalias "unpacked"="2", [100 x i5]* noalias nocapture readonly align 512 "unpacked"="3.0", [11 x %"struct.ap_uint<9>"]* noalias "unpacked"="4", [11 x i9]* noalias nocapture readonly align 512 "unpacked"="5.0", [10 x i32]* noalias "unpacked"="6", [10 x i32]* noalias readonly align 512 "unpacked"="7", [10 x i32]* noalias "unpacked"="8", [10 x i32]* noalias readonly align 512 "unpacked"="9") unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a10i32([10 x i32]* %8, [10 x i32]* align 512 %9)
  ret void
}

define void @SpMV_hw_stub_wrapper([100 x i32]*, [100 x i5]*, [11 x i9]*, %"struct.ap_uint<5>"*, [10 x i32]*, [10 x i32]*) #5 {
entry:
  %6 = alloca [100 x %"struct.ap_uint<5>"]
  %7 = alloca [11 x %"struct.ap_uint<9>"]
  call void @copy_out([100 x i32]* null, [100 x i32]* %0, [100 x %"struct.ap_uint<5>"]* %6, [100 x i5]* %1, [11 x %"struct.ap_uint<9>"]* %7, [11 x i9]* %2, [10 x i32]* null, [10 x i32]* %4, [10 x i32]* null, [10 x i32]* %5)
  %8 = bitcast [100 x i32]* %0 to i32*
  %9 = bitcast [100 x %"struct.ap_uint<5>"]* %6 to %"struct.ap_uint<5>"*
  %10 = bitcast [11 x %"struct.ap_uint<9>"]* %7 to %"struct.ap_uint<9>"*
  %11 = bitcast [10 x i32]* %4 to i32*
  %12 = bitcast [10 x i32]* %5 to i32*
  call void @SpMV_hw_stub(i32* %8, %"struct.ap_uint<5>"* %9, %"struct.ap_uint<9>"* %10, %"struct.ap_uint<5>"* %3, i32* %11, i32* %12)
  call void @copy_in([100 x i32]* null, [100 x i32]* %0, [100 x %"struct.ap_uint<5>"]* %6, [100 x i5]* %1, [11 x %"struct.ap_uint<9>"]* %7, [11 x i9]* %2, [10 x i32]* null, [10 x i32]* %4, [10 x i32]* null, [10 x i32]* %5)
  ret void
}

declare void @SpMV_hw_stub(i32* noalias nocapture nonnull readonly, %"struct.ap_uint<5>"* noalias nocapture nonnull readonly, %"struct.ap_uint<9>"* noalias nocapture nonnull readonly, %"struct.ap_uint<5>"* nocapture readonly, i32* noalias nocapture nonnull readonly, i32* noalias nocapture nonnull)

attributes #0 = { inaccessiblemem_or_argmemonly noinline willreturn "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #4 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}

; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=armv7-none-linux-gnueabi < %s | FileCheck %s

define <3 x i64> @shuffle(i1 %dec1, i1 %dec0, <3 x i64> %b) {
; CHECK-LABEL: shuffle:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    tst r1, #1
; CHECK-NEXT:    moveq r1, #0
; CHECK-NEXT:    vmoveq d16, r1, r1
; CHECK-NEXT:    vldrne d16, [sp]
; CHECK-NEXT:    tst r2, #1
; CHECK-NEXT:    moveq r1, #0
; CHECK-NEXT:    vmoveq d18, r1, r1
; CHECK-NEXT:    vldrne d18, [sp, #8]
; CHECK-NEXT:    vorr d17, d18, d18
; CHECK-NEXT:    vst1.64 {d16, d17}, [r0:128]
; CHECK-NEXT:    bx lr
entry:
  %.sink = select i1 %dec1, <3 x i64> %b, <3 x i64> zeroinitializer
  %.sink15 = select i1 %dec0, <3 x i64> %b, <3 x i64> zeroinitializer
  %vecinit7 = shufflevector <3 x i64> %.sink, <3 x i64> %.sink15, <3 x i32> <i32 0, i32 4, i32 undef>
  ret <3 x i64> %vecinit7
}

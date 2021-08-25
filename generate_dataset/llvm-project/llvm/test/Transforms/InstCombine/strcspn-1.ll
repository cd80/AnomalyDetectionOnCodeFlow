; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; Test that the strcspn library call simplifier works correctly.
;
; RUN: opt < %s -instcombine -S | FileCheck %s

target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"

@abcba = constant [6 x i8] c"abcba\00"
@abc = constant [4 x i8] c"abc\00"
@null = constant [1 x i8] zeroinitializer

declare i64 @strcspn(i8*, i8*)

; Check strcspn(s, "") -> strlen(s).

define i64 @test_simplify1(i8* %str) {
; CHECK-LABEL: @test_simplify1(
; CHECK-NEXT:    [[STRLEN:%.*]] = call i64 @strlen(i8* nonnull dereferenceable(1) [[STR:%.*]])
; CHECK-NEXT:    ret i64 [[STRLEN]]
;
  %pat = getelementptr [1 x i8], [1 x i8]* @null, i32 0, i32 0

  %ret = call i64 @strcspn(i8* %str, i8* %pat)
  ret i64 %ret
}

; Check strcspn("", s) -> 0.

define i64 @test_simplify2(i8* %pat) {
; CHECK-LABEL: @test_simplify2(
; CHECK-NEXT:    ret i64 0
;
  %str = getelementptr [1 x i8], [1 x i8]* @null, i32 0, i32 0

  %ret = call i64 @strcspn(i8* %str, i8* %pat)
  ret i64 %ret
}

; Check strcspn(s1, s2), where s1 and s2 are constants.

define i64 @test_simplify3() {
; CHECK-LABEL: @test_simplify3(
; CHECK-NEXT:    ret i64 0
;
  %str = getelementptr [6 x i8], [6 x i8]* @abcba, i32 0, i32 0
  %pat = getelementptr [4 x i8], [4 x i8]* @abc, i32 0, i32 0

  %ret = call i64 @strcspn(i8* %str, i8* %pat)
  ret i64 %ret
}

; Check cases that shouldn't be simplified.

define i64 @test_no_simplify1(i8* %str, i8* %pat) {
; CHECK-LABEL: @test_no_simplify1(
; CHECK-NEXT:    [[RET:%.*]] = call i64 @strcspn(i8* [[STR:%.*]], i8* [[PAT:%.*]])
; CHECK-NEXT:    ret i64 [[RET]]
;

  %ret = call i64 @strcspn(i8* %str, i8* %pat)
  ret i64 %ret
}

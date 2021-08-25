; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv64 -verify-machineinstrs < %s \
; RUN:   | FileCheck %s -check-prefix=RV64I
; RUN: llc -mtriple=riscv64 -mattr=+experimental-b -verify-machineinstrs < %s \
; RUN:   | FileCheck %s -check-prefix=RV64IB
; RUN: llc -mtriple=riscv64 -mattr=+experimental-zbp -verify-machineinstrs < %s \
; RUN:   | FileCheck %s -check-prefix=RV64IBP

define signext i32 @gorc1_i32(i32 signext %a) nounwind {
; RV64I-LABEL: gorc1_i32:
; RV64I:       # %bb.0:
; RV64I-NEXT:    slli a1, a0, 1
; RV64I-NEXT:    lui a2, 171
; RV64I-NEXT:    addiw a2, a2, -1365
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -1366
; RV64I-NEXT:    and a1, a1, a2
; RV64I-NEXT:    srli a2, a0, 1
; RV64I-NEXT:    lui a3, 349525
; RV64I-NEXT:    addiw a3, a3, 1365
; RV64I-NEXT:    and a2, a2, a3
; RV64I-NEXT:    or a0, a2, a0
; RV64I-NEXT:    or a0, a0, a1
; RV64I-NEXT:    sext.w a0, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: gorc1_i32:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    gorciw a0, a0, 1
; RV64IB-NEXT:    ret
;
; RV64IBP-LABEL: gorc1_i32:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    gorciw a0, a0, 1
; RV64IBP-NEXT:    ret
  %and = shl i32 %a, 1
  %shl = and i32 %and, -1431655766
  %and1 = lshr i32 %a, 1
  %shr = and i32 %and1, 1431655765
  %or = or i32 %shr, %a
  %or2 = or i32 %or, %shl
  ret i32 %or2
}

define i64 @gorc1_i64(i64 %a) nounwind {
; RV64I-LABEL: gorc1_i64:
; RV64I:       # %bb.0:
; RV64I-NEXT:    slli a1, a0, 1
; RV64I-NEXT:    lui a2, 1026731
; RV64I-NEXT:    addiw a2, a2, -1365
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -1365
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -1365
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -1366
; RV64I-NEXT:    and a1, a1, a2
; RV64I-NEXT:    srli a2, a0, 1
; RV64I-NEXT:    lui a3, 21845
; RV64I-NEXT:    addiw a3, a3, 1365
; RV64I-NEXT:    slli a3, a3, 12
; RV64I-NEXT:    addi a3, a3, 1365
; RV64I-NEXT:    slli a3, a3, 12
; RV64I-NEXT:    addi a3, a3, 1365
; RV64I-NEXT:    slli a3, a3, 12
; RV64I-NEXT:    addi a3, a3, 1365
; RV64I-NEXT:    and a2, a2, a3
; RV64I-NEXT:    or a0, a2, a0
; RV64I-NEXT:    or a0, a0, a1
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: gorc1_i64:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    orc.p a0, a0
; RV64IB-NEXT:    ret
;
; RV64IBP-LABEL: gorc1_i64:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    orc.p a0, a0
; RV64IBP-NEXT:    ret
  %and = shl i64 %a, 1
  %shl = and i64 %and, -6148914691236517206
  %and1 = lshr i64 %a, 1
  %shr = and i64 %and1, 6148914691236517205
  %or = or i64 %shr, %a
  %or2 = or i64 %or, %shl
  ret i64 %or2
}

define signext i32 @gorc2_i32(i32 signext %a) nounwind {
; RV64I-LABEL: gorc2_i32:
; RV64I:       # %bb.0:
; RV64I-NEXT:    slli a1, a0, 2
; RV64I-NEXT:    lui a2, 205
; RV64I-NEXT:    addiw a2, a2, -819
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -820
; RV64I-NEXT:    and a1, a1, a2
; RV64I-NEXT:    srli a2, a0, 2
; RV64I-NEXT:    lui a3, 209715
; RV64I-NEXT:    addiw a3, a3, 819
; RV64I-NEXT:    and a2, a2, a3
; RV64I-NEXT:    or a0, a2, a0
; RV64I-NEXT:    or a0, a0, a1
; RV64I-NEXT:    sext.w a0, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: gorc2_i32:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    gorciw a0, a0, 2
; RV64IB-NEXT:    ret
;
; RV64IBP-LABEL: gorc2_i32:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    gorciw a0, a0, 2
; RV64IBP-NEXT:    ret
  %and = shl i32 %a, 2
  %shl = and i32 %and, -858993460
  %and1 = lshr i32 %a, 2
  %shr = and i32 %and1, 858993459
  %or = or i32 %shr, %a
  %or2 = or i32 %or, %shl
  ret i32 %or2
}

define i64 @gorc2_i64(i64 %a) nounwind {
; RV64I-LABEL: gorc2_i64:
; RV64I:       # %bb.0:
; RV64I-NEXT:    slli a1, a0, 2
; RV64I-NEXT:    lui a2, 1035469
; RV64I-NEXT:    addiw a2, a2, -819
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -819
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -819
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -820
; RV64I-NEXT:    and a1, a1, a2
; RV64I-NEXT:    srli a2, a0, 2
; RV64I-NEXT:    lui a3, 13107
; RV64I-NEXT:    addiw a3, a3, 819
; RV64I-NEXT:    slli a3, a3, 12
; RV64I-NEXT:    addi a3, a3, 819
; RV64I-NEXT:    slli a3, a3, 12
; RV64I-NEXT:    addi a3, a3, 819
; RV64I-NEXT:    slli a3, a3, 12
; RV64I-NEXT:    addi a3, a3, 819
; RV64I-NEXT:    and a2, a2, a3
; RV64I-NEXT:    or a0, a2, a0
; RV64I-NEXT:    or a0, a0, a1
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: gorc2_i64:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    orc2.n a0, a0
; RV64IB-NEXT:    ret
;
; RV64IBP-LABEL: gorc2_i64:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    orc2.n a0, a0
; RV64IBP-NEXT:    ret
  %and = shl i64 %a, 2
  %shl = and i64 %and, -3689348814741910324
  %and1 = lshr i64 %a, 2
  %shr = and i64 %and1, 3689348814741910323
  %or = or i64 %shr, %a
  %or2 = or i64 %or, %shl
  ret i64 %or2
}

define signext i32 @gorc4_i32(i32 signext %a) nounwind {
; RV64I-LABEL: gorc4_i32:
; RV64I:       # %bb.0:
; RV64I-NEXT:    slli a1, a0, 4
; RV64I-NEXT:    lui a2, 241
; RV64I-NEXT:    addiw a2, a2, -241
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, 240
; RV64I-NEXT:    and a1, a1, a2
; RV64I-NEXT:    srli a2, a0, 4
; RV64I-NEXT:    lui a3, 61681
; RV64I-NEXT:    addiw a3, a3, -241
; RV64I-NEXT:    and a2, a2, a3
; RV64I-NEXT:    or a0, a2, a0
; RV64I-NEXT:    or a0, a0, a1
; RV64I-NEXT:    sext.w a0, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: gorc4_i32:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    gorciw a0, a0, 4
; RV64IB-NEXT:    ret
;
; RV64IBP-LABEL: gorc4_i32:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    gorciw a0, a0, 4
; RV64IBP-NEXT:    ret
  %and = shl i32 %a, 4
  %shl = and i32 %and, -252645136
  %and1 = lshr i32 %a, 4
  %shr = and i32 %and1, 252645135
  %or = or i32 %shr, %a
  %or2 = or i32 %or, %shl
  ret i32 %or2
}

define i64 @gorc4_i64(i64 %a) nounwind {
; RV64I-LABEL: gorc4_i64:
; RV64I:       # %bb.0:
; RV64I-NEXT:    slli a1, a0, 4
; RV64I-NEXT:    lui a2, 1044721
; RV64I-NEXT:    addiw a2, a2, -241
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, 241
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -241
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, 240
; RV64I-NEXT:    and a1, a1, a2
; RV64I-NEXT:    srli a2, a0, 4
; RV64I-NEXT:    lui a3, 3855
; RV64I-NEXT:    addiw a3, a3, 241
; RV64I-NEXT:    slli a3, a3, 12
; RV64I-NEXT:    addi a3, a3, -241
; RV64I-NEXT:    slli a3, a3, 12
; RV64I-NEXT:    addi a3, a3, 241
; RV64I-NEXT:    slli a3, a3, 12
; RV64I-NEXT:    addi a3, a3, -241
; RV64I-NEXT:    and a2, a2, a3
; RV64I-NEXT:    or a0, a2, a0
; RV64I-NEXT:    or a0, a0, a1
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: gorc4_i64:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    orc4.b a0, a0
; RV64IB-NEXT:    ret
;
; RV64IBP-LABEL: gorc4_i64:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    orc4.b a0, a0
; RV64IBP-NEXT:    ret
  %and = shl i64 %a, 4
  %shl = and i64 %and, -1085102592571150096
  %and1 = lshr i64 %a, 4
  %shr = and i64 %and1, 1085102592571150095
  %or = or i64 %shr, %a
  %or2 = or i64 %or, %shl
  ret i64 %or2
}

define signext i32 @gorc8_i32(i32 signext %a) nounwind {
; RV64I-LABEL: gorc8_i32:
; RV64I:       # %bb.0:
; RV64I-NEXT:    slli a1, a0, 8
; RV64I-NEXT:    lui a2, 16
; RV64I-NEXT:    addiw a2, a2, -255
; RV64I-NEXT:    slli a2, a2, 16
; RV64I-NEXT:    addi a2, a2, -256
; RV64I-NEXT:    and a1, a1, a2
; RV64I-NEXT:    srli a2, a0, 8
; RV64I-NEXT:    lui a3, 4080
; RV64I-NEXT:    addiw a3, a3, 255
; RV64I-NEXT:    and a2, a2, a3
; RV64I-NEXT:    or a0, a2, a0
; RV64I-NEXT:    or a0, a0, a1
; RV64I-NEXT:    sext.w a0, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: gorc8_i32:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    gorciw a0, a0, 8
; RV64IB-NEXT:    ret
;
; RV64IBP-LABEL: gorc8_i32:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    gorciw a0, a0, 8
; RV64IBP-NEXT:    ret
  %and = shl i32 %a, 8
  %shl = and i32 %and, -16711936
  %and1 = lshr i32 %a, 8
  %shr = and i32 %and1, 16711935
  %or = or i32 %shr, %a
  %or2 = or i32 %or, %shl
  ret i32 %or2
}

define i64 @gorc8_i64(i64 %a) nounwind {
; RV64I-LABEL: gorc8_i64:
; RV64I:       # %bb.0:
; RV64I-NEXT:    slli a1, a0, 8
; RV64I-NEXT:    lui a2, 1044496
; RV64I-NEXT:    addiw a2, a2, -255
; RV64I-NEXT:    slli a2, a2, 16
; RV64I-NEXT:    addi a2, a2, -255
; RV64I-NEXT:    slli a2, a2, 16
; RV64I-NEXT:    addi a2, a2, -256
; RV64I-NEXT:    and a1, a1, a2
; RV64I-NEXT:    srli a2, a0, 8
; RV64I-NEXT:    lui a3, 4080
; RV64I-NEXT:    addiw a3, a3, 255
; RV64I-NEXT:    slli a3, a3, 16
; RV64I-NEXT:    addi a3, a3, 255
; RV64I-NEXT:    slli a3, a3, 16
; RV64I-NEXT:    addi a3, a3, 255
; RV64I-NEXT:    and a2, a2, a3
; RV64I-NEXT:    or a0, a2, a0
; RV64I-NEXT:    or a0, a0, a1
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: gorc8_i64:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    orc8.h a0, a0
; RV64IB-NEXT:    ret
;
; RV64IBP-LABEL: gorc8_i64:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    orc8.h a0, a0
; RV64IBP-NEXT:    ret
  %and = shl i64 %a, 8
  %shl = and i64 %and, -71777214294589696
  %and1 = lshr i64 %a, 8
  %shr = and i64 %and1, 71777214294589695
  %or = or i64 %shr, %a
  %or2 = or i64 %or, %shl
  ret i64 %or2
}

define signext i32 @gorc16_i32(i32 signext %a) nounwind {
; RV64I-LABEL: gorc16_i32:
; RV64I:       # %bb.0:
; RV64I-NEXT:    slli a1, a0, 16
; RV64I-NEXT:    srliw a2, a0, 16
; RV64I-NEXT:    or a0, a2, a0
; RV64I-NEXT:    or a0, a0, a1
; RV64I-NEXT:    sext.w a0, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: gorc16_i32:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    gorciw a0, a0, 16
; RV64IB-NEXT:    ret
;
; RV64IBP-LABEL: gorc16_i32:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    gorciw a0, a0, 16
; RV64IBP-NEXT:    ret
  %shl = shl i32 %a, 16
  %shr = lshr i32 %a, 16
  %or = or i32 %shr, %a
  %or2 = or i32 %or, %shl
  ret i32 %or2
}

define i64 @gorc16_i64(i64 %a) nounwind {
; RV64I-LABEL: gorc16_i64:
; RV64I:       # %bb.0:
; RV64I-NEXT:    slli a1, a0, 16
; RV64I-NEXT:    lui a2, 1048560
; RV64I-NEXT:    addiw a2, a2, 1
; RV64I-NEXT:    slli a2, a2, 16
; RV64I-NEXT:    addi a2, a2, -1
; RV64I-NEXT:    slli a2, a2, 16
; RV64I-NEXT:    and a1, a1, a2
; RV64I-NEXT:    srli a2, a0, 16
; RV64I-NEXT:    lui a3, 16
; RV64I-NEXT:    addiw a3, a3, -1
; RV64I-NEXT:    slli a3, a3, 16
; RV64I-NEXT:    addi a3, a3, 1
; RV64I-NEXT:    slli a3, a3, 16
; RV64I-NEXT:    addi a3, a3, -1
; RV64I-NEXT:    and a2, a2, a3
; RV64I-NEXT:    or a0, a2, a0
; RV64I-NEXT:    or a0, a0, a1
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: gorc16_i64:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    orc16.w a0, a0
; RV64IB-NEXT:    ret
;
; RV64IBP-LABEL: gorc16_i64:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    orc16.w a0, a0
; RV64IBP-NEXT:    ret
  %and = shl i64 %a, 16
  %shl = and i64 %and, -281470681808896
  %and1 = lshr i64 %a, 16
  %shr = and i64 %and1, 281470681808895
  %or = or i64 %shr, %a
  %or2 = or i64 %or, %shl
  ret i64 %or2
}

define i64 @gorc32(i64 %a) nounwind {
; RV64I-LABEL: gorc32:
; RV64I:       # %bb.0:
; RV64I-NEXT:    slli a1, a0, 32
; RV64I-NEXT:    srli a2, a0, 32
; RV64I-NEXT:    or a0, a2, a0
; RV64I-NEXT:    or a0, a0, a1
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: gorc32:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    orc32 a0, a0
; RV64IB-NEXT:    ret
;
; RV64IBP-LABEL: gorc32:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    orc32 a0, a0
; RV64IBP-NEXT:    ret
  %shl = shl i64 %a, 32
  %shr = lshr i64 %a, 32
  %or = or i64 %shr, %a
  %or2 = or i64 %or, %shl
  ret i64 %or2
}

define signext i32 @grev1_i32(i32 signext %a) nounwind {
; RV64I-LABEL: grev1_i32:
; RV64I:       # %bb.0:
; RV64I-NEXT:    slli a1, a0, 1
; RV64I-NEXT:    lui a2, 171
; RV64I-NEXT:    addiw a2, a2, -1365
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -1366
; RV64I-NEXT:    and a1, a1, a2
; RV64I-NEXT:    srli a0, a0, 1
; RV64I-NEXT:    lui a2, 349525
; RV64I-NEXT:    addiw a2, a2, 1365
; RV64I-NEXT:    and a0, a0, a2
; RV64I-NEXT:    or a0, a1, a0
; RV64I-NEXT:    sext.w a0, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: grev1_i32:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    greviw a0, a0, 1
; RV64IB-NEXT:    ret
;
; RV64IBP-LABEL: grev1_i32:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    greviw a0, a0, 1
; RV64IBP-NEXT:    ret
  %and = shl i32 %a, 1
  %shl = and i32 %and, -1431655766
  %and1 = lshr i32 %a, 1
  %shr = and i32 %and1, 1431655765
  %or = or i32 %shl, %shr
  ret i32 %or
}

define i64 @grev1_i64(i64 %a) nounwind {
; RV64I-LABEL: grev1_i64:
; RV64I:       # %bb.0:
; RV64I-NEXT:    slli a1, a0, 1
; RV64I-NEXT:    lui a2, 1026731
; RV64I-NEXT:    addiw a2, a2, -1365
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -1365
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -1365
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -1366
; RV64I-NEXT:    and a1, a1, a2
; RV64I-NEXT:    srli a0, a0, 1
; RV64I-NEXT:    lui a2, 21845
; RV64I-NEXT:    addiw a2, a2, 1365
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, 1365
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, 1365
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, 1365
; RV64I-NEXT:    and a0, a0, a2
; RV64I-NEXT:    or a0, a1, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: grev1_i64:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    rev.p a0, a0
; RV64IB-NEXT:    ret
;
; RV64IBP-LABEL: grev1_i64:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    rev.p a0, a0
; RV64IBP-NEXT:    ret
  %and = shl i64 %a, 1
  %shl = and i64 %and, -6148914691236517206
  %and1 = lshr i64 %a, 1
  %shr = and i64 %and1, 6148914691236517205
  %or = or i64 %shl, %shr
  ret i64 %or
}

define signext i32 @grev2_i32(i32 signext %a) nounwind {
; RV64I-LABEL: grev2_i32:
; RV64I:       # %bb.0:
; RV64I-NEXT:    slli a1, a0, 2
; RV64I-NEXT:    lui a2, 205
; RV64I-NEXT:    addiw a2, a2, -819
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -820
; RV64I-NEXT:    and a1, a1, a2
; RV64I-NEXT:    srli a0, a0, 2
; RV64I-NEXT:    lui a2, 209715
; RV64I-NEXT:    addiw a2, a2, 819
; RV64I-NEXT:    and a0, a0, a2
; RV64I-NEXT:    or a0, a1, a0
; RV64I-NEXT:    sext.w a0, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: grev2_i32:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    greviw a0, a0, 2
; RV64IB-NEXT:    ret
;
; RV64IBP-LABEL: grev2_i32:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    greviw a0, a0, 2
; RV64IBP-NEXT:    ret
  %and = shl i32 %a, 2
  %shl = and i32 %and, -858993460
  %and1 = lshr i32 %a, 2
  %shr = and i32 %and1, 858993459
  %or = or i32 %shl, %shr
  ret i32 %or
}

define i64 @grev2_i64(i64 %a) nounwind {
; RV64I-LABEL: grev2_i64:
; RV64I:       # %bb.0:
; RV64I-NEXT:    slli a1, a0, 2
; RV64I-NEXT:    lui a2, 1035469
; RV64I-NEXT:    addiw a2, a2, -819
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -819
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -819
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -820
; RV64I-NEXT:    and a1, a1, a2
; RV64I-NEXT:    srli a0, a0, 2
; RV64I-NEXT:    lui a2, 13107
; RV64I-NEXT:    addiw a2, a2, 819
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, 819
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, 819
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, 819
; RV64I-NEXT:    and a0, a0, a2
; RV64I-NEXT:    or a0, a1, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: grev2_i64:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    rev2.n a0, a0
; RV64IB-NEXT:    ret
;
; RV64IBP-LABEL: grev2_i64:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    rev2.n a0, a0
; RV64IBP-NEXT:    ret
  %and = shl i64 %a, 2
  %shl = and i64 %and, -3689348814741910324
  %and1 = lshr i64 %a, 2
  %shr = and i64 %and1, 3689348814741910323
  %or = or i64 %shl, %shr
  ret i64 %or
}

define signext i32 @grev4_i32(i32 signext %a) nounwind {
; RV64I-LABEL: grev4_i32:
; RV64I:       # %bb.0:
; RV64I-NEXT:    slli a1, a0, 4
; RV64I-NEXT:    lui a2, 241
; RV64I-NEXT:    addiw a2, a2, -241
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, 240
; RV64I-NEXT:    and a1, a1, a2
; RV64I-NEXT:    srli a0, a0, 4
; RV64I-NEXT:    lui a2, 61681
; RV64I-NEXT:    addiw a2, a2, -241
; RV64I-NEXT:    and a0, a0, a2
; RV64I-NEXT:    or a0, a1, a0
; RV64I-NEXT:    sext.w a0, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: grev4_i32:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    greviw a0, a0, 4
; RV64IB-NEXT:    ret
;
; RV64IBP-LABEL: grev4_i32:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    greviw a0, a0, 4
; RV64IBP-NEXT:    ret
  %and = shl i32 %a, 4
  %shl = and i32 %and, -252645136
  %and1 = lshr i32 %a, 4
  %shr = and i32 %and1, 252645135
  %or = or i32 %shl, %shr
  ret i32 %or
}

define i64 @grev4_i64(i64 %a) nounwind {
; RV64I-LABEL: grev4_i64:
; RV64I:       # %bb.0:
; RV64I-NEXT:    slli a1, a0, 4
; RV64I-NEXT:    lui a2, 1044721
; RV64I-NEXT:    addiw a2, a2, -241
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, 241
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -241
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, 240
; RV64I-NEXT:    and a1, a1, a2
; RV64I-NEXT:    srli a0, a0, 4
; RV64I-NEXT:    lui a2, 3855
; RV64I-NEXT:    addiw a2, a2, 241
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -241
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, 241
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -241
; RV64I-NEXT:    and a0, a0, a2
; RV64I-NEXT:    or a0, a1, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: grev4_i64:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    rev4.b a0, a0
; RV64IB-NEXT:    ret
;
; RV64IBP-LABEL: grev4_i64:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    rev4.b a0, a0
; RV64IBP-NEXT:    ret
  %and = shl i64 %a, 4
  %shl = and i64 %and, -1085102592571150096
  %and1 = lshr i64 %a, 4
  %shr = and i64 %and1, 1085102592571150095
  %or = or i64 %shl, %shr
  ret i64 %or
}

define signext i32 @grev8_i32(i32 signext %a) nounwind {
; RV64I-LABEL: grev8_i32:
; RV64I:       # %bb.0:
; RV64I-NEXT:    slli a1, a0, 8
; RV64I-NEXT:    lui a2, 16
; RV64I-NEXT:    addiw a2, a2, -255
; RV64I-NEXT:    slli a2, a2, 16
; RV64I-NEXT:    addi a2, a2, -256
; RV64I-NEXT:    and a1, a1, a2
; RV64I-NEXT:    srli a0, a0, 8
; RV64I-NEXT:    lui a2, 4080
; RV64I-NEXT:    addiw a2, a2, 255
; RV64I-NEXT:    and a0, a0, a2
; RV64I-NEXT:    or a0, a1, a0
; RV64I-NEXT:    sext.w a0, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: grev8_i32:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    greviw a0, a0, 8
; RV64IB-NEXT:    ret
;
; RV64IBP-LABEL: grev8_i32:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    greviw a0, a0, 8
; RV64IBP-NEXT:    ret
  %and = shl i32 %a, 8
  %shl = and i32 %and, -16711936
  %and1 = lshr i32 %a, 8
  %shr = and i32 %and1, 16711935
  %or = or i32 %shl, %shr
  ret i32 %or
}

define i64 @grev8_i64(i64 %a) nounwind {
; RV64I-LABEL: grev8_i64:
; RV64I:       # %bb.0:
; RV64I-NEXT:    slli a1, a0, 8
; RV64I-NEXT:    lui a2, 1044496
; RV64I-NEXT:    addiw a2, a2, -255
; RV64I-NEXT:    slli a2, a2, 16
; RV64I-NEXT:    addi a2, a2, -255
; RV64I-NEXT:    slli a2, a2, 16
; RV64I-NEXT:    addi a2, a2, -256
; RV64I-NEXT:    and a1, a1, a2
; RV64I-NEXT:    srli a0, a0, 8
; RV64I-NEXT:    lui a2, 4080
; RV64I-NEXT:    addiw a2, a2, 255
; RV64I-NEXT:    slli a2, a2, 16
; RV64I-NEXT:    addi a2, a2, 255
; RV64I-NEXT:    slli a2, a2, 16
; RV64I-NEXT:    addi a2, a2, 255
; RV64I-NEXT:    and a0, a0, a2
; RV64I-NEXT:    or a0, a1, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: grev8_i64:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    rev8.h a0, a0
; RV64IB-NEXT:    ret
;
; RV64IBP-LABEL: grev8_i64:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    rev8.h a0, a0
; RV64IBP-NEXT:    ret
  %and = shl i64 %a, 8
  %shl = and i64 %and, -71777214294589696
  %and1 = lshr i64 %a, 8
  %shr = and i64 %and1, 71777214294589695
  %or = or i64 %shl, %shr
  ret i64 %or
}

define signext i32 @grev16_i32(i32 signext %a) nounwind {
; RV64I-LABEL: grev16_i32:
; RV64I:       # %bb.0:
; RV64I-NEXT:    slli a1, a0, 16
; RV64I-NEXT:    srliw a0, a0, 16
; RV64I-NEXT:    or a0, a1, a0
; RV64I-NEXT:    sext.w a0, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: grev16_i32:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    greviw a0, a0, 16
; RV64IB-NEXT:    ret
;
; RV64IBP-LABEL: grev16_i32:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    greviw a0, a0, 16
; RV64IBP-NEXT:    ret
  %shl = shl i32 %a, 16
  %shr = lshr i32 %a, 16
  %or = or i32 %shl, %shr
  ret i32 %or
}

define i64 @grev16_i64(i64 %a) nounwind {
; RV64I-LABEL: grev16_i64:
; RV64I:       # %bb.0:
; RV64I-NEXT:    slli a1, a0, 16
; RV64I-NEXT:    lui a2, 1048560
; RV64I-NEXT:    addiw a2, a2, 1
; RV64I-NEXT:    slli a2, a2, 16
; RV64I-NEXT:    addi a2, a2, -1
; RV64I-NEXT:    slli a2, a2, 16
; RV64I-NEXT:    and a1, a1, a2
; RV64I-NEXT:    srli a0, a0, 16
; RV64I-NEXT:    lui a2, 16
; RV64I-NEXT:    addiw a2, a2, -1
; RV64I-NEXT:    slli a2, a2, 16
; RV64I-NEXT:    addi a2, a2, 1
; RV64I-NEXT:    slli a2, a2, 16
; RV64I-NEXT:    addi a2, a2, -1
; RV64I-NEXT:    and a0, a0, a2
; RV64I-NEXT:    or a0, a1, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: grev16_i64:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    rev16.w a0, a0
; RV64IB-NEXT:    ret
;
; RV64IBP-LABEL: grev16_i64:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    rev16.w a0, a0
; RV64IBP-NEXT:    ret
  %and = shl i64 %a, 16
  %shl = and i64 %and, -281470681808896
  %and1 = lshr i64 %a, 16
  %shr = and i64 %and1, 281470681808895
  %or = or i64 %shl, %shr
  ret i64 %or
}

define i64 @grev32(i64 %a) nounwind {
; RV64I-LABEL: grev32:
; RV64I:       # %bb.0:
; RV64I-NEXT:    slli a1, a0, 32
; RV64I-NEXT:    srli a0, a0, 32
; RV64I-NEXT:    or a0, a1, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: grev32:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    rori a0, a0, 32
; RV64IB-NEXT:    ret
;
; RV64IBP-LABEL: grev32:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    rori a0, a0, 32
; RV64IBP-NEXT:    ret
  %shl = shl i64 %a, 32
  %shr = lshr i64 %a, 32
  %or = or i64 %shl, %shr
  ret i64 %or
}

declare i32 @llvm.bswap.i32(i32)

define signext i32 @bswap_i32(i32 signext %a) nounwind {
; RV64I-LABEL: bswap_i32:
; RV64I:       # %bb.0:
; RV64I-NEXT:    slli a1, a0, 8
; RV64I-NEXT:    addi a2, zero, 255
; RV64I-NEXT:    slli a3, a2, 32
; RV64I-NEXT:    and a1, a1, a3
; RV64I-NEXT:    slli a3, a0, 24
; RV64I-NEXT:    slli a4, a2, 40
; RV64I-NEXT:    and a3, a3, a4
; RV64I-NEXT:    or a1, a3, a1
; RV64I-NEXT:    slli a3, a0, 40
; RV64I-NEXT:    slli a2, a2, 48
; RV64I-NEXT:    and a2, a3, a2
; RV64I-NEXT:    slli a0, a0, 56
; RV64I-NEXT:    or a0, a0, a2
; RV64I-NEXT:    or a0, a0, a1
; RV64I-NEXT:    srai a0, a0, 32
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: bswap_i32:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    greviw a0, a0, 24
; RV64IB-NEXT:    ret
;
; RV64IBP-LABEL: bswap_i32:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    greviw a0, a0, 24
; RV64IBP-NEXT:    ret
  %1 = tail call i32 @llvm.bswap.i32(i32 %a)
  ret i32 %1
}

declare i64 @llvm.bswap.i64(i64)

define i64 @bswap_i64(i64 %a) {
; RV64I-LABEL: bswap_i64:
; RV64I:       # %bb.0:
; RV64I-NEXT:    srli a1, a0, 24
; RV64I-NEXT:    lui a2, 4080
; RV64I-NEXT:    and a1, a1, a2
; RV64I-NEXT:    srli a2, a0, 8
; RV64I-NEXT:    addi a3, zero, 255
; RV64I-NEXT:    slli a4, a3, 24
; RV64I-NEXT:    and a2, a2, a4
; RV64I-NEXT:    or a1, a2, a1
; RV64I-NEXT:    srli a2, a0, 40
; RV64I-NEXT:    lui a4, 16
; RV64I-NEXT:    addiw a4, a4, -256
; RV64I-NEXT:    and a2, a2, a4
; RV64I-NEXT:    srli a4, a0, 56
; RV64I-NEXT:    or a2, a2, a4
; RV64I-NEXT:    or a1, a1, a2
; RV64I-NEXT:    slli a2, a0, 8
; RV64I-NEXT:    slli a4, a3, 32
; RV64I-NEXT:    and a2, a2, a4
; RV64I-NEXT:    slli a4, a0, 24
; RV64I-NEXT:    slli a5, a3, 40
; RV64I-NEXT:    and a4, a4, a5
; RV64I-NEXT:    or a2, a4, a2
; RV64I-NEXT:    slli a4, a0, 40
; RV64I-NEXT:    slli a3, a3, 48
; RV64I-NEXT:    and a3, a4, a3
; RV64I-NEXT:    slli a0, a0, 56
; RV64I-NEXT:    or a0, a0, a3
; RV64I-NEXT:    or a0, a0, a2
; RV64I-NEXT:    or a0, a0, a1
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: bswap_i64:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    rev8 a0, a0
; RV64IB-NEXT:    ret
;
; RV64IBP-LABEL: bswap_i64:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    rev8 a0, a0
; RV64IBP-NEXT:    ret
  %1 = call i64 @llvm.bswap.i64(i64 %a)
  ret i64 %1
}

declare i32 @llvm.bitreverse.i32(i32)

define signext i32 @bitreverse_i32(i32 signext %a) nounwind {
; RV64I-LABEL: bitreverse_i32:
; RV64I:       # %bb.0:
; RV64I-NEXT:    srli a1, a0, 24
; RV64I-NEXT:    lui a2, 4080
; RV64I-NEXT:    and a1, a1, a2
; RV64I-NEXT:    srli a2, a0, 8
; RV64I-NEXT:    addi a3, zero, 255
; RV64I-NEXT:    slli a4, a3, 24
; RV64I-NEXT:    and a2, a2, a4
; RV64I-NEXT:    or a1, a2, a1
; RV64I-NEXT:    srli a2, a0, 40
; RV64I-NEXT:    lui a4, 16
; RV64I-NEXT:    addiw a4, a4, -256
; RV64I-NEXT:    and a2, a2, a4
; RV64I-NEXT:    srli a4, a0, 56
; RV64I-NEXT:    or a2, a2, a4
; RV64I-NEXT:    or a1, a1, a2
; RV64I-NEXT:    slli a2, a0, 8
; RV64I-NEXT:    slli a4, a3, 32
; RV64I-NEXT:    and a2, a2, a4
; RV64I-NEXT:    slli a4, a0, 24
; RV64I-NEXT:    slli a5, a3, 40
; RV64I-NEXT:    and a4, a4, a5
; RV64I-NEXT:    or a2, a4, a2
; RV64I-NEXT:    slli a4, a0, 40
; RV64I-NEXT:    slli a3, a3, 48
; RV64I-NEXT:    and a3, a4, a3
; RV64I-NEXT:    slli a0, a0, 56
; RV64I-NEXT:    or a0, a0, a3
; RV64I-NEXT:    or a0, a0, a2
; RV64I-NEXT:    or a0, a0, a1
; RV64I-NEXT:    lui a1, 3855
; RV64I-NEXT:    addiw a1, a1, 241
; RV64I-NEXT:    slli a1, a1, 12
; RV64I-NEXT:    addi a1, a1, -241
; RV64I-NEXT:    slli a1, a1, 12
; RV64I-NEXT:    addi a1, a1, 241
; RV64I-NEXT:    slli a1, a1, 12
; RV64I-NEXT:    addi a1, a1, -241
; RV64I-NEXT:    and a1, a0, a1
; RV64I-NEXT:    slli a1, a1, 4
; RV64I-NEXT:    lui a2, 1044721
; RV64I-NEXT:    addiw a2, a2, -241
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, 241
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -241
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, 240
; RV64I-NEXT:    and a0, a0, a2
; RV64I-NEXT:    srli a0, a0, 4
; RV64I-NEXT:    or a0, a0, a1
; RV64I-NEXT:    lui a1, 13107
; RV64I-NEXT:    addiw a1, a1, 819
; RV64I-NEXT:    slli a1, a1, 12
; RV64I-NEXT:    addi a1, a1, 819
; RV64I-NEXT:    slli a1, a1, 12
; RV64I-NEXT:    addi a1, a1, 819
; RV64I-NEXT:    slli a1, a1, 12
; RV64I-NEXT:    addi a1, a1, 819
; RV64I-NEXT:    and a1, a0, a1
; RV64I-NEXT:    slli a1, a1, 2
; RV64I-NEXT:    lui a2, 1035469
; RV64I-NEXT:    addiw a2, a2, -819
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -819
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -819
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -820
; RV64I-NEXT:    and a0, a0, a2
; RV64I-NEXT:    srli a0, a0, 2
; RV64I-NEXT:    or a0, a0, a1
; RV64I-NEXT:    lui a1, 349525
; RV64I-NEXT:    addiw a1, a1, 1365
; RV64I-NEXT:    slli a1, a1, 32
; RV64I-NEXT:    and a1, a0, a1
; RV64I-NEXT:    slli a1, a1, 1
; RV64I-NEXT:    lui a2, 873813
; RV64I-NEXT:    addiw a2, a2, 1365
; RV64I-NEXT:    slli a2, a2, 33
; RV64I-NEXT:    and a0, a0, a2
; RV64I-NEXT:    srli a0, a0, 1
; RV64I-NEXT:    or a0, a0, a1
; RV64I-NEXT:    srai a0, a0, 32
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: bitreverse_i32:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    greviw a0, a0, 31
; RV64IB-NEXT:    ret
;
; RV64IBP-LABEL: bitreverse_i32:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    greviw a0, a0, 31
; RV64IBP-NEXT:    ret
  %1 = tail call i32 @llvm.bitreverse.i32(i32 %a)
  ret i32 %1
}

declare i64 @llvm.bitreverse.i64(i64)

define i64 @bitreverse_i64(i64 %a) nounwind {
; RV64I-LABEL: bitreverse_i64:
; RV64I:       # %bb.0:
; RV64I-NEXT:    srli a1, a0, 24
; RV64I-NEXT:    lui a2, 4080
; RV64I-NEXT:    and a1, a1, a2
; RV64I-NEXT:    srli a2, a0, 8
; RV64I-NEXT:    addi a3, zero, 255
; RV64I-NEXT:    slli a4, a3, 24
; RV64I-NEXT:    and a2, a2, a4
; RV64I-NEXT:    or a1, a2, a1
; RV64I-NEXT:    srli a2, a0, 40
; RV64I-NEXT:    lui a4, 16
; RV64I-NEXT:    addiw a4, a4, -256
; RV64I-NEXT:    and a2, a2, a4
; RV64I-NEXT:    srli a4, a0, 56
; RV64I-NEXT:    or a2, a2, a4
; RV64I-NEXT:    or a1, a1, a2
; RV64I-NEXT:    slli a2, a0, 8
; RV64I-NEXT:    slli a4, a3, 32
; RV64I-NEXT:    and a2, a2, a4
; RV64I-NEXT:    slli a4, a0, 24
; RV64I-NEXT:    slli a5, a3, 40
; RV64I-NEXT:    and a4, a4, a5
; RV64I-NEXT:    or a2, a4, a2
; RV64I-NEXT:    slli a4, a0, 40
; RV64I-NEXT:    slli a3, a3, 48
; RV64I-NEXT:    and a3, a4, a3
; RV64I-NEXT:    slli a0, a0, 56
; RV64I-NEXT:    or a0, a0, a3
; RV64I-NEXT:    or a0, a0, a2
; RV64I-NEXT:    or a0, a0, a1
; RV64I-NEXT:    lui a1, 3855
; RV64I-NEXT:    addiw a1, a1, 241
; RV64I-NEXT:    slli a1, a1, 12
; RV64I-NEXT:    addi a1, a1, -241
; RV64I-NEXT:    slli a1, a1, 12
; RV64I-NEXT:    addi a1, a1, 241
; RV64I-NEXT:    slli a1, a1, 12
; RV64I-NEXT:    addi a1, a1, -241
; RV64I-NEXT:    and a1, a0, a1
; RV64I-NEXT:    slli a1, a1, 4
; RV64I-NEXT:    lui a2, 1044721
; RV64I-NEXT:    addiw a2, a2, -241
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, 241
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -241
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, 240
; RV64I-NEXT:    and a0, a0, a2
; RV64I-NEXT:    srli a0, a0, 4
; RV64I-NEXT:    or a0, a0, a1
; RV64I-NEXT:    lui a1, 13107
; RV64I-NEXT:    addiw a1, a1, 819
; RV64I-NEXT:    slli a1, a1, 12
; RV64I-NEXT:    addi a1, a1, 819
; RV64I-NEXT:    slli a1, a1, 12
; RV64I-NEXT:    addi a1, a1, 819
; RV64I-NEXT:    slli a1, a1, 12
; RV64I-NEXT:    addi a1, a1, 819
; RV64I-NEXT:    and a1, a0, a1
; RV64I-NEXT:    slli a1, a1, 2
; RV64I-NEXT:    lui a2, 1035469
; RV64I-NEXT:    addiw a2, a2, -819
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -819
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -819
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -820
; RV64I-NEXT:    and a0, a0, a2
; RV64I-NEXT:    srli a0, a0, 2
; RV64I-NEXT:    or a0, a0, a1
; RV64I-NEXT:    lui a1, 21845
; RV64I-NEXT:    addiw a1, a1, 1365
; RV64I-NEXT:    slli a1, a1, 12
; RV64I-NEXT:    addi a1, a1, 1365
; RV64I-NEXT:    slli a1, a1, 12
; RV64I-NEXT:    addi a1, a1, 1365
; RV64I-NEXT:    slli a1, a1, 12
; RV64I-NEXT:    addi a1, a1, 1365
; RV64I-NEXT:    and a1, a0, a1
; RV64I-NEXT:    slli a1, a1, 1
; RV64I-NEXT:    lui a2, 1026731
; RV64I-NEXT:    addiw a2, a2, -1365
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -1365
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -1365
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -1366
; RV64I-NEXT:    and a0, a0, a2
; RV64I-NEXT:    srli a0, a0, 1
; RV64I-NEXT:    or a0, a0, a1
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: bitreverse_i64:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    rev a0, a0
; RV64IB-NEXT:    ret
;
; RV64IBP-LABEL: bitreverse_i64:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    rev a0, a0
; RV64IBP-NEXT:    ret
  %1 = call i64 @llvm.bitreverse.i64(i64 %a)
  ret i64 %1
}

; There's no [un]shfliw instruction as slliu.w occupies the encoding slot that
; would be occupied by shfliw.

define i64 @shfl1_i64(i64 %a, i64 %b) nounwind {
; RV64I-LABEL: shfl1_i64:
; RV64I:       # %bb.0:
; RV64I-NEXT:    lui a1, 1035469
; RV64I-NEXT:    addiw a1, a1, -819
; RV64I-NEXT:    slli a1, a1, 12
; RV64I-NEXT:    addi a1, a1, -819
; RV64I-NEXT:    slli a1, a1, 12
; RV64I-NEXT:    addi a1, a1, -819
; RV64I-NEXT:    slli a1, a1, 13
; RV64I-NEXT:    addi a1, a1, -1639
; RV64I-NEXT:    and a1, a0, a1
; RV64I-NEXT:    slli a2, a0, 1
; RV64I-NEXT:    lui a3, 4369
; RV64I-NEXT:    addiw a3, a3, 273
; RV64I-NEXT:    slli a3, a3, 12
; RV64I-NEXT:    addi a3, a3, 273
; RV64I-NEXT:    slli a3, a3, 12
; RV64I-NEXT:    addi a3, a3, 273
; RV64I-NEXT:    slli a4, a3, 14
; RV64I-NEXT:    addi a4, a4, 1092
; RV64I-NEXT:    and a2, a2, a4
; RV64I-NEXT:    or a1, a2, a1
; RV64I-NEXT:    srli a0, a0, 1
; RV64I-NEXT:    slli a2, a3, 13
; RV64I-NEXT:    addi a2, a2, 546
; RV64I-NEXT:    and a0, a0, a2
; RV64I-NEXT:    or a0, a1, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: shfl1_i64:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    zip.n a0, a0
; RV64IB-NEXT:    ret
;
; RV64IBP-LABEL: shfl1_i64:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    zip.n a0, a0
; RV64IBP-NEXT:    ret
  %and = and i64 %a, -7378697629483820647
  %shl = shl i64 %a, 1
  %and1 = and i64 %shl, 4919131752989213764
  %or = or i64 %and1, %and
  %shr = lshr i64 %a, 1
  %and2 = and i64 %shr, 2459565876494606882
  %or3 = or i64 %or, %and2
  ret i64 %or3
}

define i64 @shfl2_i64(i64 %a, i64 %b) nounwind {
; RV64I-LABEL: shfl2_i64:
; RV64I:       # %bb.0:
; RV64I-NEXT:    lui a1, 1044721
; RV64I-NEXT:    addiw a1, a1, -241
; RV64I-NEXT:    slli a1, a1, 12
; RV64I-NEXT:    addi a1, a1, 241
; RV64I-NEXT:    slli a1, a1, 12
; RV64I-NEXT:    addi a1, a1, -241
; RV64I-NEXT:    slli a1, a1, 14
; RV64I-NEXT:    addi a1, a1, 963
; RV64I-NEXT:    and a1, a0, a1
; RV64I-NEXT:    slli a2, a0, 2
; RV64I-NEXT:    lui a3, 48
; RV64I-NEXT:    addiw a3, a3, 771
; RV64I-NEXT:    slli a3, a3, 16
; RV64I-NEXT:    addi a3, a3, 771
; RV64I-NEXT:    slli a4, a3, 16
; RV64I-NEXT:    addi a4, a4, 771
; RV64I-NEXT:    slli a4, a4, 12
; RV64I-NEXT:    addi a4, a4, 48
; RV64I-NEXT:    and a2, a2, a4
; RV64I-NEXT:    or a1, a2, a1
; RV64I-NEXT:    srli a0, a0, 2
; RV64I-NEXT:    slli a2, a3, 14
; RV64I-NEXT:    addi a2, a2, 193
; RV64I-NEXT:    slli a2, a2, 12
; RV64I-NEXT:    addi a2, a2, -1012
; RV64I-NEXT:    and a0, a0, a2
; RV64I-NEXT:    or a0, a1, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: shfl2_i64:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    zip2.b a0, a0
; RV64IB-NEXT:    ret
;
; RV64IBP-LABEL: shfl2_i64:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    zip2.b a0, a0
; RV64IBP-NEXT:    ret
  %and = and i64 %a, -4340410370284600381
  %shl = shl i64 %a, 2
  %and1 = and i64 %shl, 3472328296227680304
  %or = or i64 %and1, %and
  %shr = lshr i64 %a, 2
  %and2 = and i64 %shr, 868082074056920076
  %or3 = or i64 %or, %and2
  ret i64 %or3
}

define i64 @shfl4_i64(i64 %a, i64 %b) nounwind {
; RV64I-LABEL: shfl4_i64:
; RV64I:       # %bb.0:
; RV64I-NEXT:    lui a1, 1048560
; RV64I-NEXT:    addiw a1, a1, 255
; RV64I-NEXT:    slli a1, a1, 16
; RV64I-NEXT:    addi a1, a1, 255
; RV64I-NEXT:    slli a1, a1, 16
; RV64I-NEXT:    addi a1, a1, 255
; RV64I-NEXT:    slli a1, a1, 12
; RV64I-NEXT:    addi a1, a1, 15
; RV64I-NEXT:    and a1, a0, a1
; RV64I-NEXT:    slli a2, a0, 4
; RV64I-NEXT:    lui a3, 240
; RV64I-NEXT:    addiw a3, a3, 15
; RV64I-NEXT:    slli a3, a3, 16
; RV64I-NEXT:    addi a3, a3, 15
; RV64I-NEXT:    slli a4, a3, 12
; RV64I-NEXT:    addi a4, a4, 1
; RV64I-NEXT:    slli a4, a4, 12
; RV64I-NEXT:    addi a4, a4, -256
; RV64I-NEXT:    and a2, a2, a4
; RV64I-NEXT:    or a1, a2, a1
; RV64I-NEXT:    srli a0, a0, 4
; RV64I-NEXT:    slli a2, a3, 20
; RV64I-NEXT:    addi a2, a2, 240
; RV64I-NEXT:    and a0, a0, a2
; RV64I-NEXT:    or a0, a1, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: shfl4_i64:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    zip4.h a0, a0
; RV64IB-NEXT:    ret
;
; RV64IBP-LABEL: shfl4_i64:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    zip4.h a0, a0
; RV64IBP-NEXT:    ret
  %and = and i64 %a, -1148435428713435121
  %shl = shl i64 %a, 4
  %and1 = and i64 %shl, 1080880403494997760
  %or = or i64 %and1, %and
  %shr = lshr i64 %a, 4
  %and2 = and i64 %shr, 67555025218437360
  %or3 = or i64 %or, %and2
  ret i64 %or3
}

define i64 @shfl8_i64(i64 %a, i64 %b) nounwind {
; RV64I-LABEL: shfl8_i64:
; RV64I:       # %bb.0:
; RV64I-NEXT:    lui a1, 1048560
; RV64I-NEXT:    addiw a1, a1, 1
; RV64I-NEXT:    slli a1, a1, 16
; RV64I-NEXT:    addi a1, a1, -1
; RV64I-NEXT:    slli a1, a1, 24
; RV64I-NEXT:    addi a1, a1, 255
; RV64I-NEXT:    and a1, a0, a1
; RV64I-NEXT:    slli a2, a0, 8
; RV64I-NEXT:    addi a3, zero, 255
; RV64I-NEXT:    slli a4, a3, 32
; RV64I-NEXT:    addi a4, a4, 255
; RV64I-NEXT:    slli a4, a4, 16
; RV64I-NEXT:    and a2, a2, a4
; RV64I-NEXT:    or a1, a2, a1
; RV64I-NEXT:    srli a0, a0, 8
; RV64I-NEXT:    slli a2, a3, 24
; RV64I-NEXT:    addi a2, a2, 1
; RV64I-NEXT:    slli a2, a2, 16
; RV64I-NEXT:    addi a2, a2, -256
; RV64I-NEXT:    and a0, a0, a2
; RV64I-NEXT:    or a0, a1, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: shfl8_i64:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    zip8.w a0, a0
; RV64IB-NEXT:    ret
;
; RV64IBP-LABEL: shfl8_i64:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    zip8.w a0, a0
; RV64IBP-NEXT:    ret
  %and = and i64 %a, -72056494543077121
  %shl = shl i64 %a, 8
  %and1 = and i64 %shl, 71776119077928960
  %or = or i64 %and1, %and
  %shr = lshr i64 %a, 8
  %and2 = and i64 %shr, 280375465148160
  %or3 = or i64 %or, %and2
  ret i64 %or3
}

define i64 @shfl16(i64 %a, i64 %b) nounwind {
; RV64I-LABEL: shfl16:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi a1, zero, -1
; RV64I-NEXT:    slli a1, a1, 32
; RV64I-NEXT:    addi a1, a1, 1
; RV64I-NEXT:    slli a1, a1, 16
; RV64I-NEXT:    addi a1, a1, -1
; RV64I-NEXT:    and a1, a0, a1
; RV64I-NEXT:    slli a2, a0, 16
; RV64I-NEXT:    lui a3, 16
; RV64I-NEXT:    addiw a3, a3, -1
; RV64I-NEXT:    slli a4, a3, 32
; RV64I-NEXT:    and a2, a2, a4
; RV64I-NEXT:    or a1, a2, a1
; RV64I-NEXT:    srli a0, a0, 16
; RV64I-NEXT:    slli a2, a3, 16
; RV64I-NEXT:    and a0, a0, a2
; RV64I-NEXT:    or a0, a1, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: shfl16:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    zip16 a0, a0
; RV64IB-NEXT:    ret
;
; RV64IBP-LABEL: shfl16:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    zip16 a0, a0
; RV64IBP-NEXT:    ret
  %and = and i64 %a, -281474976645121
  %shl = shl i64 %a, 16
  %and1 = and i64 %shl, 281470681743360
  %or = or i64 %and1, %and
  %shr = lshr i64 %a, 16
  %and2 = and i64 %shr, 4294901760
  %or3 = or i64 %or, %and2
  ret i64 %or3
}

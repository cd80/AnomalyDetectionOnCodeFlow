# NOTE: Assertions have been autogenerated by utils/update_mca_test_checks.py
# RUN: llvm-mca -march=aarch64 -mcpu=exynos-m3 -resource-pressure=false -noalias=false < %s | FileCheck %s -check-prefixes=ALL,M3
# RUN: llvm-mca -march=aarch64 -mcpu=exynos-m4 -resource-pressure=false -noalias=false < %s | FileCheck %s -check-prefixes=ALL,M4
# RUN: llvm-mca -march=aarch64 -mcpu=exynos-m5 -resource-pressure=false -noalias=false < %s | FileCheck %s -check-prefixes=ALL,M5

stur	d0, [sp, #2]
stur	q0, [sp, #16]

str	b0, [sp], #1
str	q0, [sp], #16

str	h0, [sp, #2]!
str	q0, [sp, #16]!

str	s0, [sp, #4]
str	q0, [sp, #16]

str	d0, [sp, x0, lsl #3]
str	q0, [sp, x0, lsl #4]

str	b0, [sp, x0]
str	q0, [sp, x0]

str	h0, [sp, w0, sxtw #1]
str	q0, [sp, w0, uxtw #4]

str	s0, [sp, w0, sxtw]
str	q0, [sp, w0, uxtw]

stp	d0, d1, [sp], #16
stp	q0, q1, [sp], #32

stp	s0, s1, [sp, #8]!
stp	q0, q1, [sp, #32]!

stp	d0, d1, [sp, #16]
stp	q0, q1, [sp, #32]

# ALL:      Iterations:        100
# ALL-NEXT: Instructions:      2200

# M3-NEXT:  Total Cycles:      3203
# M3-NEXT:  Total uOps:        2900

# M4-NEXT:  Total Cycles:      3203
# M4-NEXT:  Total uOps:        3000

# M5-NEXT:  Total Cycles:      2803
# M5-NEXT:  Total uOps:        2500

# ALL:      Dispatch Width:    6

# M3-NEXT:  uOps Per Cycle:    0.91
# M3-NEXT:  IPC:               0.69
# M3-NEXT:  Block RThroughput: 22.0

# M4-NEXT:  uOps Per Cycle:    0.94
# M4-NEXT:  IPC:               0.69
# M4-NEXT:  Block RThroughput: 12.5

# M5-NEXT:  uOps Per Cycle:    0.89
# M5-NEXT:  IPC:               0.78
# M5-NEXT:  Block RThroughput: 11.0

# ALL:      Instruction Info:
# ALL-NEXT: [1]: #uOps
# ALL-NEXT: [2]: Latency
# ALL-NEXT: [3]: RThroughput
# ALL-NEXT: [4]: MayLoad
# ALL-NEXT: [5]: MayStore
# ALL-NEXT: [6]: HasSideEffects (U)

# ALL:      [1]    [2]    [3]    [4]    [5]    [6]    Instructions:

# M3-NEXT:   1      1     1.00           *            stur	d0, [sp, #2]
# M3-NEXT:   1      1     1.00           *            stur	q0, [sp, #16]
# M3-NEXT:   1      1     1.00           *            str	b0, [sp], #1
# M3-NEXT:   1      1     1.00           *            str	q0, [sp], #16
# M3-NEXT:   1      1     1.00           *            str	h0, [sp, #2]!
# M3-NEXT:   1      1     1.00           *            str	q0, [sp, #16]!
# M3-NEXT:   1      1     1.00           *            str	s0, [sp, #4]
# M3-NEXT:   1      1     1.00           *            str	q0, [sp, #16]
# M3-NEXT:   1      1     1.00           *            str	d0, [sp, x0, lsl #3]
# M3-NEXT:   2      3     1.00           *            str	q0, [sp, x0, lsl #4]
# M3-NEXT:   1      1     1.00           *            str	b0, [sp, x0]
# M3-NEXT:   1      1     1.00           *            str	q0, [sp, x0]
# M3-NEXT:   2      3     1.00           *            str	h0, [sp, w0, sxtw #1]
# M3-NEXT:   2      3     1.00           *            str	q0, [sp, w0, uxtw #4]
# M3-NEXT:   2      3     1.00           *            str	s0, [sp, w0, sxtw]
# M3-NEXT:   2      3     1.00           *            str	q0, [sp, w0, uxtw]
# M3-NEXT:   1      1     1.00           *            stp	d0, d1, [sp], #16
# M3-NEXT:   2      1     1.00           *            stp	q0, q1, [sp], #32
# M3-NEXT:   1      1     1.00           *            stp	s0, s1, [sp, #8]!
# M3-NEXT:   2      1     1.00           *            stp	q0, q1, [sp, #32]!
# M3-NEXT:   1      1     1.00           *            stp	d0, d1, [sp, #16]
# M3-NEXT:   1      1     1.00           *            stp	q0, q1, [sp, #32]

# M4-NEXT:   1      1     0.50           *            stur	d0, [sp, #2]
# M4-NEXT:   1      1     0.50           *            stur	q0, [sp, #16]
# M4-NEXT:   1      1     0.50           *            str	b0, [sp], #1
# M4-NEXT:   1      1     0.50           *            str	q0, [sp], #16
# M4-NEXT:   1      1     0.50           *            str	h0, [sp, #2]!
# M4-NEXT:   1      1     0.50           *            str	q0, [sp, #16]!
# M4-NEXT:   1      1     0.50           *            str	s0, [sp, #4]
# M4-NEXT:   1      1     0.50           *            str	q0, [sp, #16]
# M4-NEXT:   1      1     0.50           *            str	d0, [sp, x0, lsl #3]
# M4-NEXT:   2      3     0.50           *            str	q0, [sp, x0, lsl #4]
# M4-NEXT:   1      1     0.50           *            str	b0, [sp, x0]
# M4-NEXT:   1      1     0.50           *            str	q0, [sp, x0]
# M4-NEXT:   2      3     0.50           *            str	h0, [sp, w0, sxtw #1]
# M4-NEXT:   2      3     0.50           *            str	q0, [sp, w0, uxtw #4]
# M4-NEXT:   2      3     0.50           *            str	s0, [sp, w0, sxtw]
# M4-NEXT:   2      3     0.50           *            str	q0, [sp, w0, uxtw]
# M4-NEXT:   1      1     0.50           *            stp	d0, d1, [sp], #16
# M4-NEXT:   2      1     1.00           *            stp	q0, q1, [sp], #32
# M4-NEXT:   1      1     0.50           *            stp	s0, s1, [sp, #8]!
# M4-NEXT:   2      1     1.00           *            stp	q0, q1, [sp, #32]!
# M4-NEXT:   1      1     0.50           *            stp	d0, d1, [sp, #16]
# M4-NEXT:   2      1     1.00           *            stp	q0, q1, [sp, #32]

# M5-NEXT:   1      1     0.50           *            stur	d0, [sp, #2]
# M5-NEXT:   1      1     0.50           *            stur	q0, [sp, #16]
# M5-NEXT:   1      1     0.50           *            str	b0, [sp], #1
# M5-NEXT:   1      1     0.50           *            str	q0, [sp], #16
# M5-NEXT:   1      1     0.50           *            str	h0, [sp, #2]!
# M5-NEXT:   1      1     0.50           *            str	q0, [sp, #16]!
# M5-NEXT:   1      1     0.50           *            str	s0, [sp, #4]
# M5-NEXT:   1      1     0.50           *            str	q0, [sp, #16]
# M5-NEXT:   1      1     0.50           *            str	d0, [sp, x0, lsl #3]
# M5-NEXT:   2      3     0.50           *            str	q0, [sp, x0, lsl #4]
# M5-NEXT:   1      1     0.50           *            str	b0, [sp, x0]
# M5-NEXT:   1      1     0.50           *            str	q0, [sp, x0]
# M5-NEXT:   1      1     0.50           *            str	h0, [sp, w0, sxtw #1]
# M5-NEXT:   2      3     0.50           *            str	q0, [sp, w0, uxtw #4]
# M5-NEXT:   1      1     0.50           *            str	s0, [sp, w0, sxtw]
# M5-NEXT:   2      3     0.50           *            str	q0, [sp, w0, uxtw]
# M5-NEXT:   1      1     0.50           *            stp	d0, d1, [sp], #16
# M5-NEXT:   1      1     1.00           *            stp	q0, q1, [sp], #32
# M5-NEXT:   1      1     0.50           *            stp	s0, s1, [sp, #8]!
# M5-NEXT:   1      1     1.00           *            stp	q0, q1, [sp, #32]!
# M5-NEXT:   1      1     0.50           *            stp	d0, d1, [sp, #16]
# M5-NEXT:   1      1     1.00           *            stp	q0, q1, [sp, #32]

// Test report preset
#import "@local/MetaNote:0.1.0": *

#show: MetaNote.with(
  title: [Parallel and Distributed Computing: Final Report],
  subtitle: [CUDA Optimization Techniques for Tree Reduction],
  author: "John Doe",
  date: "May 2026",
  course: "Parallel and Distributed Computing",
  email: "johndoe@example.com",
  preset: "report",
)

= Introduction

In this report, we explore optimization techniques for tree-based reduction operations on NVIDIA GPUs using CUDA.

== Background

The reduction operation is fundamental to parallel computing. Given an array of $n$ elements and an associative binary operator $plus.circle$, reduction computes
$
  a_0 plus.circle a_1 plus.circle dots.c plus.circle a_(n-1).
$

== Motivation

Standard sequential reduction runs in $O(n)$ time. A parallel tree reduction achieves $O(n / p + log p)$ with $p$ processors.

= Implementation

== Naive Kernel

#definition(title: "Work Efficiency")[
  A parallel algorithm is _work-efficient_ if its total work $W(n)$ matches the sequential complexity $O(n)$.
]

== Optimized Kernel

#theorem(title: "Bank Conflict Avoidance")[
  By padding shared memory with stride $s = 32$, bank conflicts are eliminated for all warp sizes.
]

#proof[
  Each thread accesses memory at offset $t + floor(t / 32)$, which distributes across all 32 banks.
]

= Results

Our optimized kernel achieves $3.2 times$ speedup over the naive implementation on an RTX 4090.

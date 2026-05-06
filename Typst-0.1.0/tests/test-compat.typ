// Test backward compatibility with 0.0.2 API
#import "@local/MetaNote:0.1.0": *

#let my_name = "John Doe"
#let my_email = "johndoe@example.com"

#show: doc => MetaNote(
  title: [Introduction to Theory of Computation, Homework 4],
  authors: (
    (
      name: my_name,
      affiliation: "May 3, 2026",
      email: my_email,
    ),
  ),
  head_numbering: none,
  doc,
)

= Problem 1

#proof[
  (a) We show the $"NP"$-completeness by reducing $"3SAT"$ to it. For an instance $phi$ of $"3SAT"$, for each clause $C = (x_1 or x_2 or x_3)$, we introduce fresh variables to pad.

  (b) Polynomial reduction from $"SAT"$: introduce $m$ new variables $z_0, ..., z_(m-1)$ such that $2^m >= k > 2^(m-1)$.
]

= Problem 2

#solution[
  First we observe that the language is in $"PSPACE"$. Given an instance, we simulate the TM on a tape section of size $n$ with $O(n)$ space.

  Next we show hardness by a polynomial-time reduction.
]

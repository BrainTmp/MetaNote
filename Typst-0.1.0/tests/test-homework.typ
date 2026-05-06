#import "@local/MetaNote:0.1.0": *

#show: MetaNote.with(
  title: [Algorithm Design and Analysis, Assignment 4],
  author: "John Doe",
  date: "Apr 7, 2026",
  email: "johndoe@example.com",
  preset: "homework",
  heading-supplement: [Exercise],
)

= 3.14 <ex314>

#solution[
  (a) We show the reduction by constructing a polynomial-time mapping. This demonstrates how the sub-problem marker flows inline with the solution prefix, without causing an awkward line break.

  (b) For the second part, consider the following LP and its dual formulation. The key insight is that strong duality gives us the separating hyperplane directly.
]

= 3.17 <ex317>

#solution[
  #parts[
    We show the reduction by constructing a polynomial-time mapping. This is a long paragraph that demonstrates the `parts` environment.
  ][
    For the second part, consider the following LP and its dual formulation.
  ][
    The third part follows from complementary slackness.
  ]
]

= 3.21 <ex321>

#proof[
  We proceed by induction on $n$. The base case $n = 1$ is trivial.

  For the inductive step, assume the claim holds for $n - 1$. Then
  $
    f(n) = 2 f(n-1) + n <= 2 dot c (n-1)^2 + n <= c n^2
  $
  for $c >= 2$.
]

= 4.5 <ex45>

#solution[
  #parts[
    The dual of the given LP is
    $
      max_(bold(z)) quad -bold(b)^T bold(z) quad "s.t." quad bold(A)^T bold(z) >= 0, quad bold(z) + bold(1) >= 0.
    $
  ][
    The complementary slackness conditions are straightforward.
  ][
    Feasibility: set $bold(x) = bold(0)$, $bold(y) = bold(b)$. Boundedness: $bold(1)^T bold(y) >= 0$.
  ]
]

See @ex314 and @ex321 for the key arguments. Also refer to @ex317 and @ex45.

// Test theorem environments (backward compat with title: ... syntax)
= Appendix

#definition(title: "Convex Set")[
  A set $S subset.eq RR^n$ is _convex_ if for all $x, y in S$ and $lambda in [0,1]$,
  $lambda x + (1 - lambda) y in S$.
]

#theorem(title: "Separating Hyperplane")[
  If $P_1, P_2$ are disjoint convex polytopes, there exists a hyperplane separating them.
]

#proof[
  Follows from LP duality (see Problem 1).
]

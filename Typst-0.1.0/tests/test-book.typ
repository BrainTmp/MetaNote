// Test book preset
#import "@local/MetaNote:0.1.0": *

#show: MetaNote.with(
  title: [Practical Foundations for Programming Languages],
  subtitle: [Course Notes],
  author: "John Doe",
  date: "Fall 2025",
  preset: "book",
)

= Judgments and Rules

== Abstract Syntax

#definition(title: "Abstract Syntax Tree")[
  An _abstract syntax tree_ (AST) is a finite, ordered tree whose leaves are variables and whose interior nodes are operators.
]

We define the set of ASTs inductively by the following rules:

#theorem(title: "Structural Induction")[
  If $P$ holds for all variables, and $P$ is preserved by all operators, then $P$ holds for all ASTs.
]

#proof[
  By induction on the height of the tree.
]

== Inductive Definitions

#definition(title: "Judgment Form")[
  A _judgment form_ is a relation among abstract objects. A _judgment_ (or _instance_) is a particular assertion of this form.
]

= Statics

== Type Systems

A type system assigns types to expressions by means of typing rules.

#definition(title: "Typing Context")[
  A _typing context_ $Gamma$ is a finite mapping from variables to types.
]

#theorem(title: "Unicity of Typing")[
  For every $Gamma$ and $e$, there is at most one $tau$ such that $Gamma tack e : tau$.
]

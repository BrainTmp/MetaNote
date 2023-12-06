#import "metatheorem.typ": *

#let theorem = metamathbox("theorem", "Theorem", rgb(13, 71, 161)) // Material Blue 900
#let example = metamathbox("example", "Example", rgb(51, 105, 30)) // Material Light Green 900
#let corollary = metamathbox("corollary", "Corollary", rgb(26, 35, 126)) // Material Indigo 900
#let note = metamathbox("note", "Note", rgb(0, 77, 64)) // Material Teal 900
#let definition = metamathbox("definition", "Definition", rgb(38, 50, 56)) // Material Blue Grey 900
#let proposition = metamathbox("proposition", "Proposition", rgb(230, 81, 0)) // Material Orange 900
#let question = metamathbox("question", "Question", rgb(26, 35, 126))
#let exercise = metamathbox("exercise", "Exercise", rgb(26, 35, 126))
#let hint = metamathbox("hint", "Hint", rgb(26, 35, 126))
#let lemma = metamathbox("lemma", "Lemma", rgb(51, 105, 30))

#let proof = thmplain(
  "proof",
  "Proof",
  bodyfmt: body => [#body #h(1fr) $square$]
).with(numbering: none)

#let solution = thmplain(
  "solution",
  "Solution",
  bodyfmt: body => [#body #h(1fr) $square$]
).with(numbering: none)


#let MetaNote(
  title: none,
  authors: (),
  doc,
  head_numbering: "1.1.",
  print: false
) = {
  set heading(numbering: head_numbering)

  set align(center)
  text(17pt, title)

  let count = authors.len()
  let ncols = calc.min(count, 3)
  grid(
    columns: (1fr,) * ncols,
    row-gutter: 24pt,
    ..authors.map(author => [
      #author.name \
      #author.affiliation \
      #link("mailto:" + author.email)
    ]),
  )

  set align(left)
  show: thmrules 

  doc
}
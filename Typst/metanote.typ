#import "metatheorem.typ": *

#let theorem = metamathbox("theorem", "Theorem", rgb(13, 71, 161)) // Material Blue 900
#let example = metamathbox("example", "Example", rgb(51, 105, 30)) // Material Light Green 900
#let corollary = metamathbox("corollary", "Corollary", rgb(26, 35, 126)) // Material Indigo 900
#let note = metamathbox("note", "Note", rgb(0, 77, 64)) // Material Teal 900
#let definition = metamathbox("definition", "Definition", rgb(38, 50, 56)) // Material Blue Grey 900
#let proposition = metamathbox("proposition", "Proposition", rgb(230, 81, 0)) // Material Orange 900
#let question = metamathbox("question", "Question", rgb(26, 35, 126))
#let exercise = metamathbox("exercise", "Exercise", rgb(26, 35, 126))
#let exerciseb = metamathbox("exercise", "Exercise", rgb(26, 35, 126)).with(numbering: none)
#let hint = metamathbox("hint", "Hint", rgb(26, 35, 126))
#let lemma = metamathbox("lemma", "Lemma", rgb(51, 105, 30))

#let proof = thmplain(
  "proof",
  "Proof",
  bodyfmt: body => [#body #h(1fr) $square$]
).with(numbering: none)

#let proofsk = thmplain(
  "proofsk",
  "Proof Sketch",
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
  head_mode: "note",
  print: false
) = {
  let head_mode_func = (mode) => {
    if head_mode == "note" {
      return head_numbering
    } else if head_mode == "book" {
      return (..nums) => {
        if nums.pos().len() == 1 {
          return "Chapter " + nums.pos().map(str).join(".") + "" + math.quad
        } else if nums.pos().len() == 2 {
          return "Section " + nums.pos().map(str).join(".") + "" + math.quad
        } else {
          return nums.pos().map(str).join(".")
        }
      }
    }
  }

  set heading(numbering: head_mode_func(head_mode))

  // set par(first-line-indent: 1em, justify: true)

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
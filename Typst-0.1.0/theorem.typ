// Theorem environments with colored left-border boxes.
// Preserves the visual identity from MetaNote 0.0.2 (showybox + great-theorems).

#import "@preview/showybox:2.0.4": showybox
#import "@preview/great-theorems:0.1.2": *
#import "@preview/rich-counters:0.2.2": *

// ============================================================
// Core theorem box builder
// ============================================================

/// Creates a theorem environment with a colored left-border box.
/// Based on showybox + great-theorems for numbering and referencing.
#let _thmbox(
  blocktitle: none,
  counter: none,
  numbering: "1.1",
  color: rgb(38, 50, 56),
  prefix: auto,
  titlix: title => [(#title)],
  suffix: none,
  bodyfmt: body => body,
  ..global_block_args,
) = {
  if prefix == auto {
    if counter == none {
      prefix = [*#blocktitle.*]
    } else {
      prefix = (counter) => [*#blocktitle #counter.*]
    }
  }

  if counter != none and type(counter) != dictionary {
    counter = (
      step: (..args) => { counter.step(..args) },
      get: (..args) => { counter.get(..args) },
      at: (..args) => { counter.at(..args) },
      display: (..args) => { counter.display(..args) },
    )
  }

  if counter != none {
    return (title: none, numbering: numbering, ..local_block_args, body) => {
      figure(kind: "great-theorem-counted", supplement: blocktitle, outlined: false)[
        #(counter.step)()
        #{
          let number = context (counter.display)(numbering)
          showybox(
            ..global_block_args.named(),
            ..local_block_args.named(),
            title-style: (
              color: color,
              sep-thickness: 0pt,
              align: left,
            ),
            frame: (
              title-color: color.lighten(95%),
              border-color: color,
              body-color: color.lighten(95%),
              thickness: (left: 2pt),
              radius: 0pt,
            ),
            title: {
              prefix(number)
              if title != none {
                " " + titlix(title)
              }
            },
          )[
            #bodyfmt(body)
            #suffix
          ]
        }
        #metadata((loc) => { std.numbering(numbering, ..((counter.at)(loc))) })
        #label("great-theorems:numberfunc")
      ]
    }
  } else {
    return (title: none, ..local_block_args, body) => {
      figure(kind: "great-theorem-uncounted", supplement: blocktitle, outlined: false)[
        #showybox(
          ..global_block_args.named(),
          ..local_block_args.named(),
          title-style: (
            color: color,
            sep-thickness: 0pt,
            align: left,
          ),
          frame: (
            title-color: color.lighten(95%),
            border-color: color,
            body-color: color.lighten(95%),
            thickness: (left: 2pt),
            radius: 0pt,
          ),
          title: {
            prefix
            if title != none {
              " " + titlix(title)
            }
          },
        )[
          #bodyfmt(body)
          #suffix
        ]
      ]
    }
  }
}

// ============================================================
// Counter setup — shared counters with 1 level of inheritance
// ============================================================

#let _make-counter(id) = rich-counter(identifier: id, inherited_levels: 1)

#let _counters = (
  theorem: _make-counter("theorem"),
  example: _make-counter("example"),
  corollary: _make-counter("corollary"),
  note: _make-counter("note"),
  definition: _make-counter("definition"),
  proposition: _make-counter("proposition"),
  question: _make-counter("question"),
  exercise: _make-counter("exercise"),
  hint: _make-counter("hint"),
  lemma: _make-counter("lemma"),
  remark: _make-counter("remark"),
)

// ============================================================
// Public theorem environments — preserve original API:
//   #theorem(title: "Name")[body]
// ============================================================

#let theorem = _thmbox(blocktitle: "Theorem", color: rgb(13, 71, 161), counter: _counters.theorem)
#let definition = _thmbox(blocktitle: "Definition", color: rgb(38, 50, 56), counter: _counters.definition)
#let lemma = _thmbox(blocktitle: "Lemma", color: rgb(51, 105, 30), counter: _counters.lemma)
#let corollary = _thmbox(blocktitle: "Corollary", color: rgb(26, 35, 126), counter: _counters.corollary)
#let proposition = _thmbox(blocktitle: "Proposition", color: rgb(230, 81, 0), counter: _counters.proposition)
#let example = _thmbox(blocktitle: "Example", color: rgb(51, 105, 30), counter: _counters.example)
#let note = _thmbox(blocktitle: "Note", color: rgb(0, 77, 64))
#let remark = _thmbox(blocktitle: "Remark", color: rgb(0, 77, 64), counter: _counters.remark)
#let question = _thmbox(blocktitle: "Question", color: rgb(26, 35, 126), counter: _counters.question)
#let exercise = _thmbox(blocktitle: "Exercise", color: rgb(26, 35, 126), counter: _counters.exercise)
#let hint = _thmbox(blocktitle: "Hint", color: rgb(106, 27, 154))

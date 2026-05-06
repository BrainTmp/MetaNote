// Problem and sub-problem environments for structured homework.
// These are OPTIONAL — you can still use headings for problem numbers.

/// A problem block. Renders with bold problem number as a compact heading-like element.
/// Usage: #problem(1)[...] or #problem("3.14")[...]
/// The content starts on the same line or immediately below depending on length.
#let problem(number, body) = {
  v(8pt, weak: true)
  block(spacing: 0.5em, {
    text(weight: "bold", size: 11pt, [Problem #number.])
    h(0.5em)
    body
  })
}

/// Sub-problem marker. Renders as a bold "(a)" style label.
/// Usage within #solution or #proof:
///   #solution[
///     #sub("a") First part...    ← flows inline after "Solution."
///     #sub("b") Second part...   ← new paragraph
///   ]
///
/// Design: #sub always emits parbreak() first. Since it's inside a proof-like
/// block where the prefix is already on the first line, the first #sub's
/// parbreak() separates it from the prefix onto a new line. If you want (a)
/// to be on the SAME line as "Solution.", just write plain text:
///   #solution[(a) First part...]
///
/// The #sub variant is for when you want uniform bold formatting on sub-labels.
#let sub(label) = {
  parbreak()
  text(weight: "bold", [(#label)])
  h(0.4em)
}

/// An alternative: parts environment that auto-numbers sub-problems.
/// Usage:
/// ```
/// #parts[
///   First part content...
/// ][
///   Second part content...
/// ]
/// ```
/// Renders as: _Solution._ **(a)** First... ¶ **(b)** Second...
/// The first part flows inline with the proof prefix; subsequent parts
/// start new paragraphs.
#let parts(..items) = {
  let labels = "abcdefghijklmnopqrstuvwxyz"
  for (i, item) in items.pos().enumerate() {
    let letter = labels.at(i)
    if i > 0 {
      parbreak()
    }
    text(weight: "bold", [(#letter)])
    h(0.4em)
    item
  }
}

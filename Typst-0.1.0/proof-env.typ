// Proof and Solution environments.
// Key improvement over 0.0.2: the prefix ("Proof." / "Solution.") is INLINE
// with the body text, so "(a) ..." does not get pushed to a new line.
//
// Design: We use `block` for vertical spacing control, but inside the block
// the prefix and body are placed as inline content in the same paragraph flow.
// This means if the user's body starts with plain text like "(a) ...", it will
// appear on the same line as "Solution."

/// Generic proof-like block.
/// The prefix is rendered inline at the start of the body content,
/// followed immediately by the body text in the same paragraph.
#let _proof-like(
  prefix: [_Proof._],
  suffix: [#h(1fr) $square$],
  title: none,
  breakable: true,
  body,
) = {
  block(breakable: breakable, width: 100%, spacing: 0.8em, {
    // Prefix (inline) — this starts the first paragraph of the block
    prefix
    if title != none {
      [ ]
      text(style: "italic", [(#title)])
    }
    // Thin space between prefix and body (they share the same paragraph)
    h(0.4em)
    // Body flows inline from the prefix.
    // If body starts with text, it continues on the same line.
    // If body starts with parbreak() or block-level content, it naturally breaks.
    body
    // QED or suffix at the end of the last paragraph
    if suffix != none {
      suffix
    }
  })
}

/// Proof environment. Renders: _Proof._ body □
#let proof(title: none, body) = _proof-like(
  prefix: [_Proof._],
  suffix: [#h(1fr) $square$],
  title: title,
  body,
)

/// Proof sketch environment.
#let proofsk(title: none, body) = _proof-like(
  prefix: [_Proof Sketch._],
  suffix: [#h(1fr) $square$],
  title: title,
  body,
)

/// Solution environment. Renders: _Solution._ body (no QED)
#let solution(title: none, body) = _proof-like(
  prefix: [_Solution._],
  suffix: none,
  title: title,
  body,
)

/// Claim environment (for inline claims within proofs).
#let claim(title: none, body) = _proof-like(
  prefix: [*Claim.*],
  suffix: none,
  title: title,
  body,
)

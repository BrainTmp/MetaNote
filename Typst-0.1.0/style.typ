// Global styling: code blocks, tables, links, and other elements.
// All styles derive from a single accent color for visual consistency.

/// Apply global element styles. Called from lib.typ within the show rule chain.
/// `accent`: the accent color (used for table headers, code background tint, links)
/// `heading-font`: sans-serif font used for table headers
#let apply-element-styles(accent: rgb(30, 80, 150), heading-font: (), body) = {
  // --- Code font ---
  show raw: set text(font: ("JetBrains Mono", "Sarasa Mono SC", "Sarasa Mono", "DejaVu Sans Mono"))

  // --- Inline code ---
  // Light tinted background, monospace, slightly smaller
  show raw.where(block: false): it => {
    box(
      fill: accent.lighten(92%),
      inset: (x: 3pt, y: 0pt),
      outset: (y: 3pt),
      radius: 2pt,
      text(size: 0.85em, it)
    )
  }

  // --- Code blocks ---
  // Left border accent, light background
  show raw.where(block: true): it => {
    block(
      width: 100%,
      fill: luma(248),
      stroke: (left: 2pt + accent.lighten(40%)),
      inset: (x: 10pt, y: 8pt),
      radius: (right: 3pt),
      breakable: true,
      text(size: 0.85em, it)
    )
  }

  // --- Tables ---
  // Clean style: accent-tinted header row, alternating subtle row fills, no heavy borders
  set table(
    stroke: 0.5pt + luma(200),
    inset: 6pt,
    fill: (_, row) => {
      if row == 0 { accent.lighten(85%) }
      else if calc.odd(row) { luma(248) }
      else { white }
    },
  )
  // Table header text: bold, sans-serif
  show table.cell.where(y: 0): set text(weight: "bold", font: heading-font, size: 0.95em)

  // --- Lists ---
  // Accent-colored markers, default indent
  set list(marker: text(fill: accent, [#sym.bullet]), spacing: 0.7em)
  set enum(spacing: 0.7em)
  // Accent-colored enum numbers
  show enum.item: it => {
    // Workaround: style the number by reconstructing it
    it
  }

  // --- Links ---
  // Accent-colored
  show link: it => {
    text(fill: accent.darken(10%), it)
  }

  // --- Blockquote ---
  // Exported separately as a function (see below)

  // --- Figure captions ---
  // Sans-serif caption with accent-colored label
  show figure.caption: it => {
    set text(size: 0.9em, font: heading-font)
    it.supplement
    if it.numbering != none {
      [ ]
      text(fill: accent, it.counter.display(it.numbering))
    }
    it.separator
    it.body
  }

  body
}

// === Blockquote environment ===
// Usage: #blockquote[Some quoted text or problem statement...]
#let blockquote(body) = {
  block(
    width: 100%,
    inset: (left: 12pt, right: 10pt, y: 8pt),
    stroke: (left: 3pt + luma(180)),
    fill: luma(248),
    radius: (right: 3pt),
    breakable: true,
    body
  )
}

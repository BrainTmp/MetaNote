// MetaNote 0.1.0 — A unified template for homework, reports, and notes
// Author: timetraveler314

#import "theorem.typ": *
#import "proof-env.typ": *
#import "problem.typ": *
#import "preset.typ": presets
#import "layout.typ": make-header, make-footer, make-title, apply-heading-style

// Re-export dependencies needed by users
#import "@preview/great-theorems:0.1.2": great-theorems-init
#import "@preview/rich-counters:0.2.2": *

/// The main entry point. Use as:
/// ```
/// #show: MetaNote.with(
///   title: "...",
///   preset: "homework",
///   ...
/// )
/// ```
#let MetaNote(
  // === Metadata ===
  title: none,
  subtitle: none,
  author: none,         // string or array of strings
  authors: (),          // legacy: array of (name, affiliation, email) dicts
  date: none,           // string or datetime
  course: none,         // displayed in header if set
  id: none,             // student ID or document ID
  email: none,          // single email (shorthand for single-author)
  
  // === Mode ===
  preset: "homework",   // "homework" | "report" | "book"
  
  // === Overrides (all default to preset values if auto) ===
  show-outline: auto,
  page-header: auto,
  page-footer: auto,
  heading-numbering: auto,
  heading-supplement: auto,  // "Problem", "Exercise", "" etc. (auto = preset default)
  heading-font: auto,        // font for headings and page header (default: sans-serif)
  par-indent: auto,
  par-justify: auto,
  font: auto,
  lang: "en",
  paper: "a4",
  
  // === Legacy compat ===
  head_numbering: auto,   // maps to heading-numbering for backward compat
  head_mode: auto,        // ignored in 0.1.0 (subsumed by preset)
  print: false,
  
  body
) = {
  // Resolve preset defaults
  let p = presets.at(preset)
  
  // Resolve backward-compat params
  let heading-numbering = if head_numbering != auto { head_numbering } else if heading-numbering != auto { heading-numbering } else { p.heading-numbering }
  let show-outline = if show-outline != auto { show-outline } else { p.show-outline }
  let page-header = if page-header != auto { page-header } else { p.page-header }
  let page-footer = if page-footer != auto { page-footer } else { p.page-footer }
  let par-indent = if par-indent != auto { par-indent } else { p.par-indent }
  let par-justify = if par-justify != auto { par-justify } else { p.par-justify }
  let font = if font != auto { font } else { p.font }
  let heading-font = if heading-font != auto { heading-font } else { p.heading-font }
  
  // Resolve author info: normalize to a list of dicts
  let resolved-authors = if authors.len() > 0 {
    // Legacy format: array of (name, affiliation, email) dicts
    authors
  } else if author != none {
    if type(author) == str {
      ((name: author, email: if email != none { email } else { none }),)
    } else if type(author) == array {
      author.map(a => (name: a,))
    } else {
      ()
    }
  } else {
    ()
  }
  
  // Resolve date display
  let date-display = if date != none {
    if type(date) == datetime {
      date.display("[year]-[month]-[day]")
    } else {
      str(date)
    }
  } else { none }
  
  // Initialize great-theorems
  show: great-theorems-init
  
  // Font setup
  set text(font: font, lang: lang)
  
  // Paragraph settings
  set par(justify: par-justify, first-line-indent: par-indent, leading: 0.65em)
  
  // Heading numbering: always set a numbering internally so headings are
  // referenceable. If the user requested none, we use a hidden "1." numbering
  // but don't display it visually (handled in apply-heading-style).
  let display-heading-numbering = heading-numbering != none
  
  // Resolve heading supplement for references
  let resolved-supplement = if heading-supplement != auto {
    heading-supplement
  } else if not display-heading-numbering {
    [Problem]  // homework default
  } else {
    auto
  }
  
  set heading(
    numbering: if heading-numbering != none { heading-numbering } else { "1." },
    supplement: resolved-supplement,
  )
  
  // NOTE: When heading-numbering is none (homework mode), references like
  // @label will display as "Problem 1", "Problem 2" etc. based on the
  // internal counter. For non-sequential problem numbers (e.g. textbook
  // exercises 3.14, 3.17), use manual text references or @label[3.14].
  
  // Apply heading style based on preset
  show heading: apply-heading-style.with(
    preset: preset,
    display-numbering: display-heading-numbering,
    heading-font: heading-font,
  )
  
  // Page setup
  set page(
    paper: paper,
    margin: if preset == "book" { (x: 2.5cm, y: 2.5cm) } else { (x: 2cm, y: 2cm) },
    header: context {
      if page-header and here().page() > 1 {
        make-header(title: title, course: course, date: date-display, preset: preset, heading-font: heading-font)
      }
    },
    footer: context {
      if page-footer {
        make-footer(preset: preset)
      }
    },
  )
  
  // === Title block ===
  make-title(
    title: title,
    subtitle: subtitle,
    authors: resolved-authors,
    date: date-display,
    course: course,
    id: id,
    preset: preset,
    heading-font: heading-font,
  )
  
  // === Outline ===
  if show-outline == true {
    outline(indent: auto)
    if preset == "book" { pagebreak() }
  }
  
  // === Body ===
  body
}

// Layout utilities: title blocks, headers, footers, heading styles.

/// Render the title block at the top of the document.
#let make-title(
  title: none,
  subtitle: none,
  authors: (),
  date: none,
  course: none,
  id: none,
  preset: "homework",
  heading-font: ("New Computer Modern Sans",),
) = {
  // === Homework: same author block style as report, compact ===
  if preset == "homework" {
    set align(center)
    
    // Title
    if title != none {
      text(15pt, weight: "bold", title)
    }
    
    if subtitle != none {
      linebreak()
      v(4pt)
      text(11pt, font: heading-font, subtitle)
    }
    
    v(10pt)
    
    // Authors (same style as report)
    let count = authors.len()
    if count > 0 {
      let ncols = calc.min(count, 3)
      grid(
        columns: (1fr,) * ncols,
        row-gutter: 12pt,
        ..authors.map(author => {
          let parts = ()
          let name-part = author.name
          if "id" in author and author.id != none {
            name-part = name-part + " (" + str(author.id) + ")"
          } else if id != none {
            name-part = name-part + " (" + str(id) + ")"
          }
          parts.push(text(11pt, weight: "semibold", name-part))
          if "affiliation" in author and author.affiliation != none and author.affiliation != "" {
            // Legacy: show affiliation (often used as date in 0.0.2)
            if date == none {
              parts.push(linebreak())
              parts.push(text(9.5pt, author.affiliation))
            }
          }
          if "email" in author and author.email != none {
            parts.push(linebreak())
            parts.push(text(9.5pt, link("mailto:" + author.email, author.email)))
          }
          parts.join()
        }),
      )
    }
    
    if date != none {
      v(4pt)
      text(10pt, date)
    }
    
    v(18pt)
  }
  
  // === Report: centered with subtitle and ruled ===
  else if preset == "report" {
    set align(center)
    
    v(8pt)
    if course != none {
      text(11pt, font: heading-font, course)
      linebreak()
      v(4pt)
    }
    
    text(17pt, weight: "bold", title)
    
    if subtitle != none {
      linebreak()
      v(4pt)
      text(12pt, font: heading-font, subtitle)
    }
    
    v(12pt)
    
    // Authors
    let count = authors.len()
    if count > 0 {
      let ncols = calc.min(count, 3)
      grid(
        columns: (1fr,) * ncols,
        row-gutter: 16pt,
        ..authors.map(author => {
          let parts = ()
          parts.push(text(11pt, weight: "semibold", author.name))
          if "affiliation" in author and author.affiliation != none {
            parts.push(linebreak())
            parts.push(text(9.5pt, author.affiliation))
          }
          if "email" in author and author.email != none {
            parts.push(linebreak())
            parts.push(text(9.5pt, link("mailto:" + author.email, author.email)))
          }
          parts.join()
        }),
      )
    }
    
    if date != none {
      v(6pt)
      text(10pt, date)
    }
    
    v(4pt)
    line(length: 100%, stroke: 0.5pt + luma(180))
    v(8pt)
  }
  
  // === Book: full title page ===
  else if preset == "book" {
    set align(center)
    v(1fr)
    
    if course != none {
      text(13pt, font: heading-font, course)
      v(12pt)
    }
    
    text(22pt, weight: "bold", title)
    
    if subtitle != none {
      v(8pt)
      text(14pt, font: heading-font, subtitle)
    }
    
    v(1fr)
    
    // Authors
    for author in authors {
      text(12pt, weight: "semibold", author.name)
      if "affiliation" in author and author.affiliation != none {
        linebreak()
        text(10pt, author.affiliation)
      }
      linebreak()
    }
    
    v(0.5fr)
    
    if date != none {
      text(11pt, date)
    }
    
    v(0.5fr)
    pagebreak()
  }
}

/// Page header renderer.
#let make-header(title: none, course: none, date: none, preset: "homework", heading-font: ("New Computer Modern Sans",)) = {
  set text(9pt, font: heading-font)
  
  if preset == "homework" {
    let left-part = if course != none { course } else { title }
    let right-part = if date != none { date } else { "" }
    left-part
    h(1fr)
    right-part
    v(-5pt)
    line(length: 100%, stroke: 0.4pt + luma(180))
  } else if preset == "report" {
    let chapter-title = context {
      let elems = query(heading.where(level: 1).before(here()))
      if elems.len() > 0 {
        elems.last().body
      }
    }
    title
    h(1fr)
    chapter-title
    v(-5pt)
    line(length: 100%, stroke: 0.4pt + luma(180))
  } else if preset == "book" {
    let chapter-title = context {
      let elems = query(heading.where(level: 1).before(here()))
      if elems.len() > 0 {
        elems.last().body
      }
    }
    context {
      if calc.even(here().page()) {
        chapter-title; h(1fr); title
      } else {
        title; h(1fr); chapter-title
      }
    }
    v(-5pt)
    line(length: 100%, stroke: 0.4pt + luma(180))
  }
}

/// Page footer renderer.
#let make-footer(preset: "homework") = {
  set text(9pt)
  set align(center)
  context { counter(page).display("1") }
}

/// Heading style rules based on preset.
/// `display-numbering`: whether to visually show the heading number.
/// Even when false, the heading still has internal numbering for references.
/// `heading-font`: font family for headings (sans-serif by default).
#let apply-heading-style(preset: "homework", display-numbering: true, heading-font: ("New Computer Modern Sans",), it) = {
  // All headings use the sans-serif heading font, and never have paragraph indent
  set text(font: heading-font)
  set par(first-line-indent: 0pt)
  
  if preset == "homework" {
    // Homework: headings are compact, bold, no decorations
    if it.level == 1 {
      v(18pt, weak: true)
      text(14pt, weight: "bold", {
        if display-numbering and it.numbering != none {
          counter(heading).display()
          h(6pt)
        }
        it.body
      })
      v(6pt, weak: true)
    } else if it.level == 2 {
      v(6pt, weak: true)
      text(11.5pt, weight: "bold", {
        if display-numbering and it.numbering != none {
          counter(heading).display()
          h(5pt)
        }
        it.body
      })
      v(4pt, weak: true)
    } else {
      v(4pt, weak: true)
      text(10.5pt, weight: "bold", {
        if display-numbering and it.numbering != none {
          counter(heading).display()
          h(4pt)
        }
        it.body
      })
      v(3pt, weak: true)
    }
  } else if preset == "report" {
    // Report: level-1 gets underline separator
    if it.level == 1 {
      v(16pt, weak: true)
      text(15pt, weight: "bold", {
        if it.numbering != none {
          counter(heading).display()
          h(8pt)
        }
        it.body
      })
      v(2pt, weak: true)
      line(length: 100%, stroke: 0.5pt + luma(180))
      v(8pt, weak: true)
    } else if it.level == 2 {
      v(16pt, weak: true)
      text(12.5pt, weight: "bold", {
        if it.numbering != none {
          counter(heading).display()
          h(6pt)
        }
        it.body
      })
      v(6pt, weak: true)
    } else {
      v(10pt, weak: true)
      text(11pt, weight: "bold", {
        if it.numbering != none {
          counter(heading).display()
          h(5pt)
        }
        it.body
      })
      v(4pt, weak: true)
    }
  } else if preset == "book" {
    // Book: chapter-style level-1 headings
    if it.level == 1 {
      pagebreak(weak: true)
      v(40pt)
      text(12pt, weight: "regular", fill: luma(100), {
        if it.numbering != none {
          "Chapter " + counter(heading).display("1")
        }
      })
      v(8pt, weak: true)
      text(20pt, weight: "bold", it.body)
      v(4pt, weak: true)
      line(length: 100%, stroke: 1pt + luma(100))
      v(20pt, weak: true)
    } else if it.level == 2 {
      v(14pt, weak: true)
      text(14pt, weight: "bold", {
        if it.numbering != none {
          counter(heading).display()
          h(8pt)
        }
        it.body
      })
      v(8pt, weak: true)
    } else {
      v(8pt, weak: true)
      text(11.5pt, weight: "bold", {
        if it.numbering != none {
          counter(heading).display()
          h(5pt)
        }
        it.body
      })
      v(5pt, weak: true)
    }
  }
}

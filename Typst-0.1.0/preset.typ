// Preset configurations for different document modes.
// Each preset is a dictionary of default values.

#let presets = (
  homework: (
    heading-numbering: none,
    show-outline: false,
    page-header: true,
    page-footer: true,
    par-indent: 0pt,
    par-justify: true,
    font: ("New Computer Modern", "Source Han Serif SC"),
    heading-font: ("New Computer Modern Sans", "Source Han Sans SC"),
  ),
  report: (
    heading-numbering: "1.1.",
    show-outline: true,
    page-header: true,
    page-footer: true,
    par-indent: 1.5em,
    par-justify: true,
    font: ("New Computer Modern", "Source Han Serif SC"),
    heading-font: ("New Computer Modern Sans", "Source Han Sans SC"),
  ),
  book: (
    heading-numbering: "1.1.1.",
    show-outline: true,
    page-header: true,
    page-footer: true,
    par-indent: 1.5em,
    par-justify: true,
    font: ("New Computer Modern", "Source Han Serif SC"),
    heading-font: ("New Computer Modern Sans", "Source Han Sans SC"),
  ),
)

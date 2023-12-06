// This is the notations for writing Bird-Meertens Formalism

#let opl = math.plus.circle // oplus
#let omi = math.minus.circle // ominus
#let oti = math.times.circle // otimes
#let odo = math.dot.circle // odot

#let m2 = math.arrow.t // Up arrow, Max of two operator

#let cat = math.op([$plus$ #h(-0.5em) $plus$]) // concat ++ 
#let sp = math.space // space 
#let st = math.ast.op // astar

#let rd = math.slash // Reduce / Slash 
#let lrd = math.op([$arrow.r$ #h(-0.7em) $slash$]) // Left-to-right Reduce 
#let rrd = math.op([$slash$ #h(-0.7em) $arrow.l$]) // Right-to-left Reduce

#let lacc = math.op([$arrow.r$ #h(-0.8em) $slash$ #h(-0.3em) $slash$]) // Left-to-right Accumulate
#let racc = math.op([$slash$ #h(-0.3em) $slash$ #h(-0.8em) $arrow.l$]) // Right-to-left Accumulate

#let reas(x) = {
  math.quad; math.brace; math.space; x; math.space; math.brace.r;
} // Equation Reasoning

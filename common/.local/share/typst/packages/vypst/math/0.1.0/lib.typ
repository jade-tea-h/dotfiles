#let svec(..terms, unit_letters: (math.dotless.i, math.dotless.j, $k$, $w$)) = {
  let terms = terms.pos()
  for i in array.range(terms.len()) {
    let term = terms.at(i)
    if term == $1$.body {
      if i == 0 {
        $bold(hat(#unit_letters.at(i)))$
      } else {
        $+ bold(hat(#unit_letters.at(i)))$
      }
    } else if term == $-1$.body {
      $- bold(hat(#unit_letters.at(i)))$
    } else if term != $0$.body {
      if (i == 0
        or term.fields().values().first() == $-$.body or term.fields().values().first() == $+$.body) {
        $#term #" " bold(hat(#unit_letters.at(i)))$
      } else {
        $+ #term #" " bold(hat(#unit_letters.at(i)))$
      }
    }
  }
}

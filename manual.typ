#import "@preview/tidy:0.1.0"
#import "@preview/cetz:0.2.2": canvas
#import "riesketcher.typ": riesketcher
// #import "@preview/riesketcher:0.2.0": riesketcher

#set text(size: 10.5pt)

= Riesketcher
A package to draw Riemann sums (and their plots) of a function with CeTZ.
```typst
#import "@preview/riesketcher:0.2.1": riesketcher
```

#show raw.where(lang: "example"): it => block({
  table(columns: (50%, 50%), stroke: none, align: (center + horizon, left),
    align(left, raw(lang: "typc", it.text)),
    eval("canvas({" + it.text + "})", scope: (canvas: canvas, riesketcher: riesketcher))
  )
})

== Examples
=== Left-Hand Riemann sum

```example
riesketcher(
    x => calc.pow(x, 3) + 4,
    method: "left",
    start: -3.1,
    end: 3.5,
    n: 10,
    plot-x-tick-step: 1,
)
```

=== Midpoint Riemann sum

```example
riesketcher(
    x => -calc.pow(x, 2) + 9,
    method: "mid",
    domain: (-4, 4),
    start: -3,
    end: 3,
    n: 6,
    plot-x-tick-step: 1,
)
```
=== Right-method Riemann sum

```example
riesketcher(
    x => 16 - x * x,
    method: "right",
    end: 6,
    n: 6,
    domain: (-1, auto),
    plot-x-tick-step: 1,
)
```

#pagebreak()
#set align(left)

== Method parameters

#let riesketcher-tidy = tidy.parse-module(read("riesketcher.typ"), name: "riesketcher")
#tidy.show-module(riesketcher-tidy)

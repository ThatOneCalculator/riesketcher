#import "@preview/cetz:0.1.2": canvas, draw, plot
#import "riemann.typ": riemann

#set page(width: auto, height: auto, margin: 0.2in)
#set align(center)

$f(x) = 16 - x^2$

#line(length: 2in)

#let f(x) = 16 - x * x

#let demo(hand) = {
  let domain-offset = 0
  if hand == "right" {
     domain-offset = 1
   } 
  else if hand == "mid" or hand == "midpoint" {
     domain-offset = 0.5
   }

  plot.plot(size: (6 + domain-offset, 6),
    // x-grid: true,
    // y-grid: true,
    axis-style: "school-book",
    x-tick-step: 1,
    y-tick-step: 4,
    {
      plot.add(
        domain: (0 - domain-offset, 6),
        x => f(x),
        style: (
          stroke: blue + 1.5pt,
        ),
      )
    }
  )

  riemann(
    x => f(x),
    hand: hand,
    end: 6,
    n: 6,
    y-scale: 6,
    domain-offset: domain-offset,
    range-offset: 10/3,
    transparency: 40%,
  )
}

=== Left-hand Riemann sum

#canvas({
  demo("left")
})

#v(0.3in)

=== Midpoint Riemann sum

#canvas({
  demo("mid")
})

#v(0.3in)

=== Right-hand Riemann sum

#canvas({
  demo("right")
})

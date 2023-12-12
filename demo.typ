#import "@preview/cetz:0.1.2": canvas, draw, plot
#import "riemann.typ": riemann

#set page(width: auto, height: auto, margin: 0.2in)
#set align(center)

$f(x) = 16 - x^2$

#line(length: 2in)

#let f(x) = 16 - x * x

#let demo(hand) = {
  let x-offset = 0
  if hand == "right" {
     x-offset = 1
   } 
  else if hand == "mid" or hand == "midpoint" {
     x-offset = 0.5
   }

  riemann(
    x => f(x),
    hand: hand,
    end: 6,
    n: 6,
    y-scale: 6,
    x-offset: x-offset,
    plot-x-tick-step: 1,
    y-offset: 10/3,
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

#import "@preview/tidy:0.1.0"
#import "@preview/cetz:0.1.2": canvas
#import "riemann.typ": riemann

#set text(size: 10.5pt)

= Riemann package for Typst
Kainoa Kanter

== Examples

#set align(center)

$f(x) = 16 - x^2$

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

#columns(2)[
    #v(0.2in)
    === Left-hand Riemann sum

    ```typst
    #riemann(
        x => f(x) = 16 - x * x,
        hand: "left",
        end: 6,
        n: 6,
        y-scale: 6,
        x-offset: 0,
        plot-x-tick-step: 1,
        y-offset: 10/3,
    )
    ```

    #v(1.2in)

    === Midpoint Riemann sum

    ```typst
    #riemann(
        x => f(x) = 16 - x * x,
        hand: "mid",
        end: 6,
        n: 6,
        y-scale: 6,
        x-offset: 0.5,
        plot-x-tick-step: 1,
        y-offset: 10/3,
    )
    ```

    #v(1in)

    === Right-hand Riemann sum

    ```typst
    #riemann(
        x => f(x) = 16 - x * x,
        hand: "right",
        end: 6,
        n: 6,
        y-scale: 6,
        x-offset: 1,
        plot-x-tick-step: 1,
        y-offset: 10/3,
    )
    ```

    #colbreak()

    #canvas({
    demo("left")
    })

    #canvas({
    demo("mid")
    })

    #canvas({
    demo("right")
    })

]

#pagebreak()

#set align(left)

== Method parameters

#let riemann-tidy = tidy.parse-module(read("riemann.typ"), name: "Riemann")
#tidy.show-module(riemann-tidy)

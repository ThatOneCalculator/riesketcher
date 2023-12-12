#import "@preview/tidy:0.1.0"

#import "template.typ": project
#let package = toml("/typst.toml").package

#show: project.with(
    package: package,
    date: datetime.today().display(),
    abstract: [A package to draw Riemann sums (and their plots) of a function with CeTZ.]
)

#let riemann = tidy.parse-module(read("riemann.typ"), name: "Riemann")
#tidy.show-module(riemann)
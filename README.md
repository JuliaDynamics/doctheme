# Documentation theme for the packages of JuliaDynamics

*(requires at least documenter `v0.24.6`)*

To use the style, first ensure that `Documenter, DocumenterTools, CairoMakie` are in the `docs/Project.toml` file of the repo.

Then, in the `docs/make.jl` file add the following at the start of the file:

```julia
cd(@__DIR__)

download(
    "https://raw.githubusercontent.com/JuliaDynamics/doctheme/master/apply_style.jl",
    joinpath(@__DIR__, "apply_style.jl")
)
include("apply_style.jl")

using PackageName
```
and the theme will be applied automatically.

Because we are using Google fonts, also use use
```julia
format = Documenter.HTML(
    prettyurls = CI,
    assets = [
        asset("https://fonts.googleapis.com/css?family=Montserrat|Source+Code+Pro&display=swap", class=:css),
    ],
    collapselevel = 3,
)
```
as a keyword argument to `makedocs`.

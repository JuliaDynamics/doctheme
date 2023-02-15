# Documentation theme for the packages of JuliaDynamics

*(requires at least documenter `v0.24.6`)*

Add the following before the `makedocs` command:

```julia
cd(@__DIR__)
CI = get(ENV, "CI", nothing) == "true" || get(ENV, "GITHUB_TOKEN", nothing) !== nothing

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

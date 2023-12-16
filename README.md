# Documentation theme for the packages of JuliaDynamics

*(requires at least Documenter `v1.0`)*

This repo provides a unified style for Documenter.jl documentation build of the packages of JuliaDynamics, and also provides a simplified way to apply it on a repo.

First, ensure that `Documenter, DocumenterTools, CairoMakie` are in the `docs/Project.toml` file of the package. All other packages that are used in the docbuild should be there as well! The main package doesn't need to be there as it already exists in the global environment during docbuilding.

Second, add the following to `.gitignore`:
```
*.css
*.scss
*style.jl
```

Third, make the `docs/make.jl` file of the package be like so:


```julia
cd(@__DIR__)

using RecurrenceAnalysis

pages = [
    "index.md",
    "rplots.md",
    "quantification.md",
    "networks.md",
    "windowed.md",
]

import Downloads
Downloads.download(
    "https://raw.githubusercontent.com/JuliaDynamics/doctheme/master/build_docs_with_style.jl",
    joinpath(@__DIR__, "build_docs_with_style.jl")
)
include("build_docs_with_style.jl")

build_docs_with_style(pages, RecurrenceAnalysis)
```

The function `build_docs_with_style` may take a variable number of modules as arguments to include in the doc build, and the first module becomes the site name and deploy location. There are also some keyword arguments to set the author, and other options and all other keywords are propagated to the `makedocs` function.

# Load documenter
using Documenter
using DocumenterTools: Themes
ENV["JULIA_DEBUG"] = "Documenter"
# download the themes
for file in ("juliaclimate-lightdefs.scss", "juliaclimate-darkdefs.scss", "juliaclimate-style.scss")
    download("https://raw.githubusercontent.com/JuliaClimate/doctheme/master/$file", joinpath(@__DIR__, file))
end
# create the themes
for w in ("light", "dark")
    header = read(joinpath(@__DIR__, "juliaclimate-style.scss"), String)
    theme = read(joinpath(@__DIR__, "juliaclimate-$(w)defs.scss"), String)
    write(joinpath(@__DIR__, "juliaclimate-$(w).scss"), header*"\n"*theme)
end
# compile the themes
Themes.compile(joinpath(@__DIR__, "juliaclimate-light.scss"), joinpath(@__DIR__, "src/assets/themes/documenter-light.css"))
Themes.compile(joinpath(@__DIR__, "juliaclimate-dark.scss"), joinpath(@__DIR__, "src/assets/themes/documenter-dark.css"))
# Download and apply CairoMakie plotting style
using CairoMakie
download("https://raw.githubusercontent.com/JuliaClimate/doctheme/master/style.jl", joinpath(@__DIR__, file))
include("style.jl")

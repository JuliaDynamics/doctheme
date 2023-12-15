CI = get(ENV, "CI", nothing) == "true" || get(ENV, "GITHUB_TOKEN", nothing) !== nothing
# Load documenter
using Documenter
using DocumenterTools: Themes
ENV["JULIA_DEBUG"] = "Documenter"
# download the themes
import Downloads
for file in ("juliadynamics-lightdefs.scss", "juliadynamics-darkdefs.scss", "juliadynamics-style.scss")
    Downloads.download("https://raw.githubusercontent.com/kahaaga/doctheme/master/$file", joinpath(@__DIR__, file))
end
# create the themes
for w in ("light", "dark")
    header = read(joinpath(@__DIR__, "juliadynamics-style.scss"), String)
    theme = read(joinpath(@__DIR__, "juliadynamics-$(w)defs.scss"), String)
    write(joinpath(@__DIR__, "juliadynamics-$(w).scss"), header*"\n"*theme)
end
# compile the themes
Themes.compile(joinpath(@__DIR__, "juliadynamics-light.scss"), joinpath(@__DIR__, "src/assets/themes/documenter-light.css"))
Themes.compile(joinpath(@__DIR__, "juliadynamics-dark.scss"), joinpath(@__DIR__, "src/assets/themes/documenter-dark.css"))
# Download and apply CairoMakie plotting style
using CairoMakie
Downloads.download("https://raw.githubusercontent.com/kahaaga/doctheme/master/style.jl", joinpath(@__DIR__, "style.jl"))
include("style.jl")

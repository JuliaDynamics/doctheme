# Documentation theme for the packages of JuliaDynamics

Add the following before the `makedocs` command:

```julia
# download the themes
for file in ("juliadynamics-lightdefs.scss", "juliadynamics-darkdefs.scss", "juliadynamics-style.scss")
    download("https://github.com/JuliaDynamics/doctheme/blob/master/$file", file)
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
```

Lastly, because we are using Google fonts, use
```julia
format = Documenter.HTML(
    assets = [
        "assets/logo.ico",
        asset("https://fonts.googleapis.com/css?family=Quicksand|Montserrat|Source+Code+Pro|Lora&display=swap", class=:css),
        ],
    ),
```
as argument to `makedocs`.

FROM julia:latest

LABEL "com.github.actions.name" = "JuliaFormatter"
LABEL "com.github.actions.description" = "Format Julia code using JuliaFormatter.jl"
LABEL "com.github.actions.icon" = "code"
LABEL "com.github.actions.color" = "yellow"

LABEL "repository"="https://github.com/domluna/action-JuliaFormatter"
LABEL "homepage"="https://github.com/domluna/action-JuliaFormatter"
LABEL "maintainer"="Dominique Luna <dluna132@gmail.com>"

RUN julia -e 'using Pkg; Pkg.add("JuliaFormatter"); using JuliaFormatter'

ENV PATH="$HOME/.julia/dev/JuliaFormatter.jl/bin:$PATH"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

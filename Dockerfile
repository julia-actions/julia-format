FROM julia:latest

LABEL "com.github.actions.name" = "julia-format"
LABEL "com.github.actions.description" = "Format Julia code using JuliaFormatter.jl"
LABEL "com.github.actions.icon" = "code"
LABEL "com.github.actions.color" = "yellow"

LABEL "repository"="https://github.com/julia-actions/julia-format"
LABEL "homepage"="https://github.com/julia-actions/julia-format"
LABEL "maintainer"="Dominique Luna <dluna132@gmail.com>"

RUN apt-get update
RUN apt-get install -y git

COPY format.jl /format.jl
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

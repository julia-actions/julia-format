# Github Actions Workflows For JuliaFormatter.jl

## Workflows

- [Format check with version](./workflows/format_check.yml)
- [Open format PR on interval](./workflows/format_pr.yml)


## Legacy Docker Version

> NOTE: this section is deprecated. It's advised you use the format check example above.

Github action which verifies [JuliaFormatter.jl](https://github.com/domluna/JuliaFormatter.jl) was on `.jl` files.
See the help message in [format.jl](./format.jl) for detailed description of flags/arguments.

## Example Usage

`-v` toggles verbose output.


```yaml
name: Format

on: [push, pull_request]

jobs:
  format:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - uses: julia-actions/julia-format@master
      with:
        args: -v .
```





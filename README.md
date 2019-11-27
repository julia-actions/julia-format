# Github Action For JuliaFormatter.jl

Github action which verifies [JuliaFormatter.jl](https://github.com/domluna/JuliaFormatter.jl) was on `.jl` files.  See the help message in [format.jl](./format.jl) for detailed description of flags/arguments.

## Usage

This action assumes that you have in your package a `format` folder containing a  `Project.toml` file specifying the `JuliaFormatter.jl` version and a file `format.jl` executing the formatting.

**Project.toml**:
```toml
[deps]
JuliaFormatter = "98e50ef6-434e-11e9-1051-2b60c6c9e899"

[compat]
JuliaFormatter = "0.1.34"

```

**format.jl**:
```julia
using JuliaFormatter

format(["src", "test"]; verbose = true)
```

With this the following workflow ensures that your files are formatted correctly:

```yaml
name: Format

on: [push, pull_request]

jobs:
  format:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - uses: julia-actions/setup-julia@v1
      with:
        version: 1.3
    - uses: saschatimme/julia-format@js
```


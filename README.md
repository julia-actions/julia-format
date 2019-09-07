# Github Action For JuliaFormatter.jl

Github action that runs [JuliaFormatter.jl](https://github.com/domluna/JuliaFormatter.jl) on your `.jl` files.

This will recursively format all `.jl` files your repository with default indentation width and maximum line margin.
`-v` toggles verbose output.

See the help message in [this file](https://github.com/domluna/JuliaFormatter.jl/blob/master/bin/format.jl) for detailed description of flags/arguments.

## Usage


```yaml
name: Format

on: [push, pull_request]

jobs:
  format:
    runs-on: ubuntu-latest
    steps:
    - uses: domluna/JuliaFormatter-action@master
      with:
        args: -v .
```


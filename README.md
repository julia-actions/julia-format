# Github Action For JuliaFormatter.jl

> THIS DOES NOT CURRENTLY WORK. TRYING TO FIGURE IT OUT. IF YOU CAN MAKE IT WORK THAT WOULD BE GREAT :)

Github action that runs [JuliaFormatter.jl](https://github.com/domluna/JuliaFormatter.jl) on your `.jl` files.  See the help message in [format.jl](./format.jl) for detailed description of flags/arguments.

## Usage

This will recursively format all `.jl` files your repository with default indentation width and maximum line margin.  `-v` toggles verbose output.


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


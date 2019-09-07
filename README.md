# Github Action For JuliaFormatter.jl

Github action that runs [JuliaFormatter.jl](https://github.com/domluna/JuliaFormatter.jl) on your `.jl` files.

## Example

This will recursively format all `.jl` files your repository with default indentation width and maximum line margin.
`-v` toggles verbose output.

See the help message in [this file](https://github.com/domluna/JuliaFormatter.jl/blob/master/bin/format.jl) for detailed description of flags/arguments.

```workflow
workflow "Example Workflow" {
  on = "push"
  resolves = ["Format"]
}

action "Format" {
  uses = "domluna/action-JuliaFormatter@master"
  args = "-v ."
}
```


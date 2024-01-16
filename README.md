# julia-format

## Setup workflow with `julia-format` action

Save the following code as `Format.yml` in the `.github/workflows/` directory in your repository.

```yaml
name: Format suggestions
on:
  pull_request:
jobs:
  code-style:
    runs-on: ubuntu-latest
    steps:
      - uses: julia-actions/julia-format@v2
```

With this workflow, [reviewdog](https://github.com/reviewdog/reviewdog) will automatically post code suggestions to pull requests in your repository, based on the formatting rules defined by [JuliaFormatter.jl](https://github.com/domluna/JuliaFormatter.jl).

## Another possible workflow without `julia-format` action

You can also create another workflow like this:

```yaml
name: format-pr
on:
  schedule:
    - cron: '0 0 * * *'
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: julia-actions/cache@v1
      - name: Install JuliaFormatter and format
        run: |
          julia  -e 'import Pkg; Pkg.add("JuliaFormatter")'
          julia  -e 'using JuliaFormatter; format(".")'

      # https://github.com/marketplace/actions/create-pull-request
      # https://github.com/peter-evans/create-pull-request#reference-example
      - name: Create Pull Request
        id: cpr
        uses: peter-evans/create-pull-request@v3
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
          commit-message: Format .jl files
          title: 'Automatic JuliaFormatter.jl run'
          branch: auto-juliaformatter-pr
          delete-branch: true
          labels: formatting, automated pr, no changelog
      - name: Check outputs
        run: |
          echo "Pull Request Number - ${{ steps.cpr.outputs.pull-request-number }}"
          echo "Pull Request URL - ${{ steps.cpr.outputs.pull-request-url }}"
```

This workflow does not check the code in PRs, but creates PRs to fix the format.

# julia-format

## Setup workfow

Save the following code as `.github/workflows/Format.yml` in your repository.

```yaml
name: Format suggestions
on:
  pull_request:
jobs:
  code-style:
    runs-on: ubuntu-latest
    steps:
      - uses: julia-actions/julia-format@master
```

With this workflow, [reviewdog](https://github.com/reviewdog/reviewdog) will comment code suggestions to PRs in your repository.

## Anoter possible workflow

You can also create your workfow like this:

```yaml
name: format-pr
on:
  schedule:
    - cron: '0 0 * * *'
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
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

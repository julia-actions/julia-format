#!/bin/bash
set -e
set -o pipefail

/usr/bin/git config --global --add safe.directory /github/workspace

git status

julia /format.jl "$@"

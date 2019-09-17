#!/bin/bash
set -e
set -o pipefail

julia --project=$GITHUB_WORKSPACE format.jl "$@"

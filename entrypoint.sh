#!/bin/bash
set -e
set -o pipefail

julia /format.jl "$@"

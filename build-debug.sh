#!/usr/bin/env bash

set -euo pipefail

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$SCRIPT_DIR"

FLAGS="-g"

LDFLAGS="${FLAGS}" cmake -B bin -S . -G Ninja -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CXX_FLAGS="${FLAGS}" -DMEMORY_ALLOCATOR="standard" -DBUILD_SHARED_LIBS=OFF

cmake --build bin -- -j$(nproc)

#!/usr/bin/env bash

set -euo pipefail

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$SCRIPT_DIR"

# NOTE: We don't enable the following sanitizers
# alignment
# enum
# float-divide-by-zero
# signed-integer-overflow
# vptr
FLAGS="-fsanitize-address-use-after-scope -fsanitize=address -fsanitize=bool -fsanitize=bounds -fsanitize=bounds-strict -fsanitize=builtin -fsanitize=float-cast-overflow -fsanitize=integer-divide-by-zero -fsanitize=nonnull-attribute -fsanitize=null -fsanitize=object-size -fsanitize=pointer-overflow -fsanitize=return -fsanitize=returns-nonnull-attribute -fsanitize=shift -fsanitize=unreachable -fsanitize=vla-bound -fno-sanitize-recover=all -fno-omit-frame-pointer -g"

LDFLAGS="${FLAGS}" cmake -B bin -S . -G Ninja -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CXX_FLAGS="${FLAGS}" -DMEMORY_ALLOCATOR="standard" -DBUILD_SHARED_LIBS=OFF

cmake --build bin -- -j$(nproc)

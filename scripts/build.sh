#! /usr/bin/env sh
set -eu

OUT_FILE=out/terraform-provider-git
go build -o "$OUT_FILE" src/*.go
echo "wrote $OUT_FILE"

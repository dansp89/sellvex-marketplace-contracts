#!/usr/bin/env bash
# Copies the generated contracts from the core checkout beside this one and
# records their checksums. Never edit the copied files.
set -euo pipefail
here=$(cd "$(dirname "$0")" && pwd)
core="${CORE_DIR:-$here/../sellvex-marketplace-core}"
cp "$core"/api/openapi/*.json "$core"/api/openapi/*.yaml "$here/openapi/"
cp "$core"/api/events/catalog.json "$here/events/"
(cd "$here" && find openapi events -type f | sort | xargs sha256sum > CHECKSUMS.sha256)
echo "synced from $core"

#!/usr/bin/env bash
# Superseded. The core publishes these artefacts, because the core is
# where they are generated and where the decision of what each audience
# may see is enforced.
#
# This script copied only the administrative contracts. Keeping it would
# leave a second way to publish that silently omits the public ones —
# exactly the contract an outsider reads.
set -euo pipefail
cat >&2 <<'MSG'
sync.sh is superseded. From the core checkout, run:

  sellvex contracts-publish --local --reason "why this is being published"

It publishes both audiences (openapi/ and openapi/public/), records the
checksums, and leaves the commit to you.
MSG
exit 1

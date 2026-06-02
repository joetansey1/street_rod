cat > scripts/diff_latest_snapshot.sh <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

LATEST=$(ls -dt ai/snapshots/snapshot_* 2>/dev/null | head -1)

if [ -z "${LATEST:-}" ]; then
  echo "No snapshot found."
  exit 1
fi

echo "Comparing current project against: $LATEST"
echo

diff -ru \
  --exclude 'ai/snapshots' \
  --exclude 'node_modules' \
  --exclude '.venv' \
  --exclude 'venv' \
  --exclude '__pycache__' \
  --exclude '.DS_Store' \
  "$LATEST" . || true
EOF

chmod +x scripts/diff_latest_snapshot.sh

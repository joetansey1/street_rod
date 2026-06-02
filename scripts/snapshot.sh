cat > scripts/snapshot.sh <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

STAMP=$(date +"%Y%m%d_%H%M%S")
DEST="ai/snapshots/snapshot_$STAMP"

mkdir -p "$DEST"

rsync -a \
  --exclude 'ai/snapshots' \
  --exclude 'node_modules' \
  --exclude '.venv' \
  --exclude 'venv' \
  --exclude '__pycache__' \
  --exclude '.DS_Store' \
  ./ "$DEST/"

echo "Snapshot created: $DEST"
EOF

chmod +x scripts/snapshot.sh

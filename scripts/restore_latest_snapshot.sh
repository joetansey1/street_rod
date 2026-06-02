cat > scripts/restore_latest_snapshot.sh <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

LATEST=$(ls -dt ai/snapshots/snapshot_* 2>/dev/null | head -1)

if [ -z "${LATEST:-}" ]; then
  echo "No snapshot found."
  exit 1
fi

echo "Restoring from: $LATEST"
echo "This will overwrite local files. Press Ctrl-C to cancel, or Enter to continue."
read -r

rsync -a \
  --delete \
  --exclude 'ai/snapshots' \
  "$LATEST/" ./

echo "Restored from: $LATEST"
EOF

chmod +x scripts/restore_latest_snapshot.sh

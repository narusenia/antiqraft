#!/bin/bash
# Boot the pack on a local Forge server, report load result, then stop it.
# Needs `cd pack && mise exec -- packwiz serve --port 8089` running in another shell.
set -u
ROOT=$(cd "$(dirname "$0")/.." && pwd)
DIR="$ROOT/.cache/server"
FORGE=forge-1.7.10-10.13.4.1614-1.7.10
J=$(cd "$ROOT" && mise which java)
mkdir -p "$DIR" && cd "$DIR" || exit 1

if [ ! -f "$FORGE-universal.jar" ]; then
  curl -sSfLO "https://maven.minecraftforge.net/net/minecraftforge/forge/1.7.10-10.13.4.1614-1.7.10/$FORGE-installer.jar" || exit 1
  "$J" -jar "$FORGE-installer.jar" --installServer >/dev/null || exit 1
  echo eula=true > eula.txt
fi
[ -f packwiz-installer-bootstrap.jar ] || curl -sSfL -o packwiz-installer-bootstrap.jar \
  https://github.com/packwiz/packwiz-installer-bootstrap/releases/latest/download/packwiz-installer-bootstrap.jar || exit 1

curl -sf http://localhost:8089/pack.toml >/dev/null || { echo "packwiz serve is not running on :8089"; exit 1; }
"$J" -jar packwiz-installer-bootstrap.jar -g -s server http://localhost:8089/pack.toml 2>&1 | tail -1

rm -rf world crash-reports console.log console.in && mkfifo console.in
(tail -f console.in | "$J" -Xms2G -Xmx4G -jar "$FORGE-universal.jar" nogui > console.log 2>&1) &
for _ in $(seq 1 540); do
  sleep 1
  grep -qE 'Done \(|---- Minecraft Crash Report|Crash report saved|Encountered an unexpected exception' console.log && break
  pgrep -f "$FORGE-universal.jar nogui" >/dev/null || { echo PROCESS_EXITED; break; }
done
grep -E 'Forge Mod Loader has successfully loaded|Done \(|Crash report saved|unexpected exception|requires mods|Caught exception from' console.log
if [ -d crash-reports ]; then
  f=$(ls crash-reports/* | head -1)
  grep -A3 -E '^Description|Missing Mods' "$f"
  grep -m5 -E '^Caused by' "$f"
fi
[ -f logs/minetweaker.log ] && grep -E '^ERROR' logs/minetweaker.log | head -10
grep -q 'Done (' console.log && echo stop > console.in
for _ in $(seq 1 60); do pgrep -f "$FORGE-universal.jar nogui" >/dev/null || break; sleep 1; done
pkill -f "$FORGE-universal.jar nogui"; pkill -f 'tail -f console.in'
echo "server dir: $DIR"

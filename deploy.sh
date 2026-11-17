#!/bin/sh
# Usage : ./deploy.sh "message"  — fixe la version, commit et push
set -e
cd "$(dirname "$0")"
V=$(date +%Y%m%d%H%M%S)
sed -i "s/const APP_VERSION = '[^']*';/const APP_VERSION = '$V';/" index.html
printf '{"v":"%s"}\n' "$V" > version.json
git add -A
git -c user.name="Claude" -c user.email="noreply@anthropic.com" commit -q -m "$1

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_01Uj4RC3Q6sHx921PfEsv3jB"
git -c push.negotiate=true push 2>&1 | tail -1
echo "version $V"

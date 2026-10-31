#!/bin/bash
# 深夜ゲーム工房 100日チャレンジ — GitHub Pages 公開スクリプト（Macのターミナルで実行）
# 使い方:  cd ~/GitHub-game/shinya-game-kobo && bash publish.sh
set -e
REPO="shinya-game-kobo"
OWNER="titan11111"
URL="https://${OWNER}.github.io/${REPO}/"
cd "$(dirname "$0")"

command -v gh >/dev/null || { echo "❌ GitHub CLI(gh)がありません。 brew install gh → gh auth login を先に"; exit 1; }
gh auth status >/dev/null 2>&1 || { echo "❌ gh auth login でログインしてください"; exit 1; }

if [ ! -d .git ]; then
  git init -q -b main
fi
git add -A
git commit -q -m "深夜ゲーム工房 100日チャレンジ 更新 $(date +%Y-%m-%d)" || echo "（変更なし）"

if ! gh repo view "${OWNER}/${REPO}" >/dev/null 2>&1; then
  echo "▶ リポジトリを作成: ${OWNER}/${REPO}"
  gh repo create "${OWNER}/${REPO}" --public --source=. --remote=origin \
    --description "深夜ゲーム工房｜ひとりで100本、ゲームを作った。100日チャレンジ全作品" --push
  echo "▶ GitHub Pages を有効化"
  gh api -X POST "repos/${OWNER}/${REPO}/pages" -f "source[branch]=main" -f "source[path]=/" >/dev/null 2>&1 || true
  gh repo edit "${OWNER}/${REPO}" --homepage "${URL}" >/dev/null 2>&1 || true
else
  git remote get-url origin >/dev/null 2>&1 || git remote add origin "https://github.com/${OWNER}/${REPO}.git"
  git push -q -u origin main
fi

echo ""
echo "✅ 公開完了（反映まで1〜2分）"
echo "🔗 ${URL}"
printf "%s" "${URL}" | pbcopy 2>/dev/null && echo "📋 URLをクリップボードにコピーしました"

# 深夜ゲーム工房｜100日チャレンジ

ひとりで100本、ゲームを作った。
2026.07.18〜2026.10.25、毎日ひとつブラウザで遊べるゲームを作り続けた100日間の記録です。

🔗 **https://titan11111.github.io/shinya-game-kobo/**

- 全100本、スマホでもPCでも無料でプレイ
- ジャンルで絞り込み／「ランダムに1本遊ぶ」
- X・LINE・Facebook・リンクコピーのシェアボタン付き

制作：[@___titan_](https://x.com/CSTUyrqitZ24672)

---

## フォルダ構成

```
shinya-game-kobo/
├─ index.html     サイト本体（1ファイル完結）
├─ shots/         各ゲームのアイキャッチ day001〜day100.jpg
├─ ogp.jpg        SNSでシェアした時に出るカード画像（1200×630）
├─ favicon.svg    タブのアイコン
├─ .nojekyll      GitHub Pages用
├─ publish.sh     公開・更新スクリプト
└─ SHARE.md       シェア用の文面テンプレ
```

## 公開・更新のしかた

1. このフォルダを `~/GitHub-game/shinya-game-kobo/` に置く
2. ターミナルで `cd ~/GitHub-game/shinya-game-kobo && bash publish.sh`
3. 初回はリポジトリ作成＋GitHub Pages有効化まで自動。2回目以降は差分をpushするだけ

ゲームを追加・修正したら `index.html` と `shots/` を差し替えて、もう一度 `bash publish.sh`。

## カードの追加ルール

`index.html` の `<article class="card" ...>` を1枚コピーして、Day番号・タイトル・プレイURL・`shots/dayNNN.jpg` を差し替えます。
プレイURLは `https://titan11111.github.io/<リポジトリ名>/`（実際に開けるか必ず確認）。

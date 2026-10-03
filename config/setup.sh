#!/bin/sh
# mini OS - 初期セットアップスクリプト

echo "=== mini OS の起動処理を開始します ==="

# 1. パッケージリポジトリの有効化
echo "https://dl-cdn.alpinelinux.org/alpine/v3.19/main" > /etc/apk/repositories
echo "https://dl-cdn.alpinelinux.org/alpine/v3.19/community" >> /etc/apk/repositories
apk update

# 2. グラボ不要ドライバ・画面基盤・Mac風UIパーツ
# （modesetting/vesaでGPUを使わずCPU描画）
apk add xorg-server xf86-video-modesetting xf86-video-vesa xinit \
        openbox tint2 xterm xbindkeys

# 3. 日本語フォント & 日本語入力 (Anthy)
apk add font-noto-cjk uim uim-anthy

# 4. デフォルトアプリ群
# - デュアルブラウザ: netsurf (超軽量) + falkon (動画/Webサービス用)
# - 基本ツール: leafpad (メモ), mupdf (PDF), mpv (動画/音楽), feh (画像), galculator (電卓), htop (タスク管理)
# - 互換レイヤー: gcompat (一般的なLinuxアプリ用)
apk add netsurf falkon leafpad mupdf mpv feh galculator htop gcompat

# 5. ネットワーク（自宅自動接続 + 画面から手動接続）
apk add wpa_supplicant connman connman-gtk

echo "=== セットアップ完了 ==="

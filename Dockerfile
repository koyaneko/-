# Alma Linux 9をベースとして使用
FROM almalinux:9

#パッケージの更新
RUN dnf update -y

#gameディレクトリを作成
RUN mkdir game

# ローカルに配置したshファイルをgameディレクトリをコピー
COPY ./game/janken.sh /game

# Alma Linux 9をベースとして使用
FROM almalinux:9

RUN dnf update -y
RUN mkdir game

# ローカルに配置したshファイルをgameディレクトリをコピー
COPY ./game/janken.sh /game

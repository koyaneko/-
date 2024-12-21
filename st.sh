#!/bin/bash

#dockerイメージ作成
docker image build -t labofes:janken .

#コンテナ起動
#docker run --name jankencon -it labofes:janken /bin/bash
docker run --name jankencon -itd labofes:janken
#docker exec -it jankencon /bin/bash
#docker exec -it $(docker ps -a -q -f name=jankencon) /bin/bash

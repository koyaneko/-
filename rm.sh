#!/bin/bash

# Dockerコンテナ停止
docker stop $(docker ps -a -q -f name=jankencon)

# Dockerコンテナ削除
docker rm $(docker ps -a -q -f name=jankencon)

# イメージ削除
docker rmi $(docker images labofes:janken --format "{{.ID}}")
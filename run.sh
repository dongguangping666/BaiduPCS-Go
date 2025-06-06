#!/bin/bash

docker rm -fv baidu-pcs

docker run -itd --name=baidu-pcs \
	-p 8081:8080 \
	-e BDUSS=xxx \
	-e STOKEN=xxx \
	-e AUTH=true \
	-e TOKEN=1q2w3e4r5t \
	-v ./data/Downloads:/root/Downloads \
	-v ./data/config:/root/.config/BaiduPCS-Go \
 	baidupcs:latest


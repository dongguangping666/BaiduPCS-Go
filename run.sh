#!/bin/bash

docker rm -fv baidu-pcs

docker run -itd --name=baidu-pcs \
	-p 8081:8080 \
	-e BDUSS=xxx \
	-e STOKEN=xxx \
	-v ./data/Downloads:/root/Downloads \
	-v ./data/config:/root/.config/BaiduPCS-Go \
 	baidupcs:latest


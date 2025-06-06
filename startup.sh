#!/bin/bash

# 登录环境变量传入的账号
#如果文件夹不存在，创建文件夹
if [ ! -d "/root/.config/BaiduPCS-Go" ]; then
  echo "开始初始化!"
  /app/BaiduPCS-Go login --bduss=${BDUSS} --stoken=${STOKEN}
else
  echo "查询到配置文件!"
  echo "跳过初始化!"
fi

# 启动服务
if [ ! $AUTH ]; then
  echo "未开启 secret 认证!"
  /app/BaiduPCS-Go srv
else
  echo "已开启 secret 认证!"
  echo "secret: $TOKEN"
  /app/BaiduPCS-Go srv --auth --secret=$TOKEN
fi
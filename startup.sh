#!/bin/bash

# 登录环境变量传入的账号
/app/BaiduPCS-Go login --bduss=${BDUSS} --stoken=${STOKEN}

# 启动服务
/app/BaiduPCS-Go srv
# ============ BUILD
FROM golang:1.23-alpine as builder

WORKDIR /app

COPY . /app

RUN go mod tidy 

RUN go build -o BaiduPCS-Go main.go

# =========== RUNTIME 
FROM ubuntu:24.04

WORKDIR /app

COPY --from=builder /app/BaiduPCS-Go .
COPY --from=builder /app/startup.sh .

ENV BDUSS="" PTOKEN="" STOKEN=""

EXPOSE 8080

CMD bash /app/startup.sh

# WORKDIR /usr/src/app

# VOLUME [ "/root/.config" "/root/Downloads"]
# ENV username="admin" password="adminadmin"

# # pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
# COPY BaiduPCS-Go /usr/local/bin/app

# LABEL author="wuzhican"

# EXPOSE 8080
# ENTRYPOINT app serve -auth -username ${username} -password ${password}
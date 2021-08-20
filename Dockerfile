FROM ubuntu:18.04

ENV TZ="Asia/Shanghai"

WORKDIR /cloudreve

COPY entrypoint.sh ./
COPY cloudreve /cloudreve/

VOLUME ["/cloudreve/uploads", "/downloads", "/cloudreve/avatar", "/cloudreve/config", "/cloudreve/db"]

EXPOSE 5212

ENTRYPOINT ["./entrypoint.sh"]
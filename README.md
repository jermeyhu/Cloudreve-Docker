# Cloudreve Docker

- 基于最新的[Cloudreve V3](https://github.com/cloudreve/Cloudreve)
- 镜像体积小
- 纯净安装，无多余组件
- 简易安装

## 开始

使用`docker-compose`进行部署，新建一个目录（后面所有命令均在该目录执行），进入目录新建`docker-compose.yaml`文件如下

```yaml
version: '3.3'

services: 
    aria2: 
        image: p3terx/aria2-pro
        logging: 
            options: 
                max-size: 1m
        environment: 
            - RPC_SECRET=<RPC SECRET>
        ports: 
            - 6888:6888
        volumes: 
            - <PATH TO config>:/config
            - <PATH TO downloads>:/downloads
        restart: unless-stopped

    cloudreve: 
        image: jermey/cloudreve-docker
        ports: 
            - 5212:5212
        depends_on:
            - aria2
        volumes: 
            - <PATH TO uploads>:/cloudreve/uploads
            - <PATH TO downloads>:/downloads
            - <PATH TO config>:/cloudreve/config
            - <PATH TO db>:/cloudreve/db
            - <PATH TO avatar>:/cloudreve/avatar

```

说明

- 首次启动后请执行`docker logs -f cloudreve`获取初始密码,`cloudreve`修改为实际容器名
- `TZ`设置时区，默认值为`Asia/Shanghai`
- `<RPC SECRET>`:默认值为 `P3TERX`
- `<PATH TO uploads>`:上传目录, 如`/data/cloudreve/uploads`
- `<PATH TO config>`: 配置文件夹，如`/data/cloudreve/config`
- `<PATH TO db>`: 数据库文件夹，如`/data/cloudreve/db`
- `<PATH TO avatar>`: 头像文件夹，如`/data/cloudreve/avatar`
- `<PATH TO downloads>`: 下载临时目录，如`/data/cloudreve/downloads`

启动服务:`docker-compose up -d`

## 离线下载配置

- RPC 服务器地址：`http://aria2:6800/`
- RPC Secret:`<RPC SECRET>`
- 临时下载目录:`<PATH TO downloads>`

## 升级

- 停止:`docker-compose stop`
- 删除旧容器:`docker-compose rm`
- 重新启动:`docker-compose up -d`


## 致谢

大量代码抄自: [xavier-niu](https://github.com/xavier-niu/cloudreve-docker)
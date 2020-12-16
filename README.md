<p align="center">
<a href="https://hub.docker.com/r/iarchean/docker-snell-server">
</a>
</p>

<h1 align="center">snell</h1>

<p align="center">an encrypted proxy service program.</p>

<p align=center>
<a href="https://hub.docker.com/r/iarchean/docker-snell-server">Docker Hub</a> ·
</p>
***

## latest version

|version|
|---|
|iarchean/docker-snell-server:latest|

## environment variables

|name|value|
|---|---|
|SERVER_HOST|0.0.0.0|
|SERVER_PORT|21000|
|**PSK**|[RANDOM]|
|**OBFS**|http|
|ARGS|-|

***

### Pull the image

```bash
$ docker pull iarchean/docker-snell-server
```

### Start a container

```bash
$ docker run -p 21000:21000 -p 21000:21000/udp -d \
  --restart always --name=snell iarchean/docker-snell-server
```

### Display config

```bash
$ docker logs snell

[snell-server]
listen = 0.0.0.0:21000
psk = 05d80656cd67e1bec62d3366c13e6f11
obfs = http
2019-02-17 14:11:06.265334 [server_main] <NOTIFY> snell-server v1.1.1 (Mar  5 2019 13:50:05)
2019-02-17 14:11:06.265477 [server_main] <NOTIFY> Start snell server on 0.0.0.0:21000
2019-02-17 14:11:06.265484 [server_main] <NOTIFY> Obfs enabled (HTTP)
2019-02-17 14:11:06.265546 [server_main] <NOTIFY> TCP Fast Open enabled
```

Add a proxy line in Surge

`Proxy = snell, [SERVER ADDRESS], 21000, psk=05d80656cd67e1bec62d3366c13e6f11, obfs=http`
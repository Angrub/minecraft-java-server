# Minecraft Java Server (1.21.5)
Minecraft Java server configuration

# Instructions

## Install dependencies

*Install OpenJDK 21 from Adoptium.*
Download the binary.tar.gz from the [official Adoptium site](https://adoptium.net/es/temurin/releases/?os=any&arch=any&version=21). Example:
```bash
$ wget https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.7%2B6/OpenJDK21U-jdk_x64_linux_hotspot_[version].tar.gz
```

Extract to `/opt/`.
```bash
$ sudo tar -xzf OpenJDK21U-jre_x64_linux_hotspot_[version].tar.gz -C /opt/
```

Configure Java 21 as the default alternative:
```bash
$ sudo update-alternatives --install /usr/bin/java java /opt/jdk-21.0.2+13-jre/bin/java 1

# Select Java 21
$ sudo update-alternatives --config java
```

Verify the version:
```bash
$ java -version
```

## Install and configure server

Download Minecraft Java server from the [official site](https://www.minecraft.net/es-es/download/server). Example:
```bash
$ wget https://piston-data.mojang.com/v1/objects/[build]/server.jar
```

Start the server for the first time:
```bash
$ java -Xmx1024M -Xms1024M -jar server.jar nogui
```

-Xms1G: Minimum RAM (1 GB).

-Xmx1G: Maximum RAM (1 GB, adjust according to your VPS).

This will generate files like eula.txt. You must accept the EULA:
```bash
$ sed -i 's/eula=false/eula=true/g' eula.txt
```

Edit the `server.properties` file or use my [configuration](./recommended.properties):

```bash
$ cat ./recommended.properties > [your server.properties path]
```

Set your server's visible values (`server.properties`):
```properties
# World name
level-name=
# Message that appears in the server list
motd=
```

## Start server
```bash
$ chmod 700 ./start.sh

$ ./start.sh [your server.jar path] [maximum allocated memory]

# example with 6GB of memory
# $ ./start.sh ../server.jar 6144M
```

```bash
$ ./start
```

## Network
Open port 25565 (default port used by the server, can be edited from `server.properties`):
```bash
$ sudo ufw allow 25565/tcp
```
#!/bin/sh

# Default value for server.jar
SERVER_JAR=${1:-"server.jar"}

# Default value for -Xmx
SERVER_MAX_MEMORY=${2:-"2048M"}

exec java -Xms1024M -Xmx"$SERVER_MAX_MEMORY" -jar "$SERVER_JAR" --nogui
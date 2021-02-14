#!/bin/bash

export PASSWORD="$DOCKER_PASSWORD" && /usr/bin/code-server \
    --bind-addr 0.0.0.0:8080 \
    --user-data-dir /etc/vscode/data \
    --extensions-dir /root/.local/share/code-server/extensions \
    --disable-telemetry \
    --auth password \
    --home https://github.com/dclong/docker-vscode-server \
    /workdir/

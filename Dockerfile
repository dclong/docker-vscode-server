FROM dclong/jupyter-nodejs

RUN mkdir -p /config/data/User/ && chmod 777 -R /config \
    && apt-get update \
    && curl -L http://www.legendu.net/media/github_release.py | python3 - cdr/code-server -k amd64.deb -o /tmp/code.deb \                                                                                             
    #&& curl -L https://github.com/cdr/code-server/releases/download/v3.3.1/code-server_3.3.1_amd64.deb -o /tmp/code.deb \
    && dpkg -i /tmp/code.deb \
    && code-server --install-extension formulahendry.terminal \
    && code-server --install-extension ms-python.python \
    && code-server --install-extension njpwerner.autodocstring \
    && code-server --install-extension vscodevim.vim \
    && code-server --install-extension bungcip.better-toml \
    && code-server --install-extension /scripts/VisualStudioExptTeam.vscodeintellicode-1.2.6.vsix \
    #&& code-server --install-extension visualstudioexptteam.vscodeintellicode \
    && chmod -R 777 /root \
    && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*
COPY scripts/ /scripts/
COPY settings/ /config/data/User/
ENV SHELL=/bin/bash
EXPOSE 8080

FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:1

RUN apt update && apt install -y \
    xvfb \
    wget \
    ca-certificates \
    unzip \
    && rm -rf /var/lib/apt/lists/*

RUN cd /opt && \
    wget -O firefox.tar.xz "https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US&type=tar.xz" && \
    tar -xf firefox.tar.xz && \
    rm firefox.tar.xz && \
    ln -sf /opt/firefox/firefox /usr/local/bin/firefox

WORKDIR /app

COPY profile.zip /profile.zip
COPY start.sh /start.sh

RUN unzip /profile.zip -d /profile \
 && chmod +x /start.sh

CMD ["/start.sh"]
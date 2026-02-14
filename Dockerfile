FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:1

RUN apt update && apt install -y \
    firefox \
    xvfb \
    unzip \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY profile.zip /profile.zip
COPY start.sh /start.sh

RUN unzip /profile.zip -d /profile \
 && chmod +x /start.sh

CMD ["/start.sh"]
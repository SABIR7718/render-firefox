FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:1

# Install dependencies
RUN apt update && apt install -y \
    wget \
    xvfb \
    ca-certificates \
    unzip \
    libgtk-3-0 \
    libdbus-glib-1-2 \
    libxt6 \
    libx11-xcb1 \
    libxcb1 \
    libasound2 \
    libnss3 \
    libxss1 \
    libxrandr2 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libpango-1.0-0 \
    libatk1.0-0 \
    libcairo2 \
    libatk-bridge2.0-0 \
    libgbm1 \
    && rm -rf /var/lib/apt/lists/*

RUN apt update && apt install -y curl && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt && \
    cd /opt && \
    curl -L "https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US" -o firefox.tar.xz && \
    tar -xf firefox.tar.xz && \
    rm firefox.tar.xz && \
    ln -sf /opt/firefox/firefox /usr/local/bin/firefox

WORKDIR /app

# Copy your profile and startup script
COPY profile.zip /profile.zip
COPY start.sh /start.sh

# Extract profile
RUN unzip /profile.zip -d /profile && \
    chmod +x /start.sh

CMD ["/start.sh"]
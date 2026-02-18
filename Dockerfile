FROM node:lts-bookworm-slim

RUN apt-get update -y &&\
    apt-get install -y --no-install-recommends zip unzip jq curl ca-certificates gpg git &&\
    curl -fsSL https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor > /usr/share/keyrings/google.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) \
        signed-by=/usr/share/keyrings/google.gpg] \
        http://dl.google.com/linux/chrome/deb/ stable main" \
        > /etc/apt/sources.list.d/google.list && \
    apt-get update && \
    apt-get install -y google-chrome-stable --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* &&\
    npm --version && npx --version && \
    google-chrome --version && \
    zip --version && unzip -v && \
    jq --version && \
    git --version

CMD ["bash"]

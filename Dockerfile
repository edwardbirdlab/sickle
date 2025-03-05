FROM debian:latest

# Dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    make \
    zlib1g-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

# Sickle
RUN curl -L -o sickle.tar.gz https://github.com/najoshi/sickle/archive/refs/tags/v1.33.tar.gz && \
    tar -xzf sickle.tar.gz && \
    cd sickle-1.33 && \
    make && \
    mv sickle /usr/local/bin/ && \
    cd .. && rm -rf sickle-1.33 sickle.tar.gz

ENTRYPOINT ["sickle"]

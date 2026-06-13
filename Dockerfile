FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Install cross-compilation toolchain and build tools
RUN apt-get update && apt-get install -y \
    cmake \
    ninja-build \
    build-essential \
    gcc-arm-none-eabi \
    libnewlib-arm-none-eabi \
    git \
    python3 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the workspace root inside the container
WORKDIR /workspace

CMD ["/bin/bash"]
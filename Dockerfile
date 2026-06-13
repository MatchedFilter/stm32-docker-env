FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Install core build tools and dependencies for adding repositories
RUN apt-get update && apt-get install -y \
    cmake \
    ninja-build \
    build-essential \
    gcc-arm-none-eabi \
    libnewlib-arm-none-eabi \
    git \
    python3 \
    wget \
    gnupg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN wget -qO- https://apt.llvm.org/llvm-snapshot.gpg.key | gpg --dearmor -o /etc/apt/keyrings/llvm-snapshot.gpg \
    && echo "deb [signed-by=/etc/apt/keyrings/llvm-snapshot.gpg] http://apt.llvm.org/noble/ llvm-toolchain-noble-22 main" > /etc/apt/sources.list.d/llvm.list

# Install clangd-22
RUN apt-get update && apt-get install -y \
    clangd-22 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the workspace root inside the container
WORKDIR /workspace

CMD ["/bin/bash"]

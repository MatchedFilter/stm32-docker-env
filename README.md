# stm32-docker-env
This is the docker environment for my stm32 development projects.


## Prerequisites
Install docker and docker-compose
Add your user to docker group:
```bash
sudo usermod -aG docker $USER
```
```bash
newgrp docker
```

## Build

```bash
export UID=$(id -u) GID=$(id -g)
```

```bash
docker compose build --no-cache
```

```bash
docker-compose up -d
```

To Run the docker image:
```bash
docker compose exec -it compiler /bin/bash
```

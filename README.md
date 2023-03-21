### How to generate SSH pair

1. `ssh-keygen`
2. Enter file in which to save the key: `assets/ssh-key/id_rsa`
3. `passphrase: empty`

### How to Build a Container

```sh
docker build \
  -t iamteacher/ssh:arm64 \
  -f ssh.Dockerfile \
  --build-arg BUILDPLATFORM="linux/arm64" \
  --build-arg TARGETARCH="arm64" \
  .
```

### How to Run a Container

```sh
docker run -ti -p 2022:22 iamteacher/ssh:arm64 bash
```

### How to Get in a Container

```sh
ssh -i assets/ssh-key/id_rsa root@localhost -p 2022
```

### How to Run with Docker Compose

```sh
docker compose -f docker/docker-compose.yml up
```

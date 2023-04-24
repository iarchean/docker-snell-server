# archean/snell Docker Image

This Docker image allows you to run a Snell server, a proxy protocol designed to improve the performance and security of your network connections.

## Dockerfile

The Dockerfile is based on the `debian:stable-slim` image and installs the necessary dependencies and Snell server. It supports multiple architectures, including amd64, aarch64, armv7l, and i386.

## Entrypoint

The `entrypoint.sh` script generates a random pre-shared key (PSK) if none is provided, creates the Snell server configuration file, and starts the Snell server.

## Usage

- To build the Docker image, run the following command:

```sh
docker buildx build --build-arg SNELL_VERSION=4.0.1 --platform linux/amd64,linux/arm64,linux/386,linux/arm/v7 -t archean/snell:v4.0.1 --push .
```

To use this Docker image, simply pull it from the Docker Hub repository:

```sh
docker pull archean/snell
```

Then run the Docker container:

```sh
docker run -d --name snell -p 8182:8182 archean/snell
```

By default, the Snell server listens on port 8182. You can change the port by modifying the `-p` argument when running the container. If you want to use a custom pre-shared key (PSK), you can pass it as an environment variable:

```sh
docker run -d --name snell -p 8182:8182 -e PSK="your_custom_psk" archean/snell
```

To view the generated PSK and port, check the logs:

```sh
docker logs snell
```

## Ports

This image exposes the following ports:

- `8182/tcp`: Snell server TCP port
- `8182/udp`: Snell server UDP port

## Contributing

Feel free to submit issues and pull requests if you find any problems or have suggestions for improvements.

## License

This Docker image is released under the MIT License. See [LICENSE](LICENSE) for more information.

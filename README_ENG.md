# PostgreSQL Fulltext Search

[![MIT License][license-shield]][license-url]

## Overview

This repository demonstrates fulltext search methods and possibilities avaliable in PostgreSQL.

## Getting Started

### Prerequisites

- Install [Docker](https://docs.docker.com/get-docker/)

Make sure you have `Docker Engine` and `Docker Compose` installed.

> [!NOTE]
> Depending on local settings, `sudo` may be required to invoke `docker`.

```sh
docker version
```

```sh
docker compose version
```

### Installation

1. open a terminal and download the repository:

    ```sh
    git clone https://github.com/artem-burashnikov/postgresql-fulltext-search.git
    ```

2. Move to the project root:

    ```sh
    cd postgresql-fulltext-search/
    ```

3. Start containers using Docker Compose:

    ```sh
    docker compose up -d
    ```

4. Verify that containers are running:

    ```sh
    docker container ps
    ```

### Usage

TODO

### Cleaning up Docker containers and images

To clean up local images and containers run the following commands:

> [!WARNING]
> The following commands will clear all local image and container data.

1. Delete **_all_** running and stopped containers

    ```sh
    docker container rm -f $(docker container ls -aq)
    ```

2. Delete **_all_** images

    ```sh
    docker image rm -f $(docker image ls -aq)
    ```

## License

The project is licensed under [Unlicense][license-url].

<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[license-shield]: https://img.shields.io/github/license/artem-burashnikov/postgresql-fulltext-search.svg?style=for-the-badge&color=blue
[license-url]: LICENSE

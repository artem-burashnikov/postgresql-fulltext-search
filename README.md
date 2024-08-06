# PostgreSQL Fulltext Search

[![MIT License][license-shield]][license-url]

## Overview

This repository demonstrates fulltext search methods and possibilities avaliable in PostgreSQL.

## Getting Started

TODO

### Prerequisites

- [Docker](https://docs.docker.com/get-docker/)

Specifically make sure you have Docker Engine and Docker Compose installed.

### Installation

TODO

### Usage

TODO

### Clean up Docker containers and images

To clean up Docker images and containers execute the following commands:

1. Remove **_all_** running and stopped docker containers:
    ```sh
    docker container rm -f $(docker container ls -aq)
    ```

2. Remove **_all_** docker images
    ```sh
    docker image rm -f $(docker image ls -aq)
    ```

## License

The project is licensed under an [Unlicense][license-url].

<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[license-shield]: https://img.shields.io/github/license/artem-burashnikov/postgresql-fulltext-search.svg?style=for-the-badge&color=blue
[license-url]: LICENSE
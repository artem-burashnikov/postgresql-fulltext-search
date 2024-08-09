# Полнотекстовый поиск в PostgreSQL

[![MIT License][license-shield]][license-url]

## Обзор

Данный репозиторий демонстрирует методы и возможности полнотекстового поиска, доступные в PostgreSQL.


## Перед использованием

- Установите [Docker](https://docs.docker.com/get-docker/)

Убедитесь, что у вас установлены `Docker Engine` и `Docker Compose`.

> [!NOTE]
> В зависимости от локальных настроек для вызова `docker` может потребоваться `sudo`.

```sh
docker version
```

```sh
docker compose version
```

## Установка

1. Откройте терминал и cкачайте репозиторий:

    ```sh
    git clone https://github.com/artem-burashnikov/postgresql-fulltext-search.git
    ```

2. Переместитесь в корень проекта:

    ```sh
    cd postgresql-fulltext-search/
    ```

3. Запустите контейнеры `postgresql` и `pgadmin4` с помощью Docker Compose:

    ```sh
    docker compose up -d
    ```

4. Убедитесь, что контейнеры запущены:

    ```sh
    docker container ps
    ```

## Использование

TODO

## Остановка работы Docker Compose

Остановить работу Docker Compose:

```sh
docker compose down
```

Удалить локальные данные, связанные с контейнерами (например, файл базы данных), и начать использование с "чистого листа":

```sh
docker compose down -v
```

## Очистка контейнеров и образов Docker

Чтобы очистить локальные образы и контейнеры, выполните следующие команды:

> [!WARNING]
> Следующие команды очистят все локальные данные об образах и контейнерах.

1. Удалить **_все_** запущенные и остановленные контейнеры:

    ```sh
    docker container rm -f $(docker container ls -aq)
    ```

2. Удалить **_все_** образы:

    ```sh
    docker image rm -f $(docker image ls -aq)
    ```

## Лицензия

Проект лицензируется под [Unlicense][license-url].

<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[license-shield]: https://img.shields.io/github/license/artem-burashnikov/postgresql-fulltext-search.svg?style=for-the-badge&color=blue
[license-url]: LICENSE

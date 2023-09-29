# Paonia - Documentation

> Built with [MkDocs](https://mkdocs.org) and [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)

## Installation

```bash
make install
```

This will install required dependencies using `pip`.

## Development

```bash
make serve
```

This will run mkdocs server on [`localhost:8000`](http://localhost:8000).

The markdown files are located in the [`docs`](./docs/) directory.
You can edit the configuration in [`mkdocs.yml`](./mkdocs.yml).

Check the [MkDocs documentation](https://www.mkdocs.org/) and [Material for MkDocs documentation](https://squidfunk.github.io/mkdocs-material/reference/) for more information.

## Deployment

### Docker

You can use the provided [`Dockerfile`](./Dockerfile) to build a docker image.

It will build the docs sources and run a nginx server to serve the static files.

**Using docker-compose**

```bash
docker-compose up --build
```

**Using docker-cli**

```bash
docker build -t docs .
docker run -p 8000:8000 docs
```

### Github Pages

The documentation is automatically deployed on __Github Pages__ when a commit is pushed on the `main` branch.

The configuration is located in the [`.github/workflows/ci.yml`](./.github/workflows/ci.yml) file.

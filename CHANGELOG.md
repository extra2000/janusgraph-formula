# Changelog

## [1.2.0](https://github.com/extra2000/janusgraph-formula/compare/v1.1.1...v1.2.0) (2021-07-25)


### Features

* **network:** add option to use Podman default network ([4adc0d7](https://github.com/extra2000/janusgraph-formula/commit/4adc0d7f97989e987c7ffde5f72ceb18eb7e0959))
* **seccomp:** add option to disable SecComp ([5ea5049](https://github.com/extra2000/janusgraph-formula/commit/5ea50492a95d5bfde00fe2625d9aa21181e365ef))

### [1.1.1](https://github.com/extra2000/janusgraph-formula/compare/v1.1.0...v1.1.1) (2021-07-24)


### Fixes

* **podman-network:** fix Podman network doesn't properly isolated per project name ([dcb008b](https://github.com/extra2000/janusgraph-formula/commit/dcb008b28dbe660fc576d8c3036df561c8acc932))


### Code Refactoring

* **podman-network:** rename Podman network `.conflist` file ([36df0c9](https://github.com/extra2000/janusgraph-formula/commit/36df0c9ca31508a0c6e22e0cf9ef1eb3e8af8abd))


### Documentations

* **README:** add Section Prerequisites ([c7b26ac](https://github.com/extra2000/janusgraph-formula/commit/c7b26ac02eb4336d7e040a4973545a21d7ba1d11))

## [1.1.0](https://github.com/extra2000/janusgraph-formula/compare/v1.0.0...v1.1.0) (2021-07-23)


### Features

* **seccomp:** add default `seccomp` profile ([00ba0fc](https://github.com/extra2000/janusgraph-formula/commit/00ba0fc484968e39e6005cfef7cd4be1faa8e595))


### Continuous Integrations

* **AppVeyor:** add instructions for running `janusgraph` state ([a7d5c1a](https://github.com/extra2000/janusgraph-formula/commit/a7d5c1a5b97562c623e0f1e2fa131e3f1ed5fdca))
* **AppVeyor:** add Podman installation ([9cbb2ef](https://github.com/extra2000/janusgraph-formula/commit/9cbb2ef0ed477de06f1df81b72059bc0645e5914))
* **AppVeyor:** add SaltStack `v3003.1` installation ([ecf162a](https://github.com/extra2000/janusgraph-formula/commit/ecf162aa42e62d79731cdb5d069b6eef65d4b897))
* **AppVeyor:** add workaround for SaltStack jinja2 3.0.x bug ([672b97b](https://github.com/extra2000/janusgraph-formula/commit/672b97b552bbeccec707a914d9b90c5a24b68d99))


### Documentations

* **README:** fix Subsubsection links ([14ccd6e](https://github.com/extra2000/janusgraph-formula/commit/14ccd6ece8b170e4f9313a7c65d19d2bbc3e79e5))

## 1.0.0 (2021-07-22)


### Features

* add required implementations ([e402afe](https://github.com/extra2000/janusgraph-formula/commit/e402afe42587cd349c66b5c308458e9d99c7cdf3))


### Continuous Integrations

* add AppVeyor and `semantic-release` ([803db60](https://github.com/extra2000/janusgraph-formula/commit/803db60045334fa607c05c0a2b5b8a2ce8aebc1b))


### Documentations

* **README:** update `README.md` ([5ddc12e](https://github.com/extra2000/janusgraph-formula/commit/5ddc12eb7fd0e0e05e196bb03c127496cb8b6cf4))

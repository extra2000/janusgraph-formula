# janusgraph-formula

| License | Versioning | Build |
| ------- | ---------- | ----- |
| [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) | [![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release) | [![Build status](https://ci.appveyor.com/api/projects/status/e8vw85tn6x1ahqcu/branch/master?svg=true)](https://ci.appveyor.com/project/nikAizuddin/janusgraph-formula/branch/master) |

SaltStack Formula for [JanusGraph](https://janusgraph.org/).


## Available states

- [`janusgraph`](#janusgraph)
- [`janusgraph.config`](#janusgraph.config)
- [`janusgraph.config.clean`](#janusgraph.config.clean)
- [`janusgraph.selinux`](#janusgraph.selinux)
- [`janusgraph.selinux.clean`](#janusgraph.selinux.clean)
- [`janusgraph.podman`](#janusgraph.podman)
- [`janusgraph.podman.image`](#janusgraph.podman.image)
- [`janusgraph.podman.image.clean`](#janusgraph.podman.image.clean)
- [`janusgraph.podman.deploy`](#janusgraph.podman.deploy)
- [`janusgraph.podman.destroy`](#janusgraph.podman.destroy)
- [`janusgraph.podman.volume.clean`](#janusgraph.podman.volume.clean)
- [`janusgraph.podman.clean`](#janusgraph.podman.clean)
- [`janusgraph.clean`](#janusgraph.clean)


### `janusgraph`

*Meta-state (This is a state that includes other states).*

This deploys the janusgraph podman pod.


### `janusgraph.config`

This state will configure the `janusgraph` podman pod deployment.


### `janusgraph.config.clean`

This state will remove the configuration of the `janusgraph` podman pod deployment.


### `janusgraph.selinux`

This state will load SELinux security policy required by the `janusgraph` podman pod deployment. Only applicable for RedHat families.


### `janusgraph.selinux.clean`

This state will remove SELinux security policy used by the `janusgraph` podman pod deployment.


### `janusgraph.podman`

This state will deploy the `janusgraph` podman pod. The `janusgraph` podman image will be pulled automatically if the image doesn't exists.


### `janusgraph.podman.image`

This state will pull the `janusgraph` podman image only.


### `janusgraph.podman.image.clean`

This state will remove the `janusgraph` podman image.


### `janusgraph.podman.destroy`

This state will destroy and remove the `janusgraph` podman pod.


### `janusgraph.podman.volume.clean`

This state will remove the `janusgraph` podman pod's volume.

### `janusgraph.podman.clean`

*Meta-state (This is a state that includes other states).*

This state will destroy the `janusgraph` podman pod, remove volume, and remove image.

### `janusgraph.clean`

*Meta-state (This is a state that includes other states).*

This state will destroy the `janusgraph` podman pod, remove volume, remove image, and remove configurations for the `janusgraph`.


## Testing

After finished applying `janusgraph` state, test the deployment by connecting to the database:
```
sudo podman run -it --rm --network=janusgraphnet -e GREMLIN_REMOTE_HOSTS=janusgraph-janusgraph-pod docker.io/janusgraph/janusgraph:0.5.3 ./bin/gremlin.sh
```

Then, try to create a data:
```
:remote connect tinkerpop.server conf/remote.yaml
:> g.addV('person').property('name', 'chris')
:> g.V().values('name')
```

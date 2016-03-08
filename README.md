consul-cluster-cookbook
=======================
Cluster cookbook which installs and configures a [Consul][1] cluster.

This cookbook utilizies the [Consul application cookbook][2] to
bootstrap and maintain Consul server infrastructure. It is intended as
an example usage of the [wrapper cookbook pattern][0] and should
hopefully serve as a basis for production infrastructure.

## Basic Usage
The default recipe in this cookbook is designed to install and
configure the Consul agent to bootstrap a cluster. The minimum number
of nodes necessary for the infrastructure is three. After three nodes
have been setup and configured Consul will bootstrap the Cluster.

### Test Kitchen
If you are looking to execute the integration tests you must first configure
the policyfile that ships with the test fixtures.

```sh
~/Projects/consul-cluster-cookbook % chef install test/fixtures/policies/default.rb
~/Projects/consul-cluster-cookbook % kitchen converge ubuntu-1404
```

## Advanced Usage

### TLS Certificates

[1]: https://consul.io/
[2]: https://github.com/johnbellone/consul-cookbook

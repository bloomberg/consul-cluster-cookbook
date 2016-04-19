# consul-cluster cookbook
Cluster cookbook which installs and configures a [Consul][1] cluster
with TLS certificates.

This cookbook utilizies the [Consul application cookbook][2] to
bootstrap and maintain Consul server infrastructure. It is intended as
an example usage of the [wrapper cookbook pattern][0] and should
hopefully serve as a basis for production infrastructure.

## Usage
The default recipe in this cookbook is designed to install and
configure the Consul agent to bootstrap a cluster. The minimum number
of nodes necessary for the infrastructure is three. After three nodes
have been setup and configured Consul will bootstrap the Cluster.

### Chef Vault and TLS
By default, the Consul Cluster cookbook uses Chef Vault to encrypt the
TLS certificates and keys that are deployed to the nodes. This data
should only be capable of being decrypted by the nodes the Consul
Cluster itself.

```json
{
    "ca_certificate": "-----BEGIN CERTIFICATE-----\nMIIE [...]",
    "certificate": "-----BEGIN CERTIFICATE-----\nMIIE [...]",
    "private_key": "-----BEGIN RSA PRIVATE KEY-----\nMIIE [...]"
}
```

### Preparing the Instance
There are many configuration options that are exposed using the
[Consul application cookbook][2] that can be set in either a
[wrapper cookbook][0], a Chef environment or a
[Policyfile](#Using-Policyfiles). But it is good form to not keep
secret information inside of a repository (or not encrypted in the
Chef Server).

The following configuration file can be written to the instances to
set cluster's [datacenter][5] and [encryption key][6] for the gossip
protocol. This file should be written to
_/etc/consul/conf.d/server.json_ on each of the nodes.

```json
{
    "datacenter": "us-east-1",
    "encrypt": "RxNBbMMl3m/cSOdjKDhATg=="
}
```

### Using Policyfiles
It is extremely simple to use [Chef Policyfiles][3] to configure your
three nodes which formulates your Consul cluster. Using the `chef
update` and `chef push` commands you can push the below policy to a
Chef Server. A more detailed explanation of how to use these commands
is for the [chef CLI documentation][4].

```enh-ruby-mode
name 'vault-cluster'
default_source :community
cookbook 'consul-cluster', '~> 2.0'
run_list 'consul-cluster::default'

override['consul']['version'] = '0.6.4'
override['consul']['config']['bootstrap_expect'] = 3
override['consul']['config']['start_join'] = %w{10.0.10.2 10.0.10.3 10.0.10.4}
```

### Test Kitchen
If you are looking to execute the integration tests you must first configure
the policyfile that ships with the test fixtures.

```sh
~/Projects/consul-cluster-cookbook % chef install test/fixtures/policies/default.rb
~/Projects/consul-cluster-cookbook % kitchen converge ubuntu-1404
```

[1]: https://consul.io/
[2]: https://github.com/johnbellone/consul-cookbook
[3]: https://docs.chef.io/config_rb_policyfile.html
[4]: https://docs.chef.io/ctl_chef.html
[5]: https://www.consul.io/docs/agent/options.html#datacenter
[6]: https://www.consul.io/docs/agent/options.html#encrypt

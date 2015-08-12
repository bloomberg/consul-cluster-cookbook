consul-cluster-cookbook
=======================
[![Join the chat at https://gitter.im/johnbellone/consul-cookbook](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/johnbellone/consul-cookbook?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
![Release](http://img.shields.io/github/release/johnbellone/consul-cluster-cookbook.svg)

[Wrapper cookbook][0] which installs and configures a [Consul][1] cluster.

This cookbook utilizies the [Consul application cookbook][2] to
bootstrap and maintain Consul server infrastructure. It is intended as
an example usage of the [wrapper cookbook pattern][0] and should
hopefully serve as a basis for production infrastructure.

## Basic Usage
The default recipe in this cookbook is designed to install and
configure the Consul agent to bootstrap a cluster. The minimum number
of nodes necessary for the infrastructure is three. After three nodes
have been setup and configured Consul will bootstrap the Cluster.

### Bootstrap Expect

[0]: http://blog.vialstudios.com/the-environment-cookbook-pattern#thewrappercookbook
[1]: https://consul.io/
[2]: https://github.com/johnbellone/consul-cookbook

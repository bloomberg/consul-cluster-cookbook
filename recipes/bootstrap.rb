#
# Cookbook: consul-cluster
# License: Apache 2.0
#
# Copyright 2015 Bloomberg Finance L.P.
#
node.default['consul']['config']['bootstrap'] = true
include_recipe 'consul-cluster::default'

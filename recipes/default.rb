#
# Cookbook: consul-cluster
# License: Apache 2.0
#
# Copyright 2015 Bloomberg Finance L.P.
#
node.default['consul']['config']['bootstrap_expect'] = node['consul-cluster']['config']['bootstrap_expect']
node.default['consul']['config']['server'] = true
include_recipe 'consul::default'

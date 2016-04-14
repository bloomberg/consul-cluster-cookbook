#
# Cookbook: consul-cluster
# License: Apache 2.0
#
# Copyright 2015-2016, Bloomberg Finance L.P.
#
certificate = ssl_certificate node['consul']['service_name'] do
  owner node['consul']['service_user']
  group node['consul']['service_group']
  namespace node['consul-cluster']['tls']
  notifies :reload, "consul_service[#{name}]", :delayed
end

node.default['consul']['config']['server'] = true
node.default['consul']['config']['verify_incoming'] = true
node.default['consul']['config']['verify_outgoing'] = true
node.default['consul']['config']['ca_file'] = certificate.chain_path
node.default['consul']['config']['cert_file'] = certificate.cert_path
node.default['consul']['config']['key_file'] = certificate.key_path
include_recipe 'consul::default'

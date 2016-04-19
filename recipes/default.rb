#
# Cookbook: consul-cluster
# License: Apache 2.0
#
# Copyright 2015-2016, Bloomberg Finance L.P.
#
poise_service_user node['consul']['service_user'] do
  group node['consul']['service_group']
end

directory File.dirname(node['consul-cluster']['tls']['ssl_key']['path']) do
  recursive true
  owner node['consul']['service_user']
  group node['consul']['service_group']
end

directory File.dirname(node['consul-cluster']['tls']['ssl_cert']['path']) do
  recursive true
  owner node['consul']['service_user']
  group node['consul']['service_group']
end

certificate = ssl_certificate node['consul']['service_name'] do
  owner node['consul']['service_user']
  group node['consul']['service_group']
  namespace node['consul-cluster']['tls']
  notifies :reload, "consul_service[#{name}]", :delayed
end

node.default['consul']['config']['server'] = true
node.default['consul']['config']['verify_incoming'] = true
node.default['consul']['config']['verify_outgoing'] = true
node.default['consul']['config']['bind_addr'] = node['ipaddress']
node.default['consul']['config']['advertise_addr'] = node['ipaddress']
node.default['consul']['config']['advertise_addr_wan'] = node['ipaddress']
node.default['consul']['config']['ca_file'] = certificate.chain_path
node.default['consul']['config']['cert_file'] = certificate.cert_path
node.default['consul']['config']['key_file'] = certificate.key_path
include_recipe 'consul::default'

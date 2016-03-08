#
# Cookbook: consul-cluster
# License: Apache 2.0
#
# Copyright 2015-2016, Bloomberg Finance L.P.
#
directory '/etc/consul/ssl/CA' do
  recursive true
end

if node['consul-cluster']['config']['manage_tls']
  certificate = ssl_certificate node['consul']['service_name'] do
    namespace node['consul-cluster']['tls']
    notifies :reload, "consul_service[#{name}]", :delayed
  end

  node.default['consul']['config']['verify_incoming'] = true
  node.default['consul']['config']['ca_file'] = certificate.ssl_chain.path
  node.default['consul']['config']['cert_file'] = certificate.ssl_cert.path
  node.default['consul']['config']['key_file'] = certificate.ssl_key.path
end

node.default['consul']['config']['server'] = true
include_recipe 'consul::default'

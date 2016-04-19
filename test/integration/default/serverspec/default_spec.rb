require 'chef-vault/test_fixtures'
require 'serverspec'
set :backend, :exec

describe user('consul') do
  it { should exist }
  it { should belong_to_primary_group 'consul' }
end

describe group('consul') do
  it { should exist }
end

describe file('/var/lib/consul') do
  it { should exist }
  it { should be_directory }
  it { should be_owned_by 'consul' }
  it { should be_grouped_into 'consul' }
end

# TODO: Add checks for TLS certificates and keys.

describe service('consul') do
  it { should be_enabled }
  it { should be_running }
end

%w{8300 8301 8302 8400 8500 8600}.each do |port_number|
  describe port(port_number) do
    it { should be_listening }
  end
end

require 'chef-vault/test_fixtures'
require 'serverspec'
set :backend, :exec

describe service('consul') do
  it { should be_enabled }
  it { should be_running }
end

%w{8300 8400 8500 8600}.each do |port_number|
  describe port(port_number) do
    it { should be_listening }
  end
end

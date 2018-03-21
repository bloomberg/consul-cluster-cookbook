name 'consul-cluster'
maintainer 'John Bellone'
maintainer_email 'jbellone@bloomberg.net'
license 'Apache 2.0'
description 'Wrapper cookbook which installs and configures a Consul cluster.'
long_description 'Wrapper cookbook which installs and configures a Consul cluster.'
version '2.1.0'

supports 'centos', '>= 6.4'
supports 'redhat', '>= 6.4'
supports 'ubuntu', '>= 12.04'

depends 'ssl_certificate', '~> 2.1'
depends 'consul', '~> 3.1'

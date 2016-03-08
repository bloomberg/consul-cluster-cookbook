name 'consul-cluster'
run_list 'consul-cluster::default'
default_source :community
cookbook 'consul-cluster', path: '.'

override['consul-cluster']['manage_tls'] = true
override['consul']['config']['bootstrap_expect'] = 1

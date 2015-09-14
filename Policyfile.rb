name 'consul-cluster'
run_list 'consul-cluster::default'
default_source :community
cookbook 'consul-cluster', path: '.'

source 'https://rubygems.org'
gem 'test-kitchen'

group :lint do
  gem 'rubocop'
  gem 'foodcritic', git: 'https://github.com/acrmp/foodcritic'
end

group :kitchen_vagrant do
  gem 'kitchen-vagrant'
end

group :kitchen_cloud do
  gem 'kitchen-openstack'
end

group :unit do
  gem 'berkshelf'
  gem 'chefspec'
end

group :integration do
  gem 'serverspec'
end

group :development do
  gem 'awesome_print'
  gem 'guard'
  gem 'guard-kitchen'
  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'guard-foodcritic'
  gem 'rake'
  gem 'stove'
end

group :doc do
  gem 'yard'
end

source 'http://rubygems.org'

gem 'rails', '3.0.3'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'inherited_resources'
gem 'authlogic', :git => 'git://github.com/binarylogic/authlogic.git'
gem 'cancan'
gem 'simple_form'
#gem 'dynamic_form' #for error_messages_on et al.
gem 'haml'
gem "compass"
gem "hassle", :git => "git://github.com/koppen/hassle.git" #fixes compass on heroku
gem 'jammit'
gem 'barista', '~> 1.0'


# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end
group :development, :test, :cucumber do
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem "ffaker"
  gem "factory_girl", ">=2.0.0.beta1"
end

group :test, :cucumber do
  gem "rspec-rails", "~> 2.4"
  gem "spork"
  gem "cucumber-rails"
  gem "capybara"
  gem "database_cleaner"
end

group :production do
end

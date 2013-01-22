source 'https://rubygems.org'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  
  gem 'anjlab-bootstrap-rails', '>= 2.1', :require => 'bootstrap-rails'
  gem 'font-awesome-sass-rails'
end

group :production do
  gem "execjs", "1.4.0"
  gem "therubyracer", "0.10.2"
end

gem 'jquery-rails'
gem 'devise'

gem 'bootstrap-generators', '~> 2.1'

group :test, :development do
  gem "minitest-rails"
  gem "factory_girl_rails", "~> 4.0", :require=>false
end

group :test do
  gem "minitest-rails-capybara"
  gem "capybara-webkit"
  gem "minitest-rails-shoulda"
  gem "mocha", :require => false
  gem "database_cleaner"
  gem "launchy"
end

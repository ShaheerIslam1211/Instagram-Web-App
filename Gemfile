source 'https://rubygems.org'

ruby '3.3.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap', '~> 5.3'
gem 'carrierwave', '~> 2.0'
gem 'cloudinary', '~> 1.26'
gem 'coffee-rails', '~> 5.0'
gem 'devise', '~> 4.8'
gem 'dropzonejs-rails', '~> 0.8.2'
gem 'figaro', '~> 1.2'
gem 'jbuilder', '~> 2.11'
gem 'jquery-rails', '~> 4.4'
gem 'meta-tags', '~> 2.15'
gem 'omniauth', '~> 2.0'
gem 'omniauth-twitter', '~> 1.4'
gem 'puma', '~> 5.5'
gem 'rails', '~> 7.0.0'
gem 'sass-rails', '~> 6.0'
gem 'toastr-rails', '~> 1.0'
gem 'turbolinks', '~> 5.2'
gem 'uglifier', '>= 4.2.0'
gem 'will_paginate-bootstrap4', '~> 0.2.2'
gem 'execjs', '~> 2.8'
gem 'bundler', '~> 2.3'

# Ensure nokogiri is specified correctly
gem 'nokogiri', '~> 1.12.5'

# Ensure PostgreSQL adapter is specified correctly
gem 'pg', '~> 1.2'

# Ensure tzinfo-data is specified correctly
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Ensure annotate gem is specified correctly
gem 'annotate', '~> 3.2'

group :development, :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 3.35'
  gem 'selenium-webdriver', '~> 4.0'
  gem 'sqlite3', '~> 1.4'
  gem 'pry-rails', '~> 0.3'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 4.2'
  gem 'listen', '~> 3.9.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0'
end

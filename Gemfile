# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

# gem "rails"

ruby '3.0.0'
gem 'capybara'
gem 'pg'
gem 'rspec'
gem 'sinatra'
gem 'sinatra-contrib'
gem 'webrick'
gem 'bcrypt'

group :test do
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development, :test do
  gem 'rubocop', '1.20'
end

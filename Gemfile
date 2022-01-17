# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# gem "rails"


ruby '3.0.0'
gem 'sinatra'
gem 'sinatra-contrib'
gem 'rspec'
gem 'capybara'
gem 'webrick'
gem 'pg'

group :test do

  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development, :test do
  gem 'rubocop', '1.20'
end
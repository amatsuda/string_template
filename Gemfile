# frozen_string_literal: true

source 'https://rubygems.org'

# Specify your gem's dependencies in string_template.gemspec
gemspec

if ENV['RAILS_VERSION'] == 'edge'
  gem 'rails', git: 'https://github.com/rails/rails.git'
elsif ENV['RAILS_VERSION']
  gem 'rails', "~> #{ENV['RAILS_VERSION']}.0"
end

gem 'logger' if RUBY_VERSION >= '3.5'
gem 'bigdecimal' if RUBY_VERSION >= '3.4'
gem 'mutex_m' if RUBY_VERSION >= '3.4'

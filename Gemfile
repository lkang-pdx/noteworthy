source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development, :test do
  gem 'pry-rails'
  gem 'faker'
end

group :development do
  gem 'sqlite3'
  gem 'listen'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'erb2haml', '~> 0.1.5'
end

group :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'rails-controller-testing'
  gem 'shoulda'
  gem 'factory_girl_rails'
  gem 'simplecov'
end

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'

gem 'bootstrap-sass'
gem 'devise'
gem 'figaro'
gem 'haml', '~> 5.0'
gem 'simple_form', '~> 3.4'
gem 'elasticsearch-model'
gem 'elasticsearch-rails'
gem 'bonsai-elasticsearch-rails'

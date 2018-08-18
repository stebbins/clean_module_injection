source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.1'
gem 'sqlite3'
gem 'puma', '~> 3.11'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'delayed_job'
gem 'delayed_job_active_record'

group :development, :test do
  gem 'pry-byebug'
end

group :development do
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rspec-rails'
end

source 'https://rubygems.org'

# Specify your gem's dependencies in rails_stdout_logging.gemspec
gemspec

gem "rails", "4.0.0"

group :development, :test do
  gem 'rake'
  gem "capybara", "~> 1.1.2"
  gem "launchy"

  gem "sqlite3",                          :platform => [:ruby, :mswin, :mingw]
  gem "activerecord-jdbcsqlite3-adapter", '>= 1.3.0.beta', :platform => :jruby
end

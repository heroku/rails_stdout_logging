require 'fileutils'

# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

DEBUG_STDOUT = STDOUT
STDOUT = StringIO.new

DEBUG_STDERR = STDERR
STDERR = StringIO.new

# triggers an error message if default logger loads and cannot write log file
logdir = File.join(File.dirname(__FILE__), 'dummy', 'log')
FileUtils.mkdir_p logdir
FileUtils.chmod 'ugo-wx', logdir

ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../')
require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"




ActionMailer::Base.delivery_method = :test
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.default_url_options[:host] = "test.com"

Rails.backtrace_cleaner.remove_silencers!

# Configure capybara for integration testing
require "capybara/rails"
Capybara.default_driver   = :rack_test
Capybara.default_selector = :css



# Run any available migration
ActiveRecord::Migrator.migrate File.expand_path("../dummy/db/migrate/", __FILE__)

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

def puts(msg)
  DEBUG_STDOUT.puts(msg)
end


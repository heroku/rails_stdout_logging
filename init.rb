# only applies when used as a plugin
case Rails::VERSION::MAJOR
when 2
  require 'rails_log_stdout/rails2'
  RailsLogStdout::Rails2.set_logger
when 3
  require 'rails_log_stdout/rails3'
  RailsLogStdout::Rails3.set_logger
end

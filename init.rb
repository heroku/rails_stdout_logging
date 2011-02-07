logger = Logger.new(STDOUT)
logger.level = Logger::INFO

case Rails::VERSION::MAJOR
  when 3 then Rails.logger = Rails.application.config.logger = logger
  when 2 then Object.const_set "RAILS_DEFAULT_LOGGER", logger
end

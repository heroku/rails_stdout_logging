case Rails::VERSION::MAJOR
when 3 then
  Rails.logger = Rails.application.config.logger = begin
    logger = Logger.new(STDOUT)
    logger.level = Logger::INFO
    logger
  end
when 2 then
  logger = Logger.new(STDOUT)
  logger.level = Logger::INFO
  Object.const_set "RAILS_DEFAULT_LOGGER", logger
end


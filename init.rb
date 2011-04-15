STDOUT.sync = true

case Rails::VERSION::MAJOR

when 3 then
  logger = Logger.new(STDOUT)
  logger.level = Logger.const_get((%w[DEBUG INFO WARN ERROR FATAL UNKNOWN] & [ENV['LOG_LEVEL'].to_s.upcase, "INFO"]).compact.first)
  Rails.logger = Rails.application.config.logger = logger

when 2 then
  # redefine Rails.logger
  def Rails.logger
    @@logger ||= begin
      logger = Logger.new(STDOUT)
      logger.level = Logger.const_get((%w[DEBUG INFO WARN ERROR FATAL UNKNOWN] & [ENV['LOG_LEVEL'].to_s.upcase, "INFO"]).compact.first)
      logger
    end
  end

  # borrowed from Rails::Initializer#initialize_framework_logging
  ([ :active_record, :action_controller, :action_mailer ] & Rails.configuration.frameworks).each do |framework|
    framework.to_s.camelize.constantize.const_get("Base").logger = Rails.logger
  end
  ActiveSupport::Dependencies.logger = Rails.logger
  Rails.cache.logger = Rails.logger
end

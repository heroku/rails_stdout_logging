module RailsStdoutLogging
  class Rails

    def self.heroku_stdout_logger
      logger = Logger.new(STDOUT)
      logger = ActiveSupport::TaggedLogging.new(logger) if defined?(ActiveSupport::TaggedLogging)
      logger.level = Logger.const_get(log_level)
      logger
    end

    def self.log_level
      ([ENV['LOG_LEVEL'].to_s.upcase, "INFO"] & %w[DEBUG INFO WARN ERROR FATAL UNKNOWN]).compact.first
    end

    def self.set_logger
      STDOUT.sync = true
    end
  end
end

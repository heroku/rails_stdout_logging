module RailsLogStdout
  class Rails

    def self.heroku_stdout_logger
      logger = Logger.new(STDOUT)
      logger.level = Logger.const_get(([ENV['LOG_LEVEL'].to_s.upcase, "INFO"] & %w[DEBUG INFO WARN ERROR FATAL UNKNOWN]).compact.first)
      logger
    end

    def self.set_logger
      STDOUT.sync = true
    end

  end
end

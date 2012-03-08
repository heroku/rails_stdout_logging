require 'rails_log_stdout/rails'

module RailsLogStdout
  class Rails3 < Rails
    def self.set_logger(config)
      super()
      ::Rails.logger = config.logger = heroku_stdout_logger
    end
  end
end

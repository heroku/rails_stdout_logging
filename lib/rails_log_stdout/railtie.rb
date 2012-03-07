require 'rails_log_stdout/rails3'

module RailsLogStdout
  class Railtie < Rails::Railtie
    config.after_configuration do
      Rails3.set_logger(config)
    end
  end
end

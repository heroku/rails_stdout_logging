require 'rails_stdout_logging/rails3'

module RailsStdoutLogging
  class Railtie < ::Rails::Railtie
    initializer(:rails_stdout_logging, before: :initialize_logger) do
      Rails3.set_logger(config)
    end

    console do
      ::Rails.logger.instance_variable_set(:@level, Float::INFINITY)
    end
  end
end

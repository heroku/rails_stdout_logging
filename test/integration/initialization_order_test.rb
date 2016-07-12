require 'test_helper'

class InitializationOrderTest < ActiveSupport::IntegrationCase
  test 'Stderr does not contain error message' do
    assert_no_match /Unable to access log file./, STDERR.string
  end
end

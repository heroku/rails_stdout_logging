require 'test_helper'

class CustomLoggerTest < ActiveSupport::IntegrationCase
  test 'Supports custom logger' do
    visit bar_index_path
    assert_match /^\[CustomLogFormatter\][^\n]+?Logging with Rails.logger$/, STDOUT.string
  end
end

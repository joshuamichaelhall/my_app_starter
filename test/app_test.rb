# Sinatra/Rack will not start a web server if test...
ENV["RACK_ENV"] = "test"

# Testing libraries
require "minitest/autorun"
require "rack/test"

# App to be tested
require_relative "../app"

class AppTest < Minitest::Test
  include Rack::Test::Methods

  # Required by "rack/test", returns instance of Rack app
  def app
    Sinatra::Application
  end

  def test_index
    get "/"
    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_equal "Hello, world!", last_response.body
  end
end

# Run tests with: $ bundle exec ruby test/app_test.rb
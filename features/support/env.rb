require "rspec"
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara/webkit'
require 'capybara/pompom'

Capybara.configure do |config|
  config.default_driver = :webkit
  config.app_host = 'file://' + File.dirname(__FILE__) + '/../../fixtures/html'
end

Capybara::Webkit.configure do |config|
  config.allow_url("")
end

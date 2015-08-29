require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'

Capybara.configure do |config|
  config.default_driver = :selenium
  config.javascript_driver = :selenium
  config.app_host = 'file://' + File.dirname(__FILE__) + '/../../fixtures/html'
end

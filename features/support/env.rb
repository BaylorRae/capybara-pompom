require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require "selenium-webdriver"
require 'capybara/pompom'

Capybara.configure do |config|
  config.default_driver = :selenium
  config.javascript_driver = :selenium
  config.app_host = 'file://' + File.dirname(__FILE__) + '/../../fixtures/html'
end

Selenium::WebDriver::Firefox::Binary.path = "#{ENV['HOME']}/Applications/Firefox.app/Contents/MacOS/firefox"

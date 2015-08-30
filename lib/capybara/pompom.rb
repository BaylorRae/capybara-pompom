require "capybara"
require "capybara/pompom/version"

module Capybara
  module PomPom
    autoload :Page, "capybara/pompom/page"
    autoload :ElementFinder, "capybara/pompom/element_finder"
  end
end

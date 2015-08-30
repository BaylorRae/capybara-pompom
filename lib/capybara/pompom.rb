require "capybara"
require "capybara/pompom/version"
require "active_support/core_ext/class/attribute"

module Capybara
  module PomPom
    autoload :Page, "capybara/pompom/page"
    autoload :Finder, "capybara/pompom/finder"
    autoload :ElementFinder, "capybara/pompom/element_finder"
  end
end

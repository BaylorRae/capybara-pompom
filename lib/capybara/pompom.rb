require "capybara"
require "capybara/pompom/version"
require "active_support/core_ext/class/attribute"

module Capybara
  module PomPom
    autoload :Page, "capybara/pompom/page"
    autoload :Finder, "capybara/pompom/finder"
    autoload :ElementFinder, "capybara/pompom/element_finder"
    autoload :TableRow, "capybara/pompom/table_row"
    autoload :TableFinder, "capybara/pompom/table_finder"
    autoload :Table, "capybara/pompom/table"
    
    # exceptions
    autoload :TableRowNotFound, "capybara/pompom/table"
  end
end

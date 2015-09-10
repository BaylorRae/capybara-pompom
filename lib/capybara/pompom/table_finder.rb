module Capybara::PomPom
  # == Capybara::PomPom::TableFinder
  #
  # Wraps the Capybara::Node::Element in a Table
  class TableFinder < ElementFinder

    # Returns the found table with Table
    def get
      element = send(type, locator)
      Table.new(element, wrapper)
    end

  end
end

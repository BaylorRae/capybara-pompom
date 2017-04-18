module Capybara::PomPom
  # == Capybara::PomPom::ComponentFinder
  #
  # Wraps the Capybara::Node::Element in a Component
  class ComponentFinder < ElementFinder
    def get
      element = send(type, locator)
      Component.new(element)
    end
  end
end

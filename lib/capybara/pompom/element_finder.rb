module Capybara::PomPom
  # == Capybara::PomPom::ElementFinder
  #
  # ElementFinder is used as a lambda to find elements when invoked by the Page
  # instance rather than when defined.
  class ElementFinder
    include Capybara::DSL

    attr_reader :type, :locator, :wrapper

    # Initializes a new ElementFinder
    #
    # === Parameters
    # - +type+: the capybara finder. E.g. +find_css+, +find_link+, etc...
    # - +locator+: the locator used by capybara to find element.
    # - +wrapper+ (optional): an instance to wrap the found element in.
    def initialize(type, locator, wrapper = nil)
      @type = type
      @locator = locator
      @wrapper = wrapper
    end

    # Returns the Capybara::Element or +wrapper+ if defined.
    def get
      element = send(type, locator)

      unless wrapper.nil?
        element = wrapper.new(element)
      end

      element
    end

  end
end

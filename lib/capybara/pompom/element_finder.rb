module Capybara::PomPom
  class ElementFinder
    include Capybara::DSL

    attr_reader :type, :locator, :wrapper

    def initialize(type, locator, wrapper = nil)
      @type = type
      @locator = locator
      @wrapper = wrapper
    end

    def get
      element = send(type, locator)

      unless wrapper.nil?
        element = wrapper.new(element)
      end

      element
    end

  end
end

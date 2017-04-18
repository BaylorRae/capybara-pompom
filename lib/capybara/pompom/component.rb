module Capybara::PomPom
  class Component
    include Finder

    attr_reader :component

    def method_missing(name, *args)
      if self.finders.has_key?(name)
        return self.finders[name].get(component)
      end

      super
    end

    def initialize(component)
      @component = component
    end

  end
end

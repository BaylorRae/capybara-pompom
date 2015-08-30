module Capybara::PomPom
  module Finder

    def self.included(mod)
      mod.class_attribute :finders
      mod.finders = {}

      def mod.link(name, locator)
        self.finders[name] = ElementFinder.new(:find_link, locator)
      end

      def mod.field(name, locator)
        self.finders[name] = ElementFinder.new(:find_field, locator)
      end

      def mod.button(name, locator)
        self.finders[name] = ElementFinder.new(:find_button, locator)
      end

      def method_missing(name, *args)
        if self.finders.has_key?(name)
          return self.finders[name].get
        end

        super
      end
    end

  end
end

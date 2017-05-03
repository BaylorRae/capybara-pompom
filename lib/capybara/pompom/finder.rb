module Capybara::PomPom
  # == Capybara::PomPom::Finder
  #
  # Adds helper methods to Page for accessing Capybara elements in an instance.
  #
  #   class CustomPage
  #     include Capybara::PomPom::Finder
  #
  #     link :documentation_link, "View Documentation"
  #
  #     def view_docs
  #       documentation_link.click
  #     end
  #   end
  module Finder

    def self.included(mod) # :nodoc:
      mod.class_attribute :finders
      mod.finders = {}

      # Provides access to finders defined at the class level.
      def method_missing(name, *args)
        if self.finders.has_key?(name)
          return self.finders[name].get
        end

        super
      end

      mod.extend Finder
    end

    # Finds a node with +find+
    #
    #   css :title, ".title"
    #
    # Returns a +Capybara::Node::Element+
    def css(name, locator)
      self.finders[name] = ElementFinder.new(:find, locator)
    end

    # Finds a link through +find_link+
    #
    #   link :login_link, "Log In"
    #
    # Returns a +Capybara::Node::Element+
    def link(name, locator)
      self.finders[name] = ElementFinder.new(:find_link, locator)
    end

    # Finds a field through +find_field+
    #
    #   field :username, "user[username]"
    #
    # Returns a +Capybara::Node::Element+
    def field(name, locator)
      self.finders[name] = ElementFinder.new(:find_field, locator)
    end

    # Finds a button through +find_button+
    #
    #   button :login_button, "Log In"
    #
    # Returns a +Capybara::Node::Element+
    def button(name, locator)
      self.finders[name] = ElementFinder.new(:find_button, locator)
    end

    # Finds a table through +find+
    #
    #   table :products_table, "#products", row_wrapper: TableRowWrapper
    #
    # Returns a Table
    def table(name, locator, row_wrapper: nil)
      self.finders[name] = TableFinder.new(:find, locator, wrapper: row_wrapper)
    end

    # Finds a component through +find+
    #
    #   component :overview_component, "#overview"
    #
    # Returns a Component
    def component(name, locator)
      self.finders[name] = ElementFinder.new(:find, locator, wrapper: Component)
    end

    # Finds components through +all+
    #
    #   components :statuses, ".status"
    #
    # Returns a Component
    def components(name, locator, wrapper: nil)
      self.finders[name] = ElementFinder.new(:all, locator, wrapper: wrapper)
    end

  end
end

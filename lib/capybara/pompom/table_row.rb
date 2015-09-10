module Capybara::PomPom
  class TableRow < Struct.new(:row)
    include Finder

    def method_missing(name, *args)
      if self.finders.has_key?(name)
        return self.finders[name].get(row)
      end

      super
    end

    def self.column(name, options)
      self.finders[name] = ElementFinder.new(:find, "td:nth-child(#{options.fetch(:at_index)})")
    end

  end
end

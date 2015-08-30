module Capybara::PomPom
  class Page
    include Capybara::DSL
    include Finder

    def self.method_missing(name, *args)
      page = new
      page.send(name, *args)
      page
    end

  end
end

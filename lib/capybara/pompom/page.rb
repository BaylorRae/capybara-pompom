module Capybara::PomPom
  # == Capybara::PomPom::Pag
  #
  #   class LoginPage < Capybara::PomPom::Page
  #     field :username_field, "Username"
  #     field :password_field, "user[password]"
  #     button :login_button, "Log In"
  #
  #     def login_as(username, password)
  #       username_field.set(username)
  #       password_field.set(password)
  #       login_button.click
  #     end
  #   end
  class Page
    include Capybara::DSL
    include Finder

    def self.method_missing(name, *args) # :nodoc:
      page = new
      page.send(name, *args)
    end
  end
end

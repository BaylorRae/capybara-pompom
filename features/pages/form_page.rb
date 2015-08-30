class FormPage < Capybara::PomPom::Page

  field :username, "Username"
  field :password, "Password"

  def fill_in_credentials(login, pass)
    username.set(login)
    password.set(pass)
  end

end

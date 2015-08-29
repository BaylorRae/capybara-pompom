# Capybara::PomPom

The goal of this gem is to create a DSL for the [Page Object
Model][page_object_model].

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capybara-pompom'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capybara-pompom

## Usage

**Given:** we have the following page defined.

```ruby
class LoginPage < Capybara::PomPom::Page

  # uses capybara's find_field(locator)
  field :username, "Username"
  field :password, "Password"

  # uses capybara's find_button(locator)
  button :login_button, "Log In"

  # this page acts on the '/login' url
  def initialize
    visit '/login'
  end

  # Actions
  # login as a user
  def login_as(login, pass)
    username.set(login)
    password.set(password)
    login_button.click
  end

end
```

**Then:** it can be used like this.

```ruby
# login steps
LoginPage.login_as('bob', 'password123')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/capybara-pompom/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[page_object_model]: https://code.google.com/p/selenium/wiki/PageObjects

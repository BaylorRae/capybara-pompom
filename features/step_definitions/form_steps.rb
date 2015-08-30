Given(/^I'm on the login page$/) do
  visit '/form.html'
end

Then(/^I should be able to fill in my credentials$/) do
  FormPage.fill_in_credentials('bob.wiley', 'password')

  expect(find_field("Username").value).to eq('bob.wiley')
  expect(find_field("Password").value).to eq('password')
end

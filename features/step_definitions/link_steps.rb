Given(/^I'm on the link page$/) do
  visit '/links.html'
end

When(/^I click the "View Form" link$/) do
  LinksPage.visit_forms_page
end

Then(/^I should be on the form page$/) do
  expect(page).to have_content('Form Page')
end

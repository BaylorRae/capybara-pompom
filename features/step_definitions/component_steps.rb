Given(/^I'm on the component page$/) do
  visit '/components.html'
end

Then(/^I should be able to wrap a single component$/) do
  component_page = ComponentsPage.new
  overview = component_page.overview_component

  expect(overview.title).to have_content('An Overview')
  expect(overview.description).to have_content('This section is a single component')
end

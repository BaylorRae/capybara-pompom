Given(/^I'm on the component page$/) do
  visit '/components.html'
end

Then(/^I should be able to wrap a single component$/) do
  component_page = ComponentsPage.new
  overview = component_page.overview_component

  expect(overview.title).to have_content('An Overview')
  expect(overview.description).to have_content('This section is a single component')
end

Then(/^I should be able to wrap multiple components$/) do
  component_page = ComponentsPage.new
  user_statuses = component_page.statuses

  expect(user_statuses.length).to eq(3)

  STATUSES = [
    { name: 'Bob Wiley', status: 'Online' },
    { name: 'Alice', status: 'Offline' },
    { name: 'Leo Marvin', status: 'Online' }
  ]

  STATUSES.each_with_index do |status, i|
    status_component = user_statuses[i]
    expect(status_component.name.text).to eq(status[:name])
    expect(status_component.status.text).to eq(status[:status])
  end
end

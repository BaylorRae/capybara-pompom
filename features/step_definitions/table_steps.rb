Given(/^I'm on the table page$/) do
  visit '/tables.html'
end

Then(/^I should be able to wrap the table rows$/) do
  TablesPage.should_have_second_row
end

class TablesPage < Capybara::PomPom::Page
  include RSpec::Matchers

  class Example1Row < Capybara::PomPom::TableRow
    column :column_1, at_index: 1
    column :column_2, at_index: 2
    column :column_3, at_index: 3
  end

  table :example_table_1, "#example-table-1", row_wrapper: Example1Row

  def should_have_second_row
    row = example_table_1.get_row(2)

    expect(row.column_1.text).to eq('(row 2) column 1')
    expect(row.column_2.text).to eq('(row 2) column 2')
    expect(row.column_3.text).to eq('(row 2) column 3')
  end

end

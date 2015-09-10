module Capybara::PomPom
  class TableRowNotFound < Capybara::ElementNotFound; end

  class Table
    attr_reader :table, :row_wrapper

    def initialize(table, row_wrapper = nil)
      @table = table
      @row_wrapper = row_wrapper || TableRow
    end

    def get_row(index)
      row = table.find("tbody tr:nth-child(#{index})")
      row_wrapper.new(row)
    rescue Capybara::ElementNotFound => e
      raise TableRowNotFound.new(e)
    end

  end
end

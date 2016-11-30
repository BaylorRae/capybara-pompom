require "spec_helper"

module Capybara::PomPom
  describe Table do

    before do
      stub_const('ExampleRowWrapper', TableRow)
    end

    context "get_row" do
      let(:element) { double(:capybara_element) }
      let(:table) { Table.new(element, ExampleRowWrapper) }
      let(:row) { double(:example_row) }

      it "wraps the row" do
        allow(element).to receive(:find).with("tbody tr:nth-child(1)") { row }
        expect(table.get_row(1)).to eq(ExampleRowWrapper.new(row))
      end

      it "defaults to wrapping with TableRow" do
        table = Table.new(element)
        allow(element).to receive(:find).with("tbody tr:nth-child(1)") { row }
        expect(table.get_row(1)).to eq(TableRow.new(row))
      end

      it "throws an error if the row can't be found" do
        allow(element).to receive(:find) { raise Capybara::ElementNotFound }

        expect do
          table.get_row(1337)
        end.to raise_error(Capybara::PomPom::TableRowNotFound)
      end
    end

  end
end

require "spec_helper"

module Capybara::PomPom
  describe TableFinder do

    let(:finder) { TableFinder.new(:find_xyz, "table-locator", ExampleRowWrapper) }
    let(:found_table) { double(:capybara_element) }

    class ExampleRowWrapper < TableRow
    end

    context "get" do
      before do
        allow(finder).to receive(:find_xyz).with("table-locator") { found_table }
      end

      let(:table) { finder.get }

      it "returns the table" do
        expect(table.table).to eq(found_table)
      end

      it "assigns the wrapper" do
        expect(table.row_wrapper).to eq(ExampleRowWrapper)
      end
    end

  end
end
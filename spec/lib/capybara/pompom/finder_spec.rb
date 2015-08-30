require "spec_helper"

module Capybara::PomPom
  describe Finder do

    after do
      FinderExample.finders = {}
    end

    class FinderExample
      include Finder
    end

    context "finders" do
      it "assigns a default hash" do
        expect(FinderExample.finders).to eq({})
      end
    end

    context "finders" do
      let(:element) { double }
      let(:finder) { FinderExample.new }

      before do
        class FinderExample
          link :example_link, "click here"
          field :example_field, "field-name"
          button :example_button, "button-text"
        end
      end

      it "creates a finder for a link" do
        allow_any_instance_of(ElementFinder).to receive(:find_link).with("click here") { element }
        expect(finder.example_link).to eq(element)
      end

      it "creates a finder for a field" do
        allow_any_instance_of(ElementFinder).to receive(:find_field).with("field-name") { element }
        expect(finder.example_field).to eq(element)
      end

      it "creates a finder for a button" do
        allow_any_instance_of(ElementFinder).to receive(:find_button).with("button-text") { element }
        expect(finder.example_button).to eq(element)
      end
    end

    context "method_missing" do
      before do
        FinderExample.finders = {
          example_finder: double(:element_finder, get: :foobar)
        }
      end

      it "delegates to the finders hash" do
        finder = FinderExample.new
        expect(finder.example_finder).to eq(:foobar)
      end

      it "throws error if hash doesn't exist" do
        finder = FinderExample.new
        expect { finder.foobar }.to raise_error(NoMethodError)
      end
    end
  end
end

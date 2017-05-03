require "spec_helper"

module Capybara::PomPom
  describe ElementFinder do

    let(:finder) { ElementFinder.new(:find_xyz, "dom-locator") }

    before do
      stub_const('ExampleWrapper', Struct.new(:element))
    end

    it "includes Capybara::DSL" do
      expect(finder).to respond_to(:find_link)
    end

    context "get" do
      let(:found_element) { double(:capybara_element) }

      it "calls capybara's finders with a locator" do
        expect(finder).to receive(:find_xyz).with('dom-locator')
        finder.get
      end

      it "returns the element" do
        allow(finder).to receive(:find_xyz) { found_element }
        expect(finder.get).to eq(found_element)
      end

      it "finds within a scope" do
        element_scope = double(:element_scope)
        expect(element_scope).to receive(:find_xyz).with("dom-locator")
        finder.get(element_scope)
      end

      it "wraps the element" do
        finder = ElementFinder.new(:find_with_class, "dom-locator", wrapper: ExampleWrapper)
        allow(finder).to receive(:find_with_class) { found_element }

        expect(finder.get).to be_instance_of(ExampleWrapper)
      end

      it "wraps multiple elements" do
        e1, e2, e3 = [double(:element_1), double(:element_2), double(:element_3)]

        query = double(:query)
        allow(query).to receive(:matches_filters?) { true }
        result = Capybara::Result.new([e1, e2, e3], query)
        finder = ElementFinder.new(:find_multiple, "multiple-locator", wrapper: ExampleWrapper)

        allow(finder).to receive(:find_multiple) { result }
        expect(finder.get).to eq([
          ExampleWrapper.new(e1),
          ExampleWrapper.new(e2),
          ExampleWrapper.new(e3)
        ])
      end
    end

  end
end

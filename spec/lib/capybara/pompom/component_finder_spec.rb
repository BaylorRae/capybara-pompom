require "spec_helper"

module Capybara::PomPom
  describe ComponentFinder do

    let(:finder) { ComponentFinder.new(:find_xyz, "component-locator") }
    let(:found_component) { double(:capybara_element) }

    context "get" do
      before do
        allow(finder).to receive(:find_xyz).with("component-locator") { found_component }
      end

      let(:component) { finder.get }

      it "returns the component" do
        expect(component.component).to eq(found_component)
      end
    end

  end
end

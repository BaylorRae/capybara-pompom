require "spec_helper"

module Capybara::PomPom
  describe Page do

    before do
      stub_const('ExamplePage', Page)
    end

    it "includes Capybara::DSL" do
      expect(subject).to respond_to(:page)
    end

    context "self.method_missing" do
      it "calls instance methods as class methods" do
        expect_any_instance_of(ExamplePage).to receive(:example).with('called', 'at class level')
        ExamplePage.example('called', 'at class level')
      end

      it "returns the result of the method" do
        result = double(:method_result)
        allow_any_instance_of(ExamplePage).to receive(:example) { result }
        expect(ExamplePage.example).to be(result)
      end

      it "throws exception if method doesn't exist" do
        expect do
          ExamplePage.fake_method(1, 2, 3)
        end.to raise_error(NoMethodError)
      end
    end

  end
end

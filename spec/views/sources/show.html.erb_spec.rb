require 'spec_helper'

describe "sources/show.html.erb" do
  before(:each) do
    @source = assign(:source, stub_model(Source,
      :info => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end

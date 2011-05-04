require 'spec_helper'

describe "tags/index.html.erb" do
  before(:each) do
    assign(:tags, [
      stub_model(Tag,
        :word => "Word"
      ),
      stub_model(Tag,
        :word => "Word"
      )
    ])
  end

  it "renders a list of tags" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Word".to_s, :count => 2
  end
end
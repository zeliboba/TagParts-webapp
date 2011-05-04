require 'spec_helper'

describe "sources/edit.html.erb" do
  before(:each) do
    @source = assign(:source, stub_model(Source,
      :info => "MyText"
    ))
  end

  it "renders the edit source form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sources_path(@source), :method => "post" do
      assert_select "textarea#source_info", :name => "source[info]"
    end
  end
end

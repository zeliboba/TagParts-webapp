require 'spec_helper'

describe "sources/new.html.erb" do
  before(:each) do
    assign(:source, stub_model(Source,
      :info => "MyText"
    ).as_new_record)
  end

  it "renders new source form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sources_path, :method => "post" do
      assert_select "textarea#source_info", :name => "source[info]"
    end
  end
end

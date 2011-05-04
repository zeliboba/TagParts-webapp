require 'spec_helper'

describe "parts/edit.html.erb" do
  before(:each) do
    @part = assign(:part, stub_model(Part,
      :content => "MyText",
      :source_id => 1
    ))
  end

  it "renders the edit part form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => parts_path(@part), :method => "post" do
      assert_select "textarea#part_content", :name => "part[content]"
      assert_select "input#part_source_id", :name => "part[source_id]"
    end
  end
end

require "spec_helper"

describe PartsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/parts" }.should route_to(:controller => "parts", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/parts/new" }.should route_to(:controller => "parts", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/parts/1" }.should route_to(:controller => "parts", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/parts/1/edit" }.should route_to(:controller => "parts", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/parts" }.should route_to(:controller => "parts", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/parts/1" }.should route_to(:controller => "parts", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/parts/1" }.should route_to(:controller => "parts", :action => "destroy", :id => "1")
    end

  end
end

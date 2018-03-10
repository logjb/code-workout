require "rails_helper"

RSpec.describe CwToolsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/cw_tools").to route_to("cw_tools#index")
    end

    it "routes to #new" do
      expect(:get => "/cw_tools/new").to route_to("cw_tools#new")
    end

    it "routes to #show" do
      expect(:get => "/cw_tools/1").to route_to("cw_tools#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/cw_tools/1/edit").to route_to("cw_tools#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/cw_tools").to route_to("cw_tools#create")
    end

    it "routes to #update" do
      expect(:put => "/cw_tools/1").to route_to("cw_tools#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/cw_tools/1").to route_to("cw_tools#destroy", :id => "1")
    end

  end
end

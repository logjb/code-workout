require "rails_helper"

RSpec.describe GuiToolsController, :type => :routing do
  describe "routing" do
    
    it "routes to #exercise_content" do
      expect(:get => "/gui_tools/exercise_content").to route_to("gui_tools#exercise_content")
    end
        
    it "routes to #exercises" do
      expect(:get => "/gui_tools/exercises").to route_to("gui_tools#exercises")
    end

    it "routes to #index" do
      expect(:get => "/gui_tools").to route_to("gui_tools#index")
    end

    it "routes to #new" do
      expect(:get => "/gui_tools/new").to route_to("gui_tools#new")
    end

    it "routes to #show" do
      expect(:get => "/gui_tools/1").to route_to("gui_tools#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/gui_tools/1/edit").to route_to("gui_tools#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/gui_tools").to route_to("gui_tools#create")
    end

    it "routes to #update" do
      expect(:put => "/gui_tools/1").to route_to("gui_tools#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/gui_tools/1").to route_to("gui_tools#destroy", :id => "1")
    end

  end
end

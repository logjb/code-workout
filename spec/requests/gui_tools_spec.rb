require 'rails_helper'

RSpec.describe "GuiTools", :type => :request do
  describe "GET /gui_tools" do
    it "works! (now write some real specs)" do
      get gui_tools_path
      expect(response).to have_http_status(200)
    end
  end
end

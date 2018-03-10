require 'rails_helper'

RSpec.describe "CwTools", :type => :request do
  describe "GET /cw_tools" do
    it "works! (now write some real specs)" do
      get cw_tools_path
      expect(response).to have_http_status(200)
    end
  end
end

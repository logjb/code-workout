require 'rails_helper'

RSpec.describe "cw_tools/new", :type => :view do
  before(:each) do
    assign(:cw_tool, CwTool.new())
  end

  it "renders new cw_tool form" do
    render

    assert_select "form[action=?][method=?]", cw_tools_path, "post" do
    end
  end
end

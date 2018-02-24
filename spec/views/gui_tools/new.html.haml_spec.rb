require 'rails_helper'

RSpec.describe "gui_tools/new", :type => :view do
  before(:each) do
    assign(:gui_tool, GuiTool.new())
  end

  it "renders new gui_tool form" do
    render

    assert_select "form[action=?][method=?]", gui_tools_path, "post" do
    end
  end
end

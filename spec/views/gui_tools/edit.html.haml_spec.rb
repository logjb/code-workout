require 'rails_helper'

RSpec.describe "gui_tools/edit", :type => :view do
  before(:each) do
    @gui_tool = assign(:gui_tool, GuiTool.create!())
  end

  it "renders the edit gui_tool form" do
    render

    assert_select "form[action=?][method=?]", gui_tool_path(@gui_tool), "post" do
    end
  end
end

require 'rails_helper'

RSpec.describe "gui_tools/show", :type => :view do
  before(:each) do
    @gui_tool = assign(:gui_tool, GuiTool.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end

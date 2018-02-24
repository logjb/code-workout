require 'rails_helper'

RSpec.describe "gui_tools/index", :type => :view do
  before(:each) do
    assign(:gui_tools, [
      GuiTool.create!(),
      GuiTool.create!()
    ])
  end

  it "renders a list of gui_tools" do
    render
  end
end

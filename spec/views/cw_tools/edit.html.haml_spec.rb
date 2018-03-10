require 'rails_helper'

RSpec.describe "cw_tools/edit", :type => :view do
  before(:each) do
    @cw_tool = assign(:cw_tool, CwTool.create!())
  end

  it "renders the edit cw_tool form" do
    render

    assert_select "form[action=?][method=?]", cw_tool_path(@cw_tool), "post" do
    end
  end
end

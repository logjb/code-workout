require 'rails_helper'

RSpec.describe "cw_tools/show", :type => :view do
  before(:each) do
    @cw_tool = assign(:cw_tool, CwTool.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end

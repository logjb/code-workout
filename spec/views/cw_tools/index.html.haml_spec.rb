require 'rails_helper'

RSpec.describe "cw_tools/index", :type => :view do
  before(:each) do
    assign(:cw_tools, [
      CwTool.create!(),
      CwTool.create!()
    ])
  end

  it "renders a list of cw_tools" do
    render
  end
end

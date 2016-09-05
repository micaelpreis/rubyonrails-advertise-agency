require 'rails_helper'

RSpec.describe "campaigns/index", type: :view do
  before(:each) do
    assign(:campaigns, [
      Campaign.create!(),
      Campaign.create!()
    ])
  end

  it "renders a list of campaigns" do
    render
  end
end

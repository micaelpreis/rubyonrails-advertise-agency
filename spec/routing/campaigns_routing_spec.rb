require "rails_helper"

RSpec.describe CampaignsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/campaigns").to route_to("campaigns#index")
    end

    it "routes to #show" do
      expect(:get => "/campaigns/1").to route_to("campaigns#show", :id => "1")
    end
  end
end

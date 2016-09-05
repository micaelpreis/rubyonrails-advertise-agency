require 'rails_helper'

RSpec.describe CampaignsController, type: :controller do

  let(:campaign_attributes) {
    {
      id: "1"
    }
  }

  describe "GET #index" do
    it "assigns all campaigns as @campaigns" do
      campaign = Campaign.create! campaign_attributes
      get :index
      expect(assigns(:campaigns)).to eq([campaign])
    end

    it "renders the view" do
      campaign = Campaign.create! campaign_attributes
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested campaign as @campaign" do
      campaign = Campaign.create! campaign_attributes
      get :show, id: campaign.id
      expect(assigns(:campaign)).to eq(campaign)
    end

    it "renders the view" do
      campaign = Campaign.create! campaign_attributes
      get :show, id: campaign.id
      response.should render_template :show
    end
  end
end

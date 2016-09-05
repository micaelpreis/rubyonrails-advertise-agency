require 'rails_helper'

RSpec.describe GeneralController, type: :controller do

	let(:impressions_path) {
		Rails.root.join('app', 'assets', 'csv', 'impressions.csv')
	}
	let(:clicks_path) {
		Rails.root.join('app', 'assets', 'csv', 'clicks.csv')
	}
	let(:conversions_path) {
		Rails.root.join('app', 'assets', 'csv', 'conversions.csv')
	}

	let(:campaign_attributes) {
    {
      id: "1"
    }
  }

  let(:banner_attributes) {
    {
      id: "1"
    }
  }

  let(:click_attributes) {
    {
      id: "1",
      banner_id: "1",
      campaign_id: "1"
    }
  }

  let(:conversion_attributes) {
    {
      id: "1",
      click_id: "1",
      revenue: "1.45"
    }
  }

  describe "GET #index" do
    it "renders the view" do
      get :index
      response.should render_template :index
    end
  end

  describe "POST #import_data" do
    it "import data from CSV files" do
      expect(Campaign.count).to eq 0
      expect(Banner.count).to eq 0
      expect(Click.count).to eq 0
      expect(Conversion.count).to eq 0
      Campaign.import(impressions_path)
      Click.import(clicks_path)
      Conversion.import(conversions_path)
      expect(Campaign.count).to eq 5
      expect(Banner.count).to eq 38
      expect(Click.count).to eq 39
      expect(Conversion.count).to eq 28
    end

    it "redirects to the root" do
      post :import_data
      expect(response).to redirect_to(root_url)
    end
  end

  describe "DELETE #clean_data" do
    it "clean data from the database" do
			Campaign.create! campaign_attributes
  		Banner.create! banner_attributes
  		Click.create! click_attributes
  		Conversion.create! conversion_attributes

      delete :clean_data

     	expect(Campaign.count).to eq 0
     	expect(Banner.count).to eq 0
     	expect(Click.count).to eq 0
     	expect(Conversion.count).to eq 0
   	end

   	it "redirects to the root" do
     	delete :clean_data
     	expect(response).to redirect_to(root_url)
   	end
  end
end

require 'rails_helper'

RSpec.describe "campaigns/show", type: :view do

	let(:impressions_path) {
    Rails.root.join('app', 'assets', 'csv', 'impressions.csv')
  }
  let(:clicks_path) {
    Rails.root.join('app', 'assets', 'csv', 'clicks.csv')
  }
  let(:conversions_path) {
    Rails.root.join('app', 'assets', 'csv', 'conversions.csv')
  }

	before(:each) do
    Campaign.import(impressions_path)
    Click.import(clicks_path)
    Conversion.import(conversions_path)
  end

  it "campaign 1 - banners should be different and should match the expected outcome" do
    banners = Set.new
    outcome = ["1","2","3","4","5","6","7","8","9","10"]
    10.times do
    	visit campaign_path(1)
    	banner = page.find_by_id("banner")
      expect(banners).to_not include(banner)
      expect(outcome).to include(banner.native.text)
      banners << banner
    end
  end

  it "campaign 2 - banners should be different and should match the expeted outcome" do
    banners = Set.new
    outcome = ["13","14","15","16","17","18","19","20"]
    8.times do
    	visit campaign_path(2)
    	banner = page.find_by_id("banner")
      expect(banners).to_not include(banner)
      expect(outcome).to include(banner.native.text)
      banners << banner
    end
  end

  it "campaign 3 - banners should be different and should match the expeted outcome" do
    banners = Set.new
    outcome = ["21","22","23","24","25"]
    5.times do
    	visit campaign_path(3)
    	banner = page.find_by_id("banner")
      expect(banners).to_not include(banner)
      expect(outcome).to include(banner.native.text)
      banners << banner
    end
  end

  it "campaign 4 - banners should be different and shoud match the expected outcome" do
    banners = Set.new
    outcome = ["26","27","28","29","30"]
    5.times do
    	visit campaign_path(4)
    	banner = page.find_by_id("banner")
      expect(banners).to_not include(banner)
      expect(outcome).to include(banner.native.text)
      banners << banner
    end
  end

  it "campaign 5 - banners should be different and shoud match the expected outcome" do
    banners = Set.new
    outcome = ["32","33","34","35","36","37","38"]
    5.times do
    	visit campaign_path(5)
    	banner = page.find_by_id("banner")
      expect(banners).to_not include(banner)
      expect(outcome).to include(banner.native.text)
      banners << banner
    end
  end
end

class AddCampaignToClicks < ActiveRecord::Migration
  def change
    add_reference :clicks, :campaign, index: true, foreign_key: true
  end
end

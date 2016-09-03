class CreateJoinTableCampaignBanner < ActiveRecord::Migration
  def change
  	create_join_table :campaigns, :banners do |t|
      t.index [:campaign_id, :banner_id]
      t.index [:banner_id, :campaign_id]
    end

    remove_reference(:banners, :campaign, index: true)
  end
end

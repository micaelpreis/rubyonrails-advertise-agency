# == Schema Information
#
# Table name: campaigns
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Campaign < ActiveRecord::Base
	require 'csv'

	has_and_belongs_to_many :banners

	# Import Campaign and Banner Data
	def self.import(file)
		begin
      ActiveRecord::Base.transaction do
				CSV.foreach(file, headers: true) do |row|
					@campaign = Campaign.find_or_create_by(id: row['campaign_id'])
					@campaign.save!

					@banner = Banner.find_or_create_by(id: row['banner_id'])
					@banner.campaigns << @campaign
					@banner.save!
				end
			end
		rescue ActiveRecord::ActiveRecordError => e
      respond_to do |format|
        format.html { redirect_to root_path, alert: 'Could not load impressions data!' }
      end
  	end
	end
end

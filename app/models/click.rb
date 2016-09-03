# == Schema Information
#
# Table name: clicks
#
#  id          :integer          not null, primary key
#  banner_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  campaign_id :integer
#

class Click < ActiveRecord::Base
  belongs_to :banner
  has_one :conversion

	# Import Clicks Data
	def self.import(file)
		begin
      ActiveRecord::Base.transaction do
				CSV.foreach(file, headers: true) do |row|
					@click = Click.create(id: row['click_id'], banner_id: row['banner_id'], campaign_id: row['campaign_id'])
					@click.save!
				end
			end
		rescue ActiveRecord::ActiveRecordError => e
      respond_to do |format|
        format.html { redirect_to root_path, alert: 'Could not load clicks data!' }
      end
  	end
	end
end

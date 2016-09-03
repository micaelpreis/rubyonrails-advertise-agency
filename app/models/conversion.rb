# == Schema Information
#
# Table name: conversions
#
#  id         :integer          not null, primary key
#  click_id   :integer
#  revenue    :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Conversion < ActiveRecord::Base
  belongs_to :click

  # Import Conversions Data
	def self.import(file)
		begin
      ActiveRecord::Base.transaction do
				CSV.foreach(file, headers: true) do |row|
					@conversion = Conversion.create(id: row['conversion_id'], click_id: row['click_id'], revenue: row['revenue'])
					@conversion.save!
				end
			end
		rescue ActiveRecord::ActiveRecordError => e
      respond_to do |format|
        format.html { redirect_to root_path, alert: 'Could not load conversions data!' }
      end
  	end
	end
end

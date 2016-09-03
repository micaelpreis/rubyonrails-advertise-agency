# == Schema Information
#
# Table name: banners
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Banner < ActiveRecord::Base
  has_and_belongs_to_many :campaigns
  has_many :clicks
end

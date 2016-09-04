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
  has_many :conversions, through: :clicks

  # Get banners with clicks
  scope :with_clicks, -> {joins(:clicks).where.not(clicks: {id: nil})}

  # Get banners with conversions
  scope :with_conversions, -> {joins(:conversions).where.not(conversions: {id: nil})}

  # Get top banners
  scope :top_banners, -> {joins(:conversions).group("banners.id").order("SUM(revenue) DESC").limit(10)}
end

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

require 'test_helper'

class ClickTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

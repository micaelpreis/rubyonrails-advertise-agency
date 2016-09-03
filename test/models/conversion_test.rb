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

require 'test_helper'

class ConversionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

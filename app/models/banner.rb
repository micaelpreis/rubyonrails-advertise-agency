class Banner < ActiveRecord::Base
  belongs_to :campaign
  has_many :clicks

end

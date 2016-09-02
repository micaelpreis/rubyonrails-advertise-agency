class Click < ActiveRecord::Base
  belongs_to :banner
  has_one :conversion
end

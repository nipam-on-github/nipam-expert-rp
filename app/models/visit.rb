class Visit < ApplicationRecord
  belongs_to :visitor

  has_many :facility_useds
end

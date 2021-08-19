class Day < ApplicationRecord
  belongs_to :track

  validates_presence_of :blood_pressure
  validates_presence_of :blood_sugar
end

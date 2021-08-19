class Track < ApplicationRecord
  has_many :days, dependent: :destroy

  validates_presence_of :title, :patient
end

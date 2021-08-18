class Tracker < ApplicationRecord
    has_many :items, dependent: :destroy

    validates_presence_of :title, :patient
end

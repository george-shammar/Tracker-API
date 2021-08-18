require 'rails_helper'

RSpec.describe Tracker, type: :model do
  # Association test
  # ensure Tracker model has a 1:m relationship with the Item model
  it { should have_many(:items).dependent(:destroy) }
  # Validation tests
  # ensure columns title and patient are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:patient) }
end

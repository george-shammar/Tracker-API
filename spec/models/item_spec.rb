require 'rails_helper'

RSpec.describe Item, type: :model do
  # Association test
  # ensure an item record belongs to a single todo record
  it { should belong_to(:tracker) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:blood_pressure) }
  it { should validate_presence_of(:blood_sugar) }
end

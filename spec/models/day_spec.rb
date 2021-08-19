require 'rails_helper'

RSpec.describe Day, type: :model do
  it { should belong_to(:tracker) }
  
  it { should validate_presence_of(:blood_pressure) }
  it { should validate_presence_of(:blood_sugar) }
end

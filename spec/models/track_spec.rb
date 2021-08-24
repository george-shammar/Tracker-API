require 'rails_helper'

RSpec.describe Track, type: :model do
  it { should have_many(:days).dependent(:destroy) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:patient) }
end

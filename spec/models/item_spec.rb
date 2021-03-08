require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'Validate association' do
    it { is_expected.to belong_to(:order) }
  end

  describe 'Validate attributes' do
    it { is_expected.to validate_presence_of(:external_code) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_presence_of(:total) }
  end
end

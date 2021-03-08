require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe 'Validate association' do
    it { is_expected.to belong_to(:order) }
  end

  describe 'Validate attributes' do
    it { is_expected.to validate_presence_of(:payment_type) }
    it { is_expected.to validate_presence_of(:value) }
  end
end

require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'Validate association' do
    it { is_expected.to belong_to(:order) }
  end

  describe 'Validate attributes' do
    it { is_expected.to validate_presence_of(:external_code) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:area_code) }
    it { is_expected.to validate_presence_of(:number) }
  end

end

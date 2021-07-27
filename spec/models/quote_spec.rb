require 'rails_helper'

RSpec.describe Quote, type: :model do
  describe 'Relationships' do
    it { should belong_to :card }
  end

  describe 'Validations' do
    it { should validate_presence_of :quote }
    it { should validate_presence_of :author }
  end
end

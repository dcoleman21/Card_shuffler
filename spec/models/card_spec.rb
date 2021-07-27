require 'rails_helper'

RSpec.describe Card, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :description }
    it { should validate_presence_of :image }
    it { should validate_presence_of :source }
    it { should validate_presence_of :quote }
    it { should validate_presence_of :author }
  end

  # describe 'Relationships' do
  #
  # end
end

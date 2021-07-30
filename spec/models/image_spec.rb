require 'rails_helper'

RSpec.describe Image, type: :model do
  describe 'Relationships' do
    it { should have_many :cards }
  end

  describe 'Validations' do
    it { should validate_presence_of :description }
    it { should validate_presence_of :image }
    it { should validate_presence_of :source }
  end
end

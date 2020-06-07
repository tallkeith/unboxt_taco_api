require 'rails_helper'
require 'pry'

RSpec.describe Taco, :type => :model do

  let(:subject) { FactoryBot.create(:taco) }
  let(:no_meat_taco) { FactoryBot.build(:taco, meat: nil) }
  let(:unknown_meat) { FactoryBot.build(:taco, meat: 'invalid meat') }
  let(:no_side) { FactoryBot.create(:taco, rice: false, salsa: false) }
  let(:no_note) { FactoryBot.create(:taco, :no_note) }

  describe 'sanity check' do
    it 'creates a valid object' do
      expect(subject).to be_valid
    end
  end

  describe 'meat validations' do
    context 'valid when' do
      it 'has a meat' do
        expect(subject.meat).to eq('Steak')
        expect(subject.meat).to_not eq('Chicken')
      end
    end

    context 'invalid when' do
      it 'meat is missing' do
        expect(no_meat_taco).to be_invalid
      end
      it 'unknown meat option' do
        expect(unknown_meat).to be_invalid
      end
    end
  end

  describe 'sides' do
    it 'are optional' do
      expect(no_side).to be_valid
    end
  end

  describe 'notes' do
    it 'are optional' do
      expect(no_note).to be_valid
    end
  end
end

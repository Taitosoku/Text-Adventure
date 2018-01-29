# These tests are for character specific methods
require_relative '../../lib/character'
require 'pry'

describe 'Character' do
  let(:character) {Character.new}
  context 'chooses open inventory' do

    it 'raises NotValidOption error' do
      invalid_options = [7, 12, 0].each { |option|
        expect(character.open_inventory option).to raise_error Character::NotValidOption
      }
    end

    it 'riases a NotNumeric error' do
      invalid_options = ["7", "feather".to_sym].each { |option|
        expect(character.open_inventory option).to raise_error TypeError
      }
    end
  end
end

# These tests are for character specific methods
require_relative 'spec_helper' # necessary ruby gems

require 'character' # lib we are testing

describe 'Character Class' do
  let(:character) {Character.new}
  context 'User chooses from the open inventory menu' do
    context 'with numeric but invalid input' do
      it 'raises NotValidOption error' do
        invalid_options = [7, 12, 0].each { |option|
          expect do
            character.open_inventory option
          end.to raise_error Character::NotValidOption
        }
      end
    end

    context 'with non-numeric input'
    it 'raises a NotNumeric error' do
      invalid_options = ["7", "feather".to_sym].each { |option|
        expect do
          character.open_inventory option
        end.to raise_error TypeError
      }
    end
  end

  context 'with valid numeric input' do
    it 'does not throw an error' do
      valid_options = [1,2,3].each { |option|
        expect do
          character.open_inventory option
        end.not_to raise_error
      }
    end
  end
end

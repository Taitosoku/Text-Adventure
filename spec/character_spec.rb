require_relative './spec_helper'
require_relative '../lib/character'

describe 'Character' do
  let(:character) { Character.new }
  describe 'display inventory function' do
    context 'with invalid input' do
      it 'raises TypeError when given non numeric input' do
        input = 'poop'
        expect{ character.open_inventory(input) }.to raise_error TypeError
      end

      it 'raises NotValidOption when given invalid numeric input' do
        input = 23
        expect { character.open_inventory(input) }.to raise_error Character::NotValidOption
      end
    end
  end

  describe 'add item to inventory function' do
    context 'when inventory is empty' do
    end

    context 'when inventory includes at least 1 item' do
    end

    context 'when invenory is full' do
    end
  end
end

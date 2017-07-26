# This is an directory of unit tests for the Text Adventure Project
require '../spec_helper'
require '../../shared'

describe 'attack', :type => :feature do
  it 'returns an integer' do
    # expect method to return a dmg value as integer
    expect(attack(1,'theif',1)).to be_an(Integer)
  end

  it 'misses' do
    # outputs message to console
    # nothing is being returned so expect return nil?
    expect(attack(100,'theif',1)).to be_nil
  end

  it 'does not take invalid args' do
    # create array of valid output to compare againsts asserts
    # assert character_type
    # assert level
    # assert AC
  end
end

describe 'investigate', :type => :feature do
  it 'always returns a string' do

  end
end

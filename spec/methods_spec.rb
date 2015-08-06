require_relative 'spec_helper'

describe 'methods(Chess)' do
  before :each do 
    @test = Chess.new
  end 
  describe '#valid_input?' do 
    it 'Does not take only integers' do 
      input = 3212
      @expect(@test.valid_input(input)).to be false
    end
    it 'Does not take only letters' do 
      input = aa
      @expect(@test.valid_input(input)).to be false
    end
    it 'Does not accept letters outside of a-h' do
      input = z2
      @expect(@test.valid_input(input)).to be false
    end
    it 'Does not accept numbers greater than 8' do 
      input = e10
      @expect(@test.valid_input(input)).to be false
    end
    it 'Does not accept numbers less than 1' do 
      input = b0
      @expect(@test.valid_input(input)).to be false
    end
    it 'Works for numbers inside the board' do 
      input = a5
      @expect(@test.valid_input(input)).to be true
    end
    it 'Works for numbers inside the board' do
      input = g3 
      @expect(@test.valid_input(input)).to be true
    end
    it 'Works for numbers inside the board' do 
      input = h8
      @expect(@test.valid_input(input)).to be true
    end

  end
end
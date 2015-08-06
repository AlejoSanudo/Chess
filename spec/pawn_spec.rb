require_relative 'spec_helper'

describe Pawn do
	before :each do
		@pawn = Pawn.new('white')
		@pawn_b = Pawn.new('black')
end

	describe "#new" do
		it "creates an instance of pawn with a color" do
			expect(@pawn).to be_an_instance_of Pawn
		end
	end

	describe "#color" do
		it "return the correct color" do
			expect(@pawn.color).to eq('white')
		end
	end

	describe "#valid_movement?" do

		it "returns true if at first tour it moves 2 and no piece is found in 1st or 2nd case" do
			board = [
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', @pawn, ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', @pawn_b, ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
			]			
			allow(@pawn).to receive(:first_tour).and_return(true)
			expect(@pawn.valid_movement?(board, 1, 2, 3, 2)).to be true

			allow(@pawn_b).to receive(:first_tour).and_return(true)
			expect(@pawn_b.valid_movement?(board, 6, 5, 4, 5)).to be true
		end

		it "returns false if tries to move 2 forward and the first tour is passed" do
			board = [
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', @pawn, ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', @pawn_b, ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
			]
			@pawn.valid_movement?(board, 1, 2, 3, 2)
			expect(@pawn.first_tour).to be false

			@pawn_b.valid_movement?(board, 6, 5, 4, 5)
			expect(@pawn_b.first_tour).to be false			
		end

		it "returns true if move 1 forward and no piece is found" do
			board = [
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', @pawn, ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', @pawn_b, ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
			]
			allow(@pawn).to receive(:first_tour).and_return(true)			
			expect( @pawn.valid_movement?(board, 1, 2, 2, 2) ).to be true	

			allow(@pawn_b).to receive(:first_tour).and_return(true)
			expect(@pawn_b.valid_movement?(board, 6, 5, 5, 5)).to be true
		end

		it "returns true if move 1 forward diagonally and a piece (enemy) is found" do
			# binding.pry
			pawn2_b = Pawn.new('black')
			pawn2_w = Pawn.new('white')
			board = [
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', @pawn, ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', pawn2_b , ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', pawn2_w, ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', @pawn_b, ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
			]				
			allow(@pawn).to receive(:first_tour).and_return(true)			
			expect( @pawn.valid_movement?(board, 1, 2, 2, 3) ).to be true

			allow(@pawn_b).to receive(:first_tour).and_return(true)
			expect(@pawn_b.valid_movement?(board, 6, 5, 5, 4)).to be true
		end

		it "returns false if move 2 forward and a piece is 1st case" do
			# binding.pry
			pawn2_b = Pawn.new('black')
			pawn2_w = Pawn.new('white')
			board = [
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', @pawn, ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', pawn2_b	, ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', pawn2_w, ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', @pawn_b, ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
			]
		
			expect( @pawn.valid_movement?(board, 1, 2, 3, 2) ).to be false
			expect( @pawn_b.valid_movement?(board, 6, 5, 4, 5) ).to be false
		end

		it "returns false if move 2 forward and a piece is 2nd case" do
			pawn2_b = Pawn.new('black')
			pawn2_w = Pawn.new('white')
			board = [
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', @pawn, ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', pawn2_b	, ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', pawn2_w, ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', @pawn_b, ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
			]

			expect( @pawn.valid_movement?(board, 1, 2, 3, 2) ).to be false
			expect( @pawn_b.valid_movement?(board, 6, 5, 4, 5) ).to be false
		end

		it "returns false if tries to move of 1 with a piece in the first case" do
			pawn2_b = Pawn.new('black')
			pawn2_w = Pawn.new('white')
			board = [
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', @pawn, ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', pawn2_b	, ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', pawn2_w, ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', @pawn_b, ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
			]

			expect( @pawn.valid_movement?(board, 1, 2, 2, 2) ).to be false
			expect( @pawn_b.valid_movement?(board, 6, 5, 5, 5) ).to be false
		end

		it "returns false if move of 1 diagonal with a piece of same team" do
			pawn2_b = Pawn.new('black')
			pawn2_w = Pawn.new('white')
			board = [
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', @pawn, ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', pawn2_w, ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', pawn2_b, ' '],
				[' ', ' ', ' ', ' ', ' ', @pawn_b, ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
			]

			expect( @pawn.valid_movement?(board, 1, 2, 2, 3) ).to be false
			expect( @pawn_b.valid_movement?(board, 6, 5, 5, 4) ).to be false
		end

		describe "other invalid movements" do

			board = [
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', @pawn, ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', @pawn_b, ' ', ' '],
				[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
			]

			it "returns false for lateral move of 1 or more cases" do
				expect( @pawn.valid_movement?(board, 1, 2, 1, 3) ).to be false
				expect( @pawn_b.valid_movement?(board, 6, 5, 6, 3) ).to be false
			end

			it "returns false for backward move of 1 or more cases" do
				expect( @pawn.valid_movement?(board, 1, 2, 0, 2) ).to be false			
				expect( @pawn_b.valid_movement?(board, 6, 5, 7, 5) ).to be false			
			end

			it "return false for no move" do
				expect( @pawn.valid_movement?(board, 1, 2, 1, 2) ).to be false
				expect( @pawn_b.valid_movement?(board, 6, 5, 6, 5) ).to be false
			end
		end
	end
end




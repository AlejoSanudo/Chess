require_relative 'spec/spec_helper'

#\u
class Pawn < Piece
  attr_accessor :icon 
  attr_reader :first_tour

  def initialize(color)
    super(color)
    @first_tour = true
    @icon = color == 'black' ? "\u2659" : "\u265F"
  end

  def valid_movement?(board, beg_row, beg_col, end_row, end_col)
    # check the color and standardize by multiplicating by 1 or -1 depending on poisiton of the team, top or bottom, 
    # relative the the X and Y axis of the board 
    diff_row = ( end_row - beg_row ) #* (@color == 'white' ? -1 : 1)
    diff_col = ( end_col - beg_col ) #* (@color == 'white' ? -1 : 1)

    # puts "diff row" + diff_row.to_s
    # puts "diff col" + diff_col.to_s
    # first round for this pawn - move forward 2 or 1
    #binding.pry
    if first_tour
      # forward
      if diff_col == 0
        # forward 1
        if diff_row == 1
          return !(board[end_row][end_col].is_a? Piece || )
        # forward 2
        elsif diff_row == 2
          return !(board[end_row][end_col].is_a? Piece || )
        end
      # diagonal 1
      elsif diff_col == 1 && diff_row == 1
        return board[end_row][end_col].is_a? Piece
      elsif diff_row == 2 && diff_col == 2
        puts "i am in the right if statement!!!!!"
        return board[end_row][end_col].is_a? Piece
      # other options are non-athorized movements
      else
        return false
      end
      @first_tour = false
    # round other than first - move forward 1
    else
      # forward
      if diff_row == 1 && diff_col == 0
        return !( board[end_row][end_col].is_a? Piece )
      # diagonal
      elsif diff_row == 1 && ( diff_col == 1 || diff_col == -1 )
        return board[end_row][end_col].is_a? Piece
      # other options are non-athorized movements
      else
        return false
      end
    end
  end
end

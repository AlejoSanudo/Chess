require './Piece'
require './methods'
require './Board'
require 'pry'
require './spec/spec_helper'

#pseudoCode
#test validity of A
#1) valid input? if so..
#2) get row and get col
#3) valid piece? if so..
#4) get the piece.
#5) use piece to check B
#6)valid input? if so...
#7) get row and get col
#8 
#9) check valid_movement?(board,beg_row,beg_col,end_row,end_col)
#  --valid movement is a boolean... valid_movement?(board, beg_row,beg_col,end_row,end_col)
#10) check if B is your piece. if not..
#11)board[B] = board[A]
#12) board[A] = " "
#Main

@current_color = 'black'
game = Board.new('')
while true
  game_board = game.board
  puts game.display
  puts "#{@current_color.capitalize}, which piece would you like to move?"
  user_input = gets.chomp.strip.downcase
  puts game_board[get_row(user_input)][get_col(user_input)]

  while !(valid_input?(user_input) && valid_piece?(get_row(user_input), get_col(user_input), game_board, @current_color))
    puts "Invalid Command. Please select your own piece"
    user_input = gets.chomp.strip.downcase
    puts game_board[get_row(user_input)][get_col(user_input)]
  end 

  beg_row = get_row(user_input)
  beg_col = get_col(user_input)
  piece = game_board[beg_row][beg_col]
  puts "Move piece to where?"
  user_input2 = gets.chomp.strip.downcase

  ##
  ## This while loop checks to see if the selected piece can go to the destination. Ready to implement the valid_movement? method in each class
  ## still have to check if it's the same space
  ##
  while !(valid_input?(user_input2) && piece.valid_movement?(game_board, beg_row, beg_col, get_row(user_input2), get_col(user_input2))) 
    puts "Invalid Command. Please select a valid square"
    user_input2 = gets.chomp.strip.downcase
  end 

  end_row = get_row(user_input2)
  end_col = get_col(user_input2)
  game.board[end_row][end_col] = piece 
  game.board[beg_row][beg_col] = " "
  @current_color = @current_color == 'white' ? 'black' : 'white'
end

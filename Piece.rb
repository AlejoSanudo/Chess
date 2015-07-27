class Piece
  attr_accessor :color

  def initialize(color)
    @color = color
  end
end

# ###############
# #### TESTS ####
# ###############

# pawn = Pawn.new('white')
# rook = Rook.new('white')
# bishop = Bishop.new('white')
# knight = Knight.new('white')
# queen = Queen.new('white')
# king = King.new('white')

# puts "***************************************************"
# #### Superclass
# puts "superclass of Pawn should be Piece ----> #{pawn.is_a? Piece}"
# puts "superclass of Rook should be Piece ----> #{rook.is_a? Piece}"
# puts "superclass of Bishop should be Piece ----> #{bishop.is_a? Piece}"
# puts "superclass of Knight should be Piece ----> #{knight.is_a? Piece}"
# puts "superclass of Queen should be Piece ----> #{queen.is_a? Piece}"
# puts "superclass of King should be Piece ----> #{king.is_a? Piece}"

# puts "***************************************************"
# #### Color
# puts "color of Pawn should be white ----> " + (pawn.color == 'white').to_s
# puts "color of Rook should be white ----> " + (rook.color == 'white').to_s
# puts "color of Bishop should be white ----> " + (bishop.color == 'white').to_s
# puts "color of Knight should be white ----> " + (knight.color == 'white').to_s
# puts "color of Queen should be white ----> " + (queen.color == 'white').to_s
# puts "color of King should be white ----> " + (king.color == 'white').to_s

# puts "***************************************************"
# #### Icon
# puts "icon of white Pawn should be u2659 ----> " + (pawn.icon == "\u2659").to_s
# puts "icon of white Rook should be u2656 ----> " + (rook.icon == "\u2656").to_s
# puts "icon of white Bishop should be u2657 ----> " + (bishop.icon == "\u2657").to_s
# puts "icon of white Knight should be u2658 ----> " + (knight.icon == "\u2658").to_s
# puts "icon of white Queen should be u2655 ----> " + (queen.icon == "\u2655").to_s
# puts "icon of white King should be u2654 ----> " + (king.icon == "\u2654").to_s

# puts "***************************************************"
# #### Valid movement
# ## top team
# # pawn = Pawn.new('black')
# # board = [
# #   [" ", " ", " ", " ", " ", " ", " ", " "],
# #   [" ", " ", " ", " ", " ", " ", " ", " "],
# #   [" ", " ", pawn, " ", " ", " ", " ", " "],
# #   [" ", " ", " ", " ", " ", " ", " ", " "],
# #   [" ", " ", " ", " ", " ", " ", " ", " "],
# #   [" ", " ", " ", " ", " ", " ", " ", " "],
# #   [" ", " ", " ", " ", " ", " ", " ", " "],
# #   [" ", " ", " ", " ", " ", " ", " ", " "],
# # ]

# # puts "movement of pawn (top teaem), 1st tour, 2 forward, with no one there, should be valid ----> " + (pawn.valid_movement?(board, 2, 2, 4, 2) == true).to_s
# # puts "movement of pawn (top teaem), 1st tour, 1 forward, with no one there, should be valid ----> " + (pawn.valid_movement?(board, 2, 2, 3, 2) == true).to_s
# # puts "movement of pawn (top teaem), 1st tour, 2 forward, with a piece there, should be unvalid ----> " + (pawn.valid_movement?(board, 2, 2, 4, 2) == false).to_s
# # puts "movement of pawn (top teaem), 1st tour, 1 forward, with a piece there, shold be unvalid ----> " + (pawn.valid_movement?(board, 2, 2, 3, 2) == false).to_s
# # puts "movement of pawn (top teaem), 1st tour, 3 forward, with a piece there, should be unvalid ----> " + (pawn.valid_movement?(board, 2, 2, 5, 2) == false).to_s
# # puts "movement of pawn (top teaem), 1st tour, 3 forward, with no one there, shold be unvalid ----> " + (pawn.valid_movement?(board, 2, 2, 5, 2) == false).to_s
# # puts "movement of pawn (top teaem), 1 forward, with no one there, should be valid ----> " + (pawn.valid_movement?(board, 3, 2, 4, 2) == true).to_s
# # puts "movement of pawn (top teaem), 1 forward, with a piece there, should be unvalid----> " + (pawn.valid_movement?(board, 3, 2, 4, 2) == false).to_s
# # puts "movement of pawn (top teaem), 1 backward, with no one there, should be unvalid ----> " + (pawn.valid_movement?(board, 3, 2, 2, 2) == false).to_s
# # puts "movement of pawn (top teaem), 3 backward, with a piece there, should be unvalid----> " + (pawn.valid_movement?(board, 5, 2, 2, 2) == false).to_s
# # puts "movement of pawn (top teaem), left diagonal forward, with a piece there, should be valid ----> " + (pawn.valid_movement?(board, 2, 2, 3, 3) == true).to_s
# # puts "movement of pawn (top teaem), right diagonal forward, with a piece there, should be valid ----> " + (pawn.valid_movement?(board, 2, 2, 3, 1) == true).to_s
# # puts "movement of pawn (top teaem), left diagonal forward, with no one there, should be unvalid ----> " + (pawn.valid_movement?(board, 2, 2, 3, 3) == false).to_s
# # puts "movement of pawn (top teaem), right diagonal forward, with no one there, should be unvalid ----> " + (pawn.valid_movement?(board, 2, 2, 3, 1) == false).to_s
# # puts "movement of pawn (top teaem), left diagonal backward, with no one there, should be unvalid ----> " + (pawn.valid_movement?(board, 2, 2, 1, 3) == false).to_s
# # puts "movement of pawn (top teaem), right diagonal backward, with no one there, should be unvalid ----> " + (pawn.valid_movement?(board, 2, 2, 1, 1) == false).to_s

# ##bottom team
# puts "***************************************************"

### method common to each class is valid_movement(board, beg_row, beg_col, end_row, end_col)
### need to figure a way to test properly the following: the team at the top, forward means positive differences (end_pos - beg_pos), forward at the bottom means negative differences (end_pos - beg_pos)

require './Pawn'
require './Rook'
require './Knight'
require './Bishop'
require './Queen'
require './King'

class Board 
  attr_accessor :board
  def initialize(type)
    @board = []
    8.times do |i|
      @board[i] = []
      8.times do |j|
        @board[i] << " "
      end
    end
    if type == 'test'
      test_pawn = Pawn.new('white')
       @board[1][4]  = test_pawn
    else
      8.times {|i| @board[6][i] = Pawn.new('white')}
      8.times {|i| @board[1]  [i] = Pawn.new('black')}
      2.times {|i| @board[7][i*7] = Rook.new('white')}
      2.times {|i| @board[0][i*7] = Rook.new('black')}
      2.times {|i| @board[7][i*5+1] = Knight.new('white')}
      2.times {|i| @board[0][i*5+1] = Knight.new('black')}
      2.times {|i| @board[7][i*3+2] = Bishop.new('white')}
      2.times {|i| @board[0][i*3+2] = Bishop.new('black')}
      @board[7][3] = Queen.new('white')
      @board[0][3] = Queen.new('black')
      @board[7][4] = King.new('white')
      @board[0][4] = King.new('black')     
    end
  end

  def display
    board = ""
    8.times do |row|
      8.times do |col|
        if @board[row][col] != " "
          board << " #{@board[row][col].icon} |"
        else
          board << "   |"
        end
      end
      board = board[0..-2]
      board << "\n-------------------------------\n"
    end
    board[0..-33]
  end

  # def valid_input?(user_input)    
  # user_input =~ /^[a-h][1-8]$/ ? true : false
  # end

  def get_pieces(piece_type)
    board_arr = @board.flatten
    pieces_found = board_arr.map do |piece|
      if piece && piece.instance_of?(piece_type)
        piece
      end
    end 
    return pieces_found.compact.length 
  end

end

require_relative '../piece.rb'
require_relative 'stepping_piece.rb'

class King < Piece
  include SteppingPiece

  MOVE_DIFFS = [[1, 0],
                [0, 1],
                [-1, 0],
                [0, -1],
                [1, 1],
                [-1, 1],
                [-1, -1],
                [1, -1]]


  def symbol
    @color == :white ? "\u2654" : "\u265a"
  end



end

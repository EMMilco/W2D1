require_relative '../piece.rb'
require_relative 'stepping_piece.rb'

class Horse < Piece
  include SteppingPiece

  MOVE_DIFFS = [[2,1],
                [1,2,],
                [2,-1],
                [-2,1],
                [-1,2],
                [1,-2],
                [-2,-1],
                [-1,-2]]

  def move_diffs
    MOVE_DIFFS
  end

  def symbol
    @color == :white ? "\u2658" : "\u265e"
  end
end

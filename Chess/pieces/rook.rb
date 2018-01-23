require_relative '../piece.rb'

class Rook < Piece
  def symbol
    @color == :white ? "\u2656" : "\u265c"
  end
end

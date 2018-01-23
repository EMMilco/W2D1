require_relative '../piece.rb'

class King < Piece
  def symbol
    @color == :white ? "\u2654" : "\u265a"
  end
end

require_relative '../piece.rb'

class Queen < Piece
  def symbol
    @color == :white ? "\u2655" : "\u265b"
  end
end

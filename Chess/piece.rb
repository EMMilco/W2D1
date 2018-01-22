require 'singleton'

class Piece

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s
    symbol.colorize(background: :light_white)
  end

end


class Rook < Piece
  def symbol
    @color == :white ? "\u2656" : "\u265c"
  end
end

class Horse < Piece
  def symbol
    @color == :white ? "\u2658" : "\u265e"
  end
end

class Bishop < Piece
  def symbol
    @color == :white ? "\u2657" : "\u265d"
  end
end

class Queen < Piece
  def symbol
    @color == :white ? "\u2655" : "\u265b"
  end
end

class King < Piece
  def symbol
    @color == :white ? "\u2654" : "\u265a"
  end
end

class Pawn < Piece
  def symbol
    @color == :white ? "\u2659" : "\u265f"
  end
end

class NullPiece < Piece
  include Singleton

  def initialize

  end
  def symbol
    @color == :white ? " " : " "
  end
end

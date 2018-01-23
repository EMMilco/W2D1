require 'singleton'


class Piece

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def valid_moves
    @move_diffs.map { |move| }
  end

end

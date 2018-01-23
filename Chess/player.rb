class Player
  def initialize(color, display)
    @color = color
    @display = display
    @board = display.board
  end



  def make_move
    start_pos = @display.render
    end_pos = @display.render
    @board.move_piece(start_pos, end_pos)
  end

end

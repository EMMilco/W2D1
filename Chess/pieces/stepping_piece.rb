module SteppingPiece

  def moves
    valid_moves = []
    MOVE_DIFFS.each do |pos_diff|
      next_pos = @pos.map.with_index { |coord, i| coord + pos_diff[i] }
      next unless Board.valid_pos?(next_pos) # checks that move isn't out of bounds
      next if @board[next_pos].color == @color # checks that move doesn't overlap our own piece
      valid_moves << next_pos
    end
    valid_moves
  end

end

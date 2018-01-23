require 'byebug'

module SlidingPiece

  HORIZONTAL_DIRS = [[1, 0],
                     [0, 1],
                     [-1, 0],
                     [0, -1]]

  DIAGONAL_DIRS = [[1, 1],
                   [-1, 1],
                   [-1, -1],
                   [1, -1]]

  def moves
    valid_moves = []
    move_dirs.each do |pos_diff|
      valid_moves += grow_unblocked_moves_in_dir(pos_diff)
    end
    valid_moves
  end

  def move_dirs
    HORIZONTAL_DIRS + DIAGONAL_DIRS
  end

  def grow_unblocked_moves_in_dir(pos_diff)
    valid_moves_in_direction = []
    last_pos = @pos
    loop do
      next_pos = last_pos.map.with_index { |coord, i| coord + pos_diff[i] }
      break unless Board.valid_pos?(next_pos) # checks that move isn't out of bounds
      break if @board[next_pos].color == @color # checks that move doesn't overlap our own piece
      break if @board[last_pos].color != @color && @board[last_pos].color != nil # checks it doesn't move past enemy piece and last position was not empty
      valid_moves_in_direction << next_pos
      last_pos = next_pos
    end

    valid_moves_in_direction
  end
end

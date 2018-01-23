require_relative 'display.rb'
require_relative 'player.rb'

class Game
end



b = Board.new
d = Display.new(b)
player = Player.new(:white, d)

while true
  player.make_move
end

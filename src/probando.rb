 require_relative "game"
game = Game.new
 game.initialize_cards
 game.mix
a = game.get_card
p a.shift

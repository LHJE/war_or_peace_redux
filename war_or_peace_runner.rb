require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/card_generator'

filename = "cards.txt"

cards = CardGenerator.new(filename).cards

masterdeck = [cards[0], cards[1], cards[2], cards[3], cards[4], cards[5], cards[6], cards[7], cards[8], cards[9], cards[10], cards[11], cards[12], cards[13], cards[14], cards[15], cards[16], cards[17], cards[18], cards[19], cards[20], cards[21], cards[22], cards[23], cards[24], cards[25], cards[26], cards[27], cards[28], cards[29], cards[30], cards[31], cards[32], cards[33], cards[34], cards[35], cards[36], cards[37], cards[38], cards[39], cards[40], cards[41], cards[42], cards[43], cards[44], cards[45], cards[46], cards[47], cards[48], cards[49], cards[50], cards[51]].shuffle

deck1 = Deck.new([])
deck2 = Deck.new([])

masterdeck[0..25].each do |card|
  deck1.cards << card
end

masterdeck[26..51].each do |card|
  deck2.cards << card
end

player1 = Player.new("Keith", deck1)
player2 = Player.new("Maxim", deck2)

game = Game.new(player1, player2)
game.start

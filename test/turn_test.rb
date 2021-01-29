require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:heart, 'Ace', 14)
    card_3 = Card.new(:spade, 'Three', 3)
    card_4 = Card.new(:club, 'Four', 4)
    card_5 = Card.new(:diamond, 'Five', 5)
    card_6 = Card.new(:heart, 'Six', 6)
    card_7 = Card.new(:diamond, 'Seven', 7)
    card_8 = Card.new(:heart, 'Eight', 8)
    card_9 = Card.new(:spade, 'Nine', 9)
    card_10 = Card.new(:club, 'Ten', 10)
    card_11 = Card.new(:diamond, 'Jack', 11)
    card_12 = Card.new(:heart, 'King', 13)
    deck_1 = Deck.new([card_1, card_2, card_3, card_4, card_5, card_6])
    deck_2 = Deck.new([card_7, card_8, card_9, card_10, card_11, card_12])
    @player_1 = Player.new('Clarisa', deck_1)
    @player_2 = Player.new('Sam', deck_2)
  end

  def test_it_exists
    turn = Turn.new(@player_1, @player_2)

    assert_instance_of Turn, turn
  end

  def test_it_has_readable_attributes
    turn = Turn.new(@player_1, @player_2)

    assert_equal @player_1, turn.player_1
    assert_equal @player_2, turn.player_2
    assert_equal [], turn.spoils_of_war
  end
end

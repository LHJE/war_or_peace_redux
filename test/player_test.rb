require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test
  def setup
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:heart, 'Ace', 14)
    card_3 = Card.new(:spade, 'Three', 3)
    card_4 = Card.new(:club, 'four', 4)
    card_5 = Card.new(:diamond, 'five', 5)
    card_6 = Card.new(:heart, 'six', 6)
    @deck = Deck.new([card_1, card_2, card_3, card_4, card_5, card_6])

    @player = Player.new('Clarisa', @deck)
  end

  def test_it_exists
    assert_instance_of Player, @player
  end

  def test_it_has_readable_attributes
    assert_equal 'Clarisa', @player.name
    assert_equal @deck, @player.deck
  end

  def test_has_lost_false
    assert_equal false, @player.has_lost?
  end

  def test_has_lost_true
    6.times { @player.deck.remove_card }
    assert_equal true, @player.has_lost?
  end
end

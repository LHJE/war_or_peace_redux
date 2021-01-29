require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def setup
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card_1, card_2])
  end

  def test_it_exists
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card_1, card_2])

    assert_instance_of Deck, deck
  end

  def test_it_has_readable_attributes
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card_1, card_2])

    assert_equal [card_1, card_2], deck.cards
  end

  def test_rank_of_cards_at
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card_1, card_2])

    assert_equal 14, deck.rank_of_card_at(1)
  end
end

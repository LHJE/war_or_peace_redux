require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def setup
    @card_1 = Card.new(:diamond, 'Queen', 12)
    @card_2 = Card.new(:heart, 'Ace', 14)
    @card_3 = Card.new(:spade, 'Three', 3)
    @card_4 = Card.new(:club, 'four', 4)
    @card_5 = Card.new(:diamond, 'five', 5)
    @card_6 = Card.new(:heart, 'six', 6)
    @deck = Deck.new([@card_1, @card_2])
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_has_readable_attributes
    assert_equal [@card_1, @card_2], @deck.cards
  end

  def test_rank_of_cards_at
    assert_equal 14, @deck.rank_of_card_at(1)
  end

  def test_high_ranking_cards
    deck_2 = Deck.new([@card_1, @card_2, @card_3, @card_4])

    assert_equal [@card_1, @card_2], deck_2.high_ranking_cards
  end

  def test_percent_high_ranking_cards
    deck_3 = Deck.new([@card_1, @card_2, @card_3, @card_4, @card_5, @card_6])

    assert_equal 33.33, deck_3.percent_high_ranking
  end

  def test_remove_card
    deck_4 = Deck.new([@card_1, @card_2, @card_3, @card_4])

    assert_equal [@card_1, @card_2, @card_3, @card_4], deck_4.cards

    deck_4.remove_card

    assert_equal [@card_2, @card_3, @card_4], deck_4.cards
  end

  def test_add_card
    deck_5 = Deck.new([@card_1, @card_2])

    assert_equal [@card_1, @card_2], deck_5.cards

    card_7 = Card.new(:spade, 'Seven', 7)

    deck_5.add_card(card_7)

    assert_equal [@card_1, @card_2, card_7], deck_5.cards
  end
end

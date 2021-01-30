require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @card_1 = Card.new(:diamond, 'Queen', 12)
    @card_2 = Card.new(:heart, 'Ace', 14)
    @card_3 = Card.new(:spade, 'Three', 3)
    @card_4 = Card.new(:club, 'Four', 4)
    @card_5 = Card.new(:diamond, 'Five', 5)
    @card_6 = Card.new(:heart, 'Six', 6)
    @card_7 = Card.new(:diamond, 'Seven', 7)
    @card_8 = Card.new(:heart, 'Eight', 8)
    @card_9 = Card.new(:spade, 'Nine', 9)
    @card_10 = Card.new(:club, 'Ten', 10)
    @card_11 = Card.new(:diamond, 'Jack', 11)
    @card_12 = Card.new(:heart, 'King', 13)
    @card_13 = Card.new(:diamond, 'Queen', 12)
    @card_14 = Card.new(:heart, 'Ace', 14)
    @card_15 = Card.new(:clubs, 'Three', 3)
    @card_16 = Card.new(:heart, 'Queen', 12)
    @card_17 = Card.new(:heart, 'Eight', 8)
    @card_18 = Card.new(:spade, 'Three', 3)
    @card_19= Card.new(:diamond, 'Queen', 12)
    @card_20 = Card.new(:heart, 'Ace', 14)
    @card_21 = Card.new(:clubs, 'Three', 3)
    @card_22 = Card.new(:heart, 'Queen', 12)
    @card_23 = Card.new(:heart, 'Eight', 8)
    @card_24 = Card.new(:spade, 'Four', 4)
    deck_1 = Deck.new([@card_1, @card_2, @card_3, @card_4, @card_5, @card_6])
    deck_2 = Deck.new([@card_7, @card_8, @card_9, @card_10, @card_11, @card_12])
    deck_3 = Deck.new([@card_13, @card_14, @card_15])
    deck_4 = Deck.new([@card_16, @card_17, @card_18])
    deck_5 = Deck.new([@card_19, @card_20, @card_21])
    deck_6 = Deck.new([@card_22, @card_23, @card_24])
    @player_5 = Player.new('Ferguson', deck_5)
    @player_6 = Player.new('Janet', deck_6)
    @player_1 = Player.new('Clarisa', deck_1)
    @player_2 = Player.new('Sam', deck_2)
    @player_3 = Player.new('Ferguson', deck_3)
    @player_4 = Player.new('Janet', deck_4)
    @turn = Turn.new(@player_1, @player_2)
    @turn_2 = Turn.new(@player_3, @player_4)
    @turn_3 = Turn.new(@player_5, @player_6)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_has_readable_attributes
    assert_equal @player_1, @turn.player_1
    assert_equal @player_2, @turn.player_2
    assert_equal [], @turn.spoils_of_war
  end

  def test_type_basic
    assert_equal :basic, @turn.type
  end

  def test_type_mutually_assured_destruction
    assert_equal :mutually_assured_destruction, @turn_2.type
  end

  def test_type_war
    assert_equal :war, @turn_3.type
  end

  def test_winner_basic
    assert_equal :basic, @turn.type

    assert_equal @player_1, @turn.winner
  end

  def test_winner_mutually_assured_destruction
    assert_equal :mutually_assured_destruction, @turn_2.type

    assert_equal "No Winner", @turn_2.winner
  end

  def test_winner_war
    assert_equal :war, @turn_3.type

    assert_equal @player_6, @turn_3.winner
  end

  def test_pile_cards_basic
    assert_equal :basic, @turn.type

    @turn.pile_cards

    assert_equal [@card_1, @card_7], @turn.spoils_of_war
  end

  def test_pile_cards_mutually_assured_destruction
    assert_equal :mutually_assured_destruction, @turn_2.type

    @turn_2.pile_cards

    assert_equal [], @turn_2.spoils_of_war
  end

  def test_pile_cards_war
    assert_equal :war, @turn_3.type

    @turn_3.pile_cards

    assert_equal [@card_19, @card_22, @card_20, @card_23, @card_21, @card_24], @turn_3.spoils_of_war
  end

  def test_award_spoils_basic
    assert_equal :basic, @turn.type

    victor = @turn.winner

    @turn.pile_cards

    @turn.award_spoils(victor)

    assert_equal [@card_2, @card_3, @card_4, @card_5, @card_6, @card_1, @card_7], @player_1.deck.cards
    assert_equal [@card_8, @card_9, @card_10, @card_11, @card_12], @player_2.deck.cards
  end

  def test_award_spoils_mutually_assured_destruction
    assert_equal :mutually_assured_destruction, @turn_2.type

    victor = @turn_2.winner

    @turn_2.pile_cards

    @turn_2.award_spoils(victor)

    assert_equal [], @player_3.deck.cards
    assert_equal [], @player_4.deck.cards
  end

  def test_award_spoils_war
    assert_equal :war, @turn_3.type

    victor = @turn_3.winner

    @turn_3.pile_cards

    @turn_3.award_spoils(victor)

    assert_equal [], @player_5.deck.cards
    assert_equal [@card_19, @card_22, @card_20, @card_23, @card_21, @card_24], @player_6.deck.cards
  end
end

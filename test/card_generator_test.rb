require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def setup
    @cards = CardGenerator.new("cards.txt")
  end

  def test_it_exists
    assert_instance_of CardGenerator, @cards
  end

  def test_it_has_readable_attributes
    assert_equal "cards.txt", @cards.filename
  end

  def test_cards
    assert_instance_of Array, @cards.cards
    assert_instance_of Card, @cards.cards[0]
  end
end

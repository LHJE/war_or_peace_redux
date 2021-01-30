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
end

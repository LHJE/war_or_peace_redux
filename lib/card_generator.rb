require './lib/card'

class CardGenerator

  attr_reader :filename,
              :cards

  def initialize(filename)
    @filename = filename
    @cards = []
  end

  def cards
    cards_info_array = File.readlines("./data/#{@filename}").each do |line|
      line
    end
    cards_info_array.each do |card_info|
      info_array = card_info[0..-2].split(", ")
      @cards << Card.new(info_array[0].to_sym, info_array[1].split('')[1], info_array[2].to_i)
    end
    @cards
  end

end

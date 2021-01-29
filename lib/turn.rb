class Turn

  attr_reader :player_1,
              :player_2,
              :spoils_of_war

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @spoils_of_war = []
  end

  def type
    if @player_1.deck.rank_of_card_at(0) == @player_2.deck.rank_of_card_at(0) && @player_1.deck.rank_of_card_at(2) == @player_2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif @player_1.deck.rank_of_card_at(0) == @player_2.deck.rank_of_card_at(0)
    :war
    else
      :basic
    end
  end

end

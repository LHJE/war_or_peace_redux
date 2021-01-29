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

  def who_is_higher(index)
    if @player_1.deck.rank_of_card_at(0) > @player_2.deck.rank_of_card_at(0)
      @player_1
    else
      @player_2
    end
  end

  def winner
    if self.type == :mutually_assured_destruction
      "No Winner"
    elsif self.type == :war
      who_is_higher(2)
    else
      who_is_higher(0)
    end
  end

  def shoveler
    @spoils_of_war << @player_1.deck.cards[0]
    @spoils_of_war << @player_2.deck.cards[0]
    @player_1.deck.remove_card
    @player_2.deck.remove_card
  end

  def pile_cards
    if self.type == :mutually_assured_destruction
      3.times { @player_1.deck.remove_card }
      3.times { @player_2.deck.remove_card }
    elsif self.type == :war
      3.times { self.shoveler }
    else
      self.shoveler
    end

  end

end

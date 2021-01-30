require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game

  attr_reader :player_1,
              :player_2

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
  end

  def user_input
    gets.chomp!
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{@player_1.name} and #{@player_2.name}."
    p "Type 'GO' to start the game!"
    user_index = user_input.downcase
    start_the_game(user_index)
  end

  def start_the_game(user_index)
    if user_index != "go"
      p "Well now we're gonna have to start again.  This time please enter 'GO'"
      p "-----------------"
      self.start
    else
      play_the_game
    end
  end

  def play_the_game
    turn_count = 0
    game_loop(turn_count)
    endgame
  end

  def game_loop(turn_count)
    until @player_1.has_lost? || @player_2.has_lost? == []
      turn_count += 1
      if turn_count == 1000001
        break
      else
        take_a_turn(turn_count)
      end
    end
  end

  def endgame
    if !@player_1.has_lost? && !@player_2.has_lost?
      p "---- DRAW ----"
    elsif @player_1.has_lost?
      p "*~*~*~* #{@player_2.name} has won the game! *~*~*~* "
    else
      p "*~*~*~* #{@player_1.name} has won the game! *~*~*~* "
    end
  end

  def take_a_turn(turn_count)
    turn = Turn.new(@player_1, @player_2)
    victor = turn.winner
    turn_text(turn_count, victor, turn)
    turn.pile_cards
    turn.award_spoils(victor)
  end

  def turn_text(turn_count, victor, turn)
    if turn.type == :mutually_assured_destruction
      p "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from play"
    elsif turn.type == :war
      p "Turn #{turn_count}: WAR - #{victor.name} won 6 cards"
    else
      p "Turn #{turn_count}: #{victor.name} won 2 cards"
    end
  end

end

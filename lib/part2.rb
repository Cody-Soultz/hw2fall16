class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  # YOUR CODE HERE
  entry_to_sym = { 'p'=>:PAPER, 'r'=>:ROCK, 's'=>:SCISSORS }
  valid_entries = entry_to_sym.keys
  first_Loses = [[:PAPER, :SCISSORS], [:ROCK, :PAPER], [:SCISSORS, :ROCK]]
  raise NoSuchStrategyError unless valid_entries.include?(game[0][1].downcase)
  raise NoSuchStrategyError unless valid_entries.include?(game[1][1].downcase)
  return game[1]  if first_Loses.include?([entry_to_sym[game[0][1].downcase],entry_to_sym[game[1][1].downcase]])
  return game[0] if !first_Loses.include?([game[0][1],game[1][1]])
end

def rps_tournament_winner(tournament)
  # YOUR CODE HERE
  begin
    return rps_game_winner(tournament) if tournament[0][0][0].length == 1 # base case
    if tournament[0][0].length != 1
      tournament[0] = rps_tournament_winner(tournament[0])
      tournament[1] = rps_tournament_winner(tournament[1])
      rps_tournament_winner(tournament)
    else
      return tournament
    end
  rescue
    puts "Either the tournament was null or not formated correctly"
    puts "Please use the format [[\"name\",\"r|p|s\"]]"
    puts "Also make sure to have more than one player"
  end
end

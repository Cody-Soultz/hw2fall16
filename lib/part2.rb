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
  puts "Start of function: " + tournament.to_s
  return rps_game_winner(tournament) if tournament[0][0][0].length == 1 # base case
  if tournament[0][0].length != 1
    puts "Run rps_tournament_winner on first half: " + tournament[0].to_s
    tournament[0] = rps_tournament_winner(tournament[0])
    puts "Run rps_tournament_winner on second half: " + tournament[1].to_s
    tournament[1] = rps_tournament_winner(tournament[1])
    puts "Pass back through: " + tournament.to_s
    rps_tournament_winner(tournament)
  else
    return tournament
  end
end

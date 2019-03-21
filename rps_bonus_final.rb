VALID_CHOICES = ['r', 'l', 'p', 'sc', 'sp']

CHOICE_FULL_NAMES = { 'r' => ['rock'],
                      'p' => ['paper'],
                      'sc' => ['scissors'],
                      'l' => ['lizard'],
                      'sp' => ['Spock'] }

NUMBER_OF_ROUNDS_TO_WIN = 5

winning_combos = { 'r' => ['l', 'sc'],
                   'p' => ['r', 'sp'],
                   'sc' => ['p', 'l'],
                   'l' => ['p', 'sp'],
                   'sp' => ['sc', 'r'] }

def prompt(message)
  puts("=> #{message}")
end

def valid_user_input?(letters)
  VALID_CHOICES.include?(letters)
end

def welcome_message
  prompt('Welcome to Rock Paper Scissors Lizard Spock!')
  puts <<-MSG
  "It's very simple.
  Scissors cuts paper, paper covers rock, rock crushes lizard,
  lizard poisons Spock, Spock smashes scissors, scissors decapitates lizard,
  lizard eats paper, paper disproves Spock, Spock vaporizes rock,
  and, as it always has, rock crushes scissors."
  MSG
  prompt("Play against the computer until #{NUMBER_OF_ROUNDS_TO_WIN}
  points to become the Grand Master!")
end

def input_options
  prompt(<<-MSG
      Please enter one of the following sets of letters:
      r  => rock
      p  => paper
      sc  => scissors
      l  => lizard
      sp  => Spock
      -----
      MSG
        )
end

def retrieve_user_input
  input_options
  gets.chomp.downcase
end

def display_invalid_input_message
  prompt('Not a valid entry! Try again!')
end

def user_choice_long(u)
  CHOICE_FULL_NAMES.fetch(u).join
end

def computer_choice_long(c)
  CHOICE_FULL_NAMES.fetch(c).join
end

def display_round_choices_message(u, c)
  u = user_choice_long(u)
  c = computer_choice_long(c)
  puts "You chose #{u}, Computer chose #{c}."
end

def player_won_round?(user_win, computer_choice)
  user_win.include?(computer_choice)
end

def display_points_message(u, c)
  prompt("Points = You: #{u}, Computer: #{c}")
end

def user_won_match?(user_points)
  user_points == NUMBER_OF_ROUNDS_TO_WIN
end

def computer_won_match?(computer_points)
  computer_points == NUMBER_OF_ROUNDS_TO_WIN
end

def tie?(user_input, computer_choice)
  user_input == computer_choice
end

def match_ended?(user_points, computer_points)
  user_won_match?(user_points) || computer_won_match?(computer_points)
end

def display_play_again_message
  prompt('Play again? Enter Q to exit, or enter any other key to continue.')
end

def play_again?(answer)
  answer == "Q"
end

def display_exit_message
  prompt('Come back soon! Bye!')
end

def clear_screen
  system('clear') || system('cls')
end

loop do # play again loop
  welcome_message

  user_input = ''

  user_point_counter = 0
  computer_point_counter = 0

  until match_ended?(user_point_counter, computer_point_counter) # counter loop
    loop do # valid user entry loop
      user_input = retrieve_user_input
      break if valid_user_input?(user_input)
      display_invalid_input_message
    end # end valid user entry loop

    computer_choice = VALID_CHOICES.sample()

    user_win = winning_combos.fetch(user_input)

    if player_won_round?(user_win, computer_choice)
      user_point_counter += 1
      clear_screen
      display_round_choices_message(user_input, computer_choice)
      puts ">>>>>>>>> You win."
      display_points_message(user_point_counter, computer_point_counter)
      break if user_point_counter == NUMBER_OF_ROUNDS_TO_WIN
    elsif tie?(user_input, computer_choice)
      clear_screen
      display_round_choices_message(user_input, computer_choice)
      puts "======== Tie."
      display_points_message(user_point_counter, computer_point_counter)
      break if computer_point_counter == NUMBER_OF_ROUNDS_TO_WIN
    else
      computer_point_counter += 1
      clear_screen
      display_round_choices_message(user_input, computer_choice)
      puts "~~~~~~~~ Computer wins."
      display_points_message(user_point_counter, computer_point_counter)
      break if computer_point_counter == NUMBER_OF_ROUNDS_TO_WIN
    end

  end # counter loop

  if user_point_counter == NUMBER_OF_ROUNDS_TO_WIN
    puts ">>>>>>>>> You are the Grand Master! >>>>>>>>>>"
  elsif computer_point_counter == NUMBER_OF_ROUNDS_TO_WIN
    puts '~~~~~~ Computer is the Grand Master! ~~~~~~~'
  end

  display_play_again_message
  answer = gets.chomp.upcase
  break if play_again?(answer)
  clear_screen
end # play again loop

display_exit_message

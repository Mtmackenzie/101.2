VALID_CHOICES = ['r', 'l', 'p', 'sc', 'sp']

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
  prompt('Play against the computer until 5 points to become the Grand Master!')
end

def input_options
  prompt(<<-MSG
      Please input one of the following sets of letters:
      r  => rock
      p  => paper
      sc  => scissors
      l  => lizard
      sp  => Spock
      -----
      MSG
        )
end

def display_invalid_input_message
  prompt('Not a valid entry! Try again!')
end

def display_play_again_message
  prompt('Play again? Type Q to exit, or any other key to continue.')
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

  until user_point_counter >= 5 || computer_point_counter >= 5 # counter loop

    loop do # valid user entry loop
      input_options
      user_input = gets.chomp.downcase
      break if valid_user_input?(user_input)
      display_invalid_input_message
    end # end valid user entry loop

    computer_choice = VALID_CHOICES.sample()

    user_win = winning_combos.fetch(user_input)

    if user_win.include?(computer_choice)
      user_point_counter += 1
      clear_screen
      puts "You chose #{user_input}, Computer chose #{computer_choice}.
          >>>>>>>>> You win.
          You: #{user_point_counter}, Computer: #{computer_point_counter}"
      break if user_point_counter >= 5
    elsif user_input == computer_choice
      clear_screen
      puts "Computer also chose #{computer_choice}.
          >>>>>>>>> Tie.
          You: #{user_point_counter}, Computer: #{computer_point_counter}"
      break if computer_point_counter >= 5
    else
      computer_point_counter += 1
      clear_screen
      puts "You chose #{user_input}, Computer chose #{computer_choice}.
         >>>>>>>>> Computer wins.
          You: #{user_point_counter}, Computer: #{computer_point_counter}"
      break if computer_point_counter >= 5
    end

  end # counter loop

  if user_point_counter == 5
    puts ">>>>>>>>> You are the Grand Master! >>>>>>>>>>"
  elsif computer_point_counter == 5
    puts '~~~~~~ Computer is the Grand Master! ~~~~~~~'
  end

  display_play_again_message
  answer = gets.chomp.upcase
  break if play_again?(answer)
  clear_screen
end # play again loop

display_exit_message

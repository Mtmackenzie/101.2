loan_amount = ''
percentage = ''
percentage_rate = ''
monthly_interest_rate = ''

def prompt(message)
  puts("=> #{message}")
end

def display_welcome_message
  prompt('Welcome to the Car Payment Calculator!')
end

def positive_number?(num)
  num.to_f > 0
end

def display_invalid_number_message
  prompt('Please write a valid positive number.')
end

def display_enter_loan_amount_message
  prompt('Please enter your total loan amount:')
end

def retrieve_loan_amount
  gets.chomp.delete(',').to_f
end

def display_enter_apr_amount_message
  prompt('Please enter the Annual Percentage Rate (APR) as a percentage ___%:')
end

def valid_percentage?(num)
  num.to_f < 1 && num.to_f >= 0.005
end

def retrieve_apr_percentage
  gets.chomp.to_f
end

def display_time_in_months_message
  prompt('Please enter the amount of time of your loan (in months):')
end

def display_recalculate_message
  prompt('Recalculate? Type Y to continue, or any other key to exit.')
end

def recalculate?(answer)
  answer == 'y'
end

def display_exit_message
  prompt('Goodbye!')
end

display_welcome_message

loop do # main loop
  loop do
    display_enter_loan_amount_message
    loan_amount = retrieve_loan_amount

    break if positive_number?(loan_amount)
    display_invalid_number_message
  end

  display_enter_apr_amount_message

  loop do
    percentage = retrieve_apr_percentage
    percentage_rate = percentage / 100
    break if valid_percentage?(percentage_rate)
    prompt('Please enter the percentage number.
            For example, for 12%, enter 12.')
  end

  monthly_interest_rate = percentage_rate / 12

  display_time_in_months_message

  loan_duration_months = ''

  loop do
    loan_duration_months = gets.chomp.to_i
    break if positive_number?(loan_duration_months)
    prompt("Please enter a positive integer.")
  end

  monthly_payment = loan_amount *
                    (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**-loan_duration_months))

  monthly_payment = monthly_payment.round(2)

  prompt("Your monthly loan amount payment is: #{monthly_payment}")

  display_recalculate_message
  answer = gets.chomp.downcase
  break unless recalculate?(answer)
end

display_exit_message

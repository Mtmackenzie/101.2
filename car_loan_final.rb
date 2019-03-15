# Car Loan Calculator
#
# Puts Welcome message
# loop
# Gets loan amount
#   stores to variable p
# gets APR
# math to monthly, set variable monthy to j
# gets loan duration in months j
# plug in numbers in formula
# add monthly payment
# puts result monthly payment
# Continue?
# gets.chomp
# break if n
# continue if y
# loop end

def prompt(message)
  puts("=> #{message}")
end

def valid_number?(num)
  num.to_f > 0
end

def valid_percentage?(num)
  num.to_f < 1 && num.to_f > 0.005
end

loan_amount = ''
percentage = ''
percentage_rate = ''

prompt('Welcome to the Car Payment Calculator!')

loop do # main loop
  loop do
    prompt('Please enter your total loan amount:')
    loan_amount = gets.chomp.delete(',').to_f
    break if valid_number?(loan_amount)
    prompt('Please write a valid number.')
  end

  prompt('Please enter the Annual Percentage Rate (APR) as a percentage ___%:')

  loop do
    percentage = gets.chomp.to_f
    percentage_rate = percentage / 100
    break if valid_percentage?(percentage_rate)
    prompt('Please enter the percentage number.
            For example, for 12%, enter 12.')
  end

  monthly_interest_rate = percentage_rate / 12

  prompt('Please enter the amount of time of your loan (in months):')

  loan_duration_months = ''

  loop do
    loan_duration_months = gets.chomp.to_i
    break if valid_number?(loan_duration_months)
    prompt("Please enter a positive integer.")
  end

  monthly_payment = loan_amount *
                    (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**-loan_duration_months))

  monthly_payment = monthly_payment.round(2)

  prompt("Your monthly loan amount payment is: #{monthly_payment}")

  prompt('Recalculate? Type Y to continue, or any other key to exit.')
  recalculate = gets.chomp.downcase
  break if recalculate != 'y'
end

prompt('Goodbye!')

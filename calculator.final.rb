require 'pry'
# Build a command line calculator program that does the following:

# asks for two numbers
# asks for the type of operation to perform: add, subtract, multiply or divide
# displays the result
# Use the Kernel.gets() method to retrieve user input,
# and use Kernel.puts() method to display output.
# Remember that Kernel.gets() includes the newline,
# so you have to call chomp() to remove it:
# Kernel.gets().chomp().

# gets number one
#   assign variable
# gets number two
#   assign variable
# gets operation type
# method operation type
#   puts result
# error if not integer, not operation
# end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(n)
  n.to_i != 0
end

def operation_to_msg(op)
  case op
  when '+'
    'Adding'
  when '-'
    'Subtracting'
  when '*'
    'Multiplying'
  when '/'
    'Dividing'
  end
end

num1 = ''
num2 = ''

prompt('Welcome to Calculator! Please enter your name:')

name = ''
loop do
  name = Kernel.gets().chomp()
  break if name.empty? == false
  prompt('Please use a valid name.')
end

prompt("Hi, #{name}!")

loop do # main loop
  loop do
    prompt('Input first integer:')
    num1 = Kernel.gets().chomp()

    break if valid_number?(num1)
    prompt('Please input an integer.')
  end

  loop do
    prompt('Input second integer:')
    num2 = Kernel.gets().chomp()

    break if valid_number?(num2)
    prompt('Please input an integer.')
  end

  operator = <<-MSG
  Please input one of the following symbols:
  +
  -
  *
  /
  MSG

  prompt(operator)

  operation = ''
  loop do
    operation = Kernel.gets().chomp()

    break if %w(+ - / *).include?(operation)
    prompt('Please select +, -, /, or *')
  end

  prompt("#{operation_to_msg(operation)} the two numbers...")

  result = case operation
           when '+'
             num1.to_i + num2.to_i
           when '-'
             num1.to_i - num2.to_i
           when '/'
             num1.to_f / num2.to_f
           when '*'
             num1.to_i * num2.to_i
           end

  prompt("The result is:  #{result} ")

  prompt('Do you want to perform another calculation? Y to continue.')
  answer = Kernel.gets().chomp().upcase
  break unless answer == 'Y'
end

prompt("Thank you, goodbye #{name}!")

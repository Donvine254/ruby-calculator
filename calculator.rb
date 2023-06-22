#define function to get number from the user, since we are getting two numbers, we give a message parameter to make it dynamic
def get_number(message)
  print message
  input = gets.chomp
  until input =~ /^-?\d+(\.\d+)?$/ #check whether the input is a number. We can also check using if message.class === Integer
    puts "Error: Please enter a valid number."
    print message
    input = gets.chomp
  end
  input.to_f #all inputs in ruby are strings and we need to convert them to float or integer
end
#define function to get the operator. The function checks whether a valid operator was passed
def get_operator
  print "Please enter the operator (+, -, *, /): "
  operator = gets.chomp
  until %w[+ - * /].include?(operator) #when i was writing this code, only God and I understood. Now only God knows!
    puts "Error: Please enter a valid operator."
    print "Please enter the operator (+, -, *, /): "
    operator = gets.chomp
  end
  operator
end

def calculate(num1, num2, operator) #since ruby can automatically perfom calculations, we only need to check in cases when user divides a number by zero
  case operator
  when "/"
    if num2.zero?
      puts "Error: Division by zero is not allowed."
      return nil
    else
      result = num1 / num2
    end
  else
    result = num1.send(operator, num2) #the .send method invokes the operator on the input like this num1.send(:+, num2) returns num1+num2
  end

  result
end

def display_result(result)
  puts "Result: #{result}"
end

def calculator_app
 puts "+-----------------------------+"
  puts "|       Calculator            |"
  puts "+-----------------------------+"
  num1 = get_number("Enter the first number: ")
  num2 = get_number("Enter the second number: ")
  operator = get_operator

  result = calculate(num1, num2, operator)
   puts "+-----------------------------+"
  display_result(result.round(2)) unless result.nil?
  puts "+-----------------------------+"
end

calculator_app

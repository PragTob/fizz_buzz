# frozen_string_literal: true

# only here for demonstration purposes

1.upto(100) do |number|
  if (number % 3 == 0) & (number % 5 == 0)
    puts "FizzBuzz"
  elsif number % 3 == 0
    puts "Fizz"
  elsif number % 5 == 0
    puts "Buzz"
  else
    puts number
  end
end

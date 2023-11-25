# frozen_string_literal: true

# A simple FizzBuzz implementation
module FizzBuzz
  module_function

  def fizz_buzz(number)
    fizz = divisible_by?(number, 3)
    buzz = divisible_by?(number, 5)

    if fizz & buzz
      "FizzBuzz"
    elsif fizz
      "Fizz"
    elsif buzz
      "Buzz"
    else
      number
    end
  end

  def run
    1.upto(100) do |number|
      puts fizz_buzz(number)
    end
  end

  def divisible_by?(number, divisor)
    number % divisor == 0
  end
end

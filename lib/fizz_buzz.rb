# frozen_string_literal: true

module FizzBuzz

  extend self

  def fizz_buzz(number)
    if (number % 3 == 0) & (number % 5 == 0)
      "FizzBuzz"
    elsif number % 3 == 0
      "Fizz"
    elsif number % 5 == 0
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
end

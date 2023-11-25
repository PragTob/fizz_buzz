# frozen_string_literal: true

# A simple FizzBuzz implementation
module FizzBuzz
  module_function

  FIZZ_NUMBER = 3
  FIZZ_TEXT = "Fizz"

  BUZZ_NUMBER = 5
  BUZZ_TEXT = "Buzz"

  FIZZ_BUZZ_TEXT = FIZZ_TEXT + BUZZ_TEXT

  def fizz_buzz(number)
    fizz = divisible_by?(number, FIZZ_NUMBER)
    buzz = divisible_by?(number, BUZZ_NUMBER)

    if fizz & buzz
      FIZZ_BUZZ_TEXT
    elsif fizz
      FIZZ_TEXT
    elsif buzz
      BUZZ_TEXT
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

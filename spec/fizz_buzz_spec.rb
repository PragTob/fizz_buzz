# frozen_string_literal: true

RSpec.describe FizzBuzz do
  describe ".fizz_buzz" do
    expected = {
      1 => 1,
      2 => 2,
      3 => "Fizz",
      4 => 4,
      5 => "Buzz",
      6 => "Fizz",
      11 => 11,
      15 => "FizzBuzz",
      20 => "Buzz",
      60 => "FizzBuzz",
      98 => 98,
      99 => "Fizz",
      100 => "Buzz"
    }

    expected.each do |input, output|
      it "for #{input} expect #{output}" do
        expect(FizzBuzz.fizz_buzz(input)).to eq output
      end
    end
  end
end

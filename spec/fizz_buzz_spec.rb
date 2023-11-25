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
        expect(described_class.fizz_buzz(input)).to eq output
      end
    end

    context "with BazzFizz Rules it respects order" do
      buzz_fizz_rules = [
        FizzBuzz::Rule.new("Buzz", 5),
        FizzBuzz::Rule.new("Fizz", 3)
      ]

      expected = {
        1 => 1,
        3 => "Fizz",
        5 => "Buzz",
        15 => "BuzzFizz"
      }

      expected.each do |input, output|
        it "for #{input} expect #{output}" do
          expect(described_class.fizz_buzz(input, buzz_fizz_rules)).to eq output
        end
      end
    end

    context "with Zazz into the equation" do
      zazz_rules = [
        FizzBuzz::Rule.new("Fizz", 3),
        FizzBuzz::Rule.new("Buzz", 5),
        FizzBuzz::Rule.new("Zazz", 7)
      ]

      expected = {
        1 => 1,
        3 => "Fizz",
        5 => "Buzz",
        7 => "Zazz",
        15 => "FizzBuzz",
        21 => "FizzZazz",
        35 => "BuzzZazz",
        105 => "FizzBuzzZazz"
      }

      expected.each do |input, output|
        it "for #{input} expect #{output}" do
          expect(described_class.fizz_buzz(input, zazz_rules)).to eq output
        end
      end
    end

    context "with no rules" do
      expected = {
        1 => 1,
        3 => 3,
        5 => 5,
        15 => 15
      }

      expected.each do |input, output|
        it "for #{input} expect #{output}" do
          expect(described_class.fizz_buzz(input, [])).to eq output
        end
      end
    end

    context "when applying the same rule multiple times" do
      double_fizz_rules = [
        FizzBuzz::Rule.new("Fizz", 3),
        FizzBuzz::Rule.new("Fizz", 3)
      ]

      expected = {
        1 => 1,
        3 => "FizzFizz",
        5 => 5,
        66 => "FizzFizz"
      }

      expected.each do |input, output|
        it "for #{input} expect #{output}" do
          expect(described_class.fizz_buzz(input, double_fizz_rules)).to eq output
        end
      end
    end
  end

  describe ".run" do
    full_fizz_buzz = <<~FIZZY
      1
      2
      Fizz
      4
      Buzz
      Fizz
      7
      8
      Fizz
      Buzz
      11
      Fizz
      13
      14
      FizzBuzz
      16
      17
      Fizz
      19
      Buzz
      Fizz
      22
      23
      Fizz
      Buzz
      26
      Fizz
      28
      29
      FizzBuzz
      31
      32
      Fizz
      34
      Buzz
      Fizz
      37
      38
      Fizz
      Buzz
      41
      Fizz
      43
      44
      FizzBuzz
      46
      47
      Fizz
      49
      Buzz
      Fizz
      52
      53
      Fizz
      Buzz
      56
      Fizz
      58
      59
      FizzBuzz
      61
      62
      Fizz
      64
      Buzz
      Fizz
      67
      68
      Fizz
      Buzz
      71
      Fizz
      73
      74
      FizzBuzz
      76
      77
      Fizz
      79
      Buzz
      Fizz
      82
      83
      Fizz
      Buzz
      86
      Fizz
      88
      89
      FizzBuzz
      91
      92
      Fizz
      94
      Buzz
      Fizz
      97
      98
      Fizz
      Buzz
    FIZZY

    it "does a full run integration style" do
      expect { described_class.run }.to output(full_fizz_buzz).to_stdout
    end

    it "can take rules and even no rules which just results into 1 to 100" do
      one_to_hundred = 1.upto(100).to_a.join("\n")
      one_to_hundred_last_line_break = "#{one_to_hundred}\n"
      expect { described_class.run([]) }.to output(one_to_hundred_last_line_break).to_stdout
    end
  end
end

# frozen_string_literal: true

# A simple FizzBuzz implementation
module FizzBuzz
  module_function

  # A rule in the game of FizzBuzz as in, put out this text if it is divisible by x
  class Rule
    def initialize(output, applicalbe_divisible_by)
      @output = output
      @applicalbe_divisible_by = applicalbe_divisible_by
    end

    def apply(number)
      @output if divisible_by?(number, @applicalbe_divisible_by)
    end

    def divisible_by?(number, divisor)
      number % divisor == 0
    end
  end

  DEFAULT_RULES = [
    Rule.new("Fizz", 3),
    Rule.new("Buzz", 5)
  ].freeze

  def fizz_buzz(number, rules = DEFAULT_RULES)
    applied_rules = rules.filter_map { |rule| rule.apply(number) }

    if applied_rules.any?
      applied_rules.join
    else
      number
    end
  end

  DEFAULT_OPTS = {
    range: 1..100,
    rules: DEFAULT_RULES
  }.freeze
  def run(opts = {})
    opts = DEFAULT_OPTS.merge(opts)
    range = opts.fetch(:range)
    rules = opts.fetch(:rules)

    range.each do |number|
      puts fizz_buzz(number, rules)
    end
  end
end

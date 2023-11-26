# FizzBuzz [![Ruby](https://github.com/PragTob/fizz_buzz/actions/workflows/main.yml/badge.svg)](https://github.com/PragTob/fizz_buzz/actions/workflows/main.yml)

A solution to [FizzBuzz](https://wiki.c2.com/?FizzBuzzTest) in multiple steps with some extensions. For fun and profit.

> Write a program that prints the numbers from 1 to 100. But for multiples of three print “Fizz” instead of the number and for the multiples of five print “Buzz”. For numbers which are multiples of both three and five print “FizzBuzz”.

## Setup

For used software versions see `.tool-versions`

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake` to check your code (tests and linting). You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Decisions

This is not the default FizzBuzz implementation you should be aiming for. For that check out something like the ]`basic` tag](https://github.com/PragTob/fizz_buzz/tree/basic).

This solution is for when we have the following requirements/uncertainties:

* both the output text and the numbers that trigger them we are unsure about (maybe 4 instead of 3, maybe "Zazz")
* we must also be able to support more than 2 rules, or even fewer (if divisible by 7 print out "Zazz")
* the range must also be adjustable

This is a solution for that.

* The `Rule` class felt applicable, the idea here is that you can configure multiple rules and even run multiple different interpretations of FizzBuzz as none of these are global. That said, it could have easily been represented by just data or data and lambdas. Naming it as a concept in an object felt right for Ruby.
* The `Rule` class encodes the understanding that it is always about being divisible by a single number, that might not always what's up. Providing a lambda instead that takes the number as an argument to return `true` or `false` if it is applicable is more flexible but also more complex.
* The rule configuration specifically allows duplication of rules and the order determines output order, which seems like a neat feature.
* The whole `Rule` system makes another property of FizzBuzz apparent that is missing from most implementations: It _does not really matter if a number is divisible by both_, if the number is divisible by 3 then "Fizz" is added, if it is divisible by 5 then "Buzz" is and there is some order to the 2. You don't really need a special rule to handle the case for "both" (which would get hard quickly if you had 3+ rules)
* Theoretically you could also dependency inject some form of io instead of using bare `puts`, but `puts` is already isolated and contained to a single line so it'd be easy to replace. Also, since testing console output is easy and done for integration purposes anyhow, no huge benefits would arise from it immedeatly. Unless you had a requirement to need to send it out to console AND put it on an FTP server of course.
* I always love having a single `fizz_buzz` function that gets a single number and returns the appropriate output. Makes testing it such a breeze.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the FizzBuzz project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/fizz_buzz/blob/main/CODE_OF_CONDUCT.md).

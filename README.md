# FuelCalculator

NASA Fuel Calculator: Application and CLI to calculate the fuel required for the flight.

## Installation

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` or `bundle exec rspec` to run the tests.

## Interactive prompt

Run `bin/console` for an interactive prompt that will allow you to experiment:

~~~rb
FuelCalculator.call(28801, [[:launch, "earth"], [:land, "moon"], [:launch, "moon"], [:land, "earth"]])
#=> 51898
FuelCalculator.call(28801, [[:launch, "earth"], [:launch, "moon"], [:land, "earth"]])
#=> raises Invalid path (FuelCalculator::ValidationError)
~~~

## CLI Installation

To install this gem onto your local machine, run `bundle exec rake install` and reopen the shell.

## CLI Usage

The CLI interface is simplified. The user specifies a list of planets, and the program plans an appropriate launch/land path for the mission and calculates the amount of fuel.

    $ fuel_calculator 28801 earth moon earth
    51898

## Install <abbr title="Bash Automated Testing System">BATS</abbr> for CLI testing

https://bats-core.readthedocs.io/en/stable/installation.html

## Run <abbr title="Bash Automated Testing System">BATS</abbr> tests

    $ bats test

## Uninstall CLI

    $ gem uninstall fuel_calculator

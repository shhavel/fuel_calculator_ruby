# FuelCalculator

NASA Fuel Calculator: Application and CLI to calculate the fuel required for the flight.

## Installation

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` or `bundle exec rspec` to run the tests.

## Interactive prompt

Run `bin/console` for an interactive prompt that will allow you to experiment:

~~~rb
irb(main):001> FuelCalculator.call(28801, [[:launch, "earth"], [:land, "moon"], [:launch, "moon"], [:land, "earth"]])
=> 51898
irb(main):002> FuelCalculator.call(28801, [[:launch, "earth"], [:launch, "moon"], [:land, "earth"]])
# raises Invalid path (FuelCalculator::ValidationError)
~~~

## Mission Path Requirements

The mission should start with launching and end with landing, — we should not leave the ship without fuel in the space. The path must be consistent: the launch of a ship from a planet must be immediately preceded by a landing on the same planet, for all planets on the path except the first. Landing of a ship on a planet must be immediately preceded by a launch from any planet, which may or may not be another planet.

## CLI Installation

To install this gem onto your local machine, run `bundle exec rake install` and reopen the shell.

## CLI Usage

The CLI interface is simplified. The user specifies a mass of the ship (including equipment) and a list of planets, and the program plans an appropriate launch/land path for the mission and calculates the amount of fuel.

    $ fuel_calculator 28801 earth moon earth
    51898

## Install <abbr title="Bash Automated Testing System">BATS</abbr> for CLI testing

https://bats-core.readthedocs.io/en/stable/installation.html

## Run <abbr title="Bash Automated Testing System">BATS</abbr> tests

    $ bats test

## Uninstall CLI

    $ gem uninstall fuel_calculator

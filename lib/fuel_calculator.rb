# frozen_string_literal: true

require_relative "fuel_calculator/version"

module FuelCalculator
  class ValidationError < StandardError; end
  GRAVITY = {"earth" => 9.807, "moon" => 1.62, "mars" => 3.711}.freeze

  def self.call(mass, path)
    validate_mission!(mass, path)
    path.reverse_each.reduce(0) do |fuel, (dir, planet)|
      fuel + dir_fuel(dir, mass + fuel, GRAVITY[planet])
    end
  end

  def self.validate_mission!(mass, path)
    raise ValidationError, "Invalid mass" unless mass.is_a?(Numeric) && mass.positive?
    raise ValidationError, "Invalid path" unless path.is_a?(Array) && path.all? { |pair| pair.is_a?(Array) && pair.size == 2 }
    raise ValidationError, "Unknown planet" unless path.all? { |_, planet| GRAVITY.key?(planet) }
    raise ValidationError, "Invalid path" unless path.any? && path[0][0] == :launch && path[-1][0] == :land
    raise ValidationError, "Invalid path" unless path.each_cons(2).all? do |(d1, p1), (d2, p2)|
      (d1 == :launch) ? d2 == :land : d2 == :launch && p1 == p2
    end
  end

  def self.dir_fuel(dir, mass, gravity)
    (dir == :launch) ? launch_fuel(mass, gravity) : landing_fuel(mass, gravity)
  end

  def self.launch_fuel(mass, gravity)
    return 0 unless mass.positive?
    [(mass * gravity * 0.042 - 33).to_i, 0].max.then { |y| y + launch_fuel(y, gravity) }
  end

  def self.landing_fuel(mass, gravity)
    return 0 unless mass.positive?
    [(mass * gravity * 0.033 - 42).to_i, 0].max.then { |y| y + landing_fuel(y, gravity) }
  end

  private_class_method :validate_mission!, :dir_fuel, :launch_fuel, :landing_fuel
end

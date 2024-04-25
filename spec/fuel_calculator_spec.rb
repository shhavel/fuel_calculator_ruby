# frozen_string_literal: true

RSpec.describe FuelCalculator do
  context "Apollo 11" do
    let(:mass) { 28801 }
    let(:path) { [[:launch, "earth"], [:land, "moon"], [:launch, "moon"], [:land, "earth"]] }

    it "calculates the fuel required for the journey" do
      expect(FuelCalculator.call(mass, path)).to eq(51898)
    end
  end

  context "Mission on Mars" do
    let(:mass) { 14606 }
    let(:path) { [[:launch, "earth"], [:land, "mars"], [:launch, "mars"], [:land, "earth"]] }

    it "calculates the fuel required for the journey" do
      expect(FuelCalculator.call(mass, path)).to eq(33388)
    end
  end

  context "Passenger ship" do
    let(:mass) { 75432 }
    let(:path) { [[:launch, "earth"], [:land, "moon"], [:launch, "moon"], [:land, "mars"], [:launch, "mars"], [:land, "earth"]] }

    it "calculates the fuel required for the journey" do
      expect(FuelCalculator.call(mass, path)).to eq(212161)
    end
  end
end

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

  context "Invalid arguments" do
    context "invalid mass" do
      it "raises exception" do
        expect { FuelCalculator.call("str", [[:launch, "earth"], [:land, "mars"], [:launch, "mars"], [:land, "earth"]]) }.to raise_error FuelCalculator::ValidationError, "Invalid mass"
      end
    end

    context "invalid path" do
      it "raises exception" do
        expect { FuelCalculator.call(75432, [[:launch, "earth"], [:launch, "moon"], [:land, "mars"]]) }.to raise_error FuelCalculator::ValidationError, "Invalid path"
        expect { FuelCalculator.call(75432, [[:launch, "earth"], [:land, "moon"], [:launch, "mars"], [:land, "earth"]]) }.to raise_error FuelCalculator::ValidationError, "Invalid path"
        expect { FuelCalculator.call(75432, [[:land, "earth"], [:launch, "earth"], [:land, "earth"]]) }.to raise_error FuelCalculator::ValidationError, "Invalid path"
        expect { FuelCalculator.call(75432, [[:land, "earth"], [:land, "moon"], [:launch, "moon"]]) }.to raise_error FuelCalculator::ValidationError, "Invalid path"
      end
    end

    context "unknown planet" do
      it "raises exception" do
        expect { FuelCalculator.call(28801, [[:launch, "earth"], [:land, "saturn"], [:launch, "saturn"], [:land, "earth"]]) }.to raise_error FuelCalculator::ValidationError, "Unknown planet"
      end
    end
  end
end

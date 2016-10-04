require 'journey'
require 'oystercard'

describe Journey do

  subject (:journey) {Journey.new("old street")}
  let (:exit_station) { double :exit_station }

  context "in journey tests" do


    it "Should not be in journey once completed" do
      journey.start("old street")
      journey.end(exit_station)
      expect(journey.complete). to eq true
    end

    it "should deduct penalty fare if they fail to touch out" do
      card = double("card", :balance => 10)
      journey.start("old street")
      journey.start("clapham")
      expect{journey.penalty}.to change{card.balance}.by(-Journey::PENALTY_FAIR)
    end

  end

  context "storing journeys" do

    it "should store entry station in journey" do
      expect(journey.start("old street")).to eq("old street")
    end

    it "should store exit station" do
      journey.start("old street")
      expect(journey.end(exit_station)).to eq (["old street", exit_station])
    end

    it "should store history of journeys" do
      journey.start("old street")
      journey.end("camden")
      expect(journey.journey_log).to include(1 => ["old street", "camden"])
    end

  end

  end

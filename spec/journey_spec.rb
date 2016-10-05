require 'journey'
require 'oystercard'

describe Journey do

  subject (:journey) {Journey.new}
  let (:entry_station) { double :entry_station }
  let (:exit_station) { double :exit_station }

  context "in journey tests" do

    it "should store start station" do
      journey.start_station(entry_station)
      expect(journey.start).to eq entry_station
    end

    it "should store exit station" do
      journey.finish_station(exit_station)
      expect(journey.finish).to eq exit_station
    end
  end

  context "complete and incomplete journeys" do

    before do
      journey.start_station(entry_station)
    end

    it "should return true if complete journey" do
      journey.finish_station(exit_station)
      expect(journey).to be_complete
    end

    it "should return false if incomplete journey" do
      expect(journey).not_to be_complete
    end

  end

  end

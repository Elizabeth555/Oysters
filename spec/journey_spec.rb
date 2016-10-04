require 'journey'
require 'oystercard'

describe Journey do

  subject (:journey) {Journey.new}

  let (:station) { double :station }

  context "in journey tests" do

    it "should tell us if card is in journey " do
      expect(station.in_journey?). to eq false
    end

    it "Should not be in journey once completed" do
      card =  Oystercard.new
      card.touch_in(:station)
      card.touch_out(:station)
      expect(journey.completed). to eq true
    end

  end

  context "storing journeys" do

    it "should store entry station in journey" do
      card =  Oystercard.new
      card.touch_in(station)
      expect(journey.start(station)).to eq(station)
    end

    it "should store exit station" do
      card =  Oystercard.new
      card.touch_in(station)
      card.touch_out(station)
      expect(journey.finish(station)).to eq ([station, station])
    end

    it "should store history of journeys" do
      card =  Oystercard.new
      card.touch_in(station)
      card.touch_out(station)
      expect(journey.journey_log).to include(1 => [station, station])
    end

  end

  end

require_relative 'oystercard'

class Journey
   attr_reader :complete

   PENALTY_FAIR = 5

  def initialize(entry_station)
    @entry_station = entry_station
    @history = {}
    @journey = []
    @journeys = []
  end

def start
  penalty if @complete == false
  @journey.clear
  @journey << @entry_station
  @complete = false
  @entry_station
end

def end(exit_station)
  @journey << exit_station
  journey_log
  @complete = true
  @journey
end

def fare
  return PENALTY_FAIR if @complete == false
  
end

def complete
  @complete
end

def journey_log
  @journeys << @journey.dup
  @history = Hash[@journeys.map.with_index(1) {|x, i| [i,x]}]
end
end

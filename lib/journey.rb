class Journey
   attr_reader :complete
  def initialize(entry_station)
    @entry_station = entry_station
    @history = {}
    @journey = []
    @journeys = []
  end

def start(entry_station)
  @journey.clear
  @journey << entry_station
  @complete = false
  entry_station
end

def end(exit_station)
  @journey << exit_station
  journey_log
  @complete=true
  @journey

end

def journey_log
  @journeys << @journey.dup
  @history = Hash[@journeys.map.with_index(1) {|x, i| [i,x]}]
end


end

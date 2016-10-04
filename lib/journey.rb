class Journey

  def initialize(entry_station)
    @entry_station = entry_station
    @history = {}
    @journey = []
    @journeys = []
  end

def start(entry_station)
  @journey << entry_station
  @complete = false
end

def end(exit_station)
  @journey << exit_station
  write_history
  @journey.clear
  @complete=true
end

def write_history
  @journeys << @journey.dup
  @history = Hash[@journeys.map.with_index(1) {|x, i| [i,x]}]
end

 
end

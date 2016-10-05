class Journey
   attr_reader :start, :finish

   PENALTY_FAIR = 5
   MINIMUM_FAIR = 1

  def start_station(station)
    @start = station
  end

  def finish_station(station)
    @finish = station
  end


  def fare
     return PENALTY_FAIR if !complete?
     MINIMUM_FAIR
  end

  def complete?
    start != nil && finish != nil
  end

end

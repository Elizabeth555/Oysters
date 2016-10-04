class Oystercard
  attr_reader :balance, :in_journey, :history, :journey

  Balance_limit = 90
  Minimum_fair = 1

  def initialize
    @balance = 0
    @in_journey = false
    @history = {}
    @journey = []
    @journeys = []
  end

  def top_up(amount)
    raise "Balance limit exceeded" if @balance + amount > Balance_limit
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficant funds" if @balance < Minimum_fair
    @in_journey = true
    @journey << station
    station
  end

  def touch_out(station)
    @in_journey = false
    deduct(Minimum_fair)
    @journey << station
    @journeys << @journey.dup
    station
    @journey.clear
    write_history
  end

  def write_history
    @history = Hash[@journeys.map.with_index(1) {|x, i| [i,x]}]
  end

  private
  def deduct(amount)
    @balance -= amount
  end
end

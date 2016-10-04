class Oystercard
  attr_reader :balance, :history, :journey

  Balance_limit = 90
  Minimum_fair = 1

  def initialize
    @balance = 0
    @entry_station
    @history = {}
    @journey = []
    @journeys = []
  end

  def top_up(amount)
    raise "Balance limit exceeded" if @balance + amount > Balance_limit
    @balance += amount
  end

  def in_journey?
    @journey.any?
  end

  def touch_in(entry_station)
    raise "Insufficant funds" if @balance < Minimum_fair
    @journey << entry_station
    entry_station
  end

  def touch_out(exit_station)
    deduct(Minimum_fair)
    @journey << exit_station
    write_history
    @journey.clear
  end

private
  def write_history
    @journeys << @journey.dup
    @history = Hash[@journeys.map.with_index(1) {|x, i| [i,x]}]
  end

  def deduct(amount)
    @balance -= amount
  end
end

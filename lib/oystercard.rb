require_relative 'journey'

class Oystercard
  attr_reader :history, :journey
  attr_accessor :balance, :name

  Balance_limit = 90
  Minimum_fair = 1

  def initialize
    @balance = 0
    @journey = Journey.new
    @journeys = []
  end

  def top_up(amount)
    raise "Balance limit exceeded" if @balance + amount > Balance_limit
    @balance += amount
  end

  def touch_in(entry_station)
    raise "Insufficant funds" if @balance < Minimum_fair
    @journey.start(entry_station)
  end

  def touch_out(exit_station)
    deduct(Minimum_fair)
    @journey.end(exit_station)
  end

  def journey_log
    @journeys << @journey.dup
    @history = Hash[@journeys.map.with_index(1) {|x, i| [i,x]}]
  end

private

  def deduct(amount)
    @balance -= amount
  end
end

require_relative 'journey'

class Oystercard
  attr_reader :journey
  attr_accessor :balance, :name, :log, :history

  Balance_limit = 90
  Minimum_fair = 1

  def initialize
    @balance = 0
    @journey = Journey.new
    @history = []
    @log = {}

  end

  def top_up(amount)
    raise "Balance limit exceeded" if @balance + amount > Balance_limit
    @balance += amount
  end

  def in_journey?
    @journey.start != nil
  end

  def touch_in(entry_station)
    raise "Insufficant funds" if @balance < Minimum_fair
    deduct(journey.fare) if @journey.start != nil
    @journey.start_station(entry_station)
  end

  def touch_out(exit_station)
    @journey.finish_station(exit_station)
    deduct(journey.fare)
    journey_log
    @journey = Journey.new
  end

  def journey_log
  @history << @journey.dup
  @log = Hash[history.map.with_index(1){ |hash, key| [key,hash]} ]
  end

private

  def deduct(amount)
    @balance -= amount
  end
end

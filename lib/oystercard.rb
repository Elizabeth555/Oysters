require_relative 'journey'

class Oystercard
  attr_reader :history, :journey
  attr_accessor :balance, :name

  Balance_limit = 90
  Minimum_fair = 1

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Balance limit exceeded" if @balance + amount > Balance_limit
    @balance += amount
  end

  def touch_in(entry_station)
    raise "Insufficant funds" if @balance < Minimum_fair
    @journey = Journey.new(entry_station)
    @journey.start
  end

  def touch_out(exit_station)
    deduct(Minimum_fair)
    @journey.end(exit_station)
  end

private

  def deduct(amount)
    @balance -= amount
  end
end

require_relative "bike"
class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'there are no bikes' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'station is full' if full?
    @bikes.push(bike)
  end

  private
  def full?
    @bikes.length >= 20 ? true : false
  end

  def empty?
    @bikes.empty? ? true : false
  end
end 
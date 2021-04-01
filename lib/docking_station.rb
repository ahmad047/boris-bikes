require_relative "bike"
class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'there are no bikes' if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'station is full' if @bikes.length >= 20
    @bikes.push(bike)
  end
end 
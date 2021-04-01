require "docking_station"

describe DockingStation do
  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }
    it "releases working bikes" do
      bike = Bike.new
      expect(bike).to be_working
    end
    it 'return an error if there are no bikes' do
      @bikes = []
      expect { subject.release_bike }.to raise_error 'there are no bikes'
    end
  end

  describe '#docking' do
    it { is_expected.to respond_to :dock }
    it 'docks a bike to the station' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq([bike])
    end
    it 'return an error if docking station is full' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new) }.to raise_error 'station is full'
    end
  end 
end
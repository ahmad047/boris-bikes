require "docking_station"

describe DockingStation do
  
  describe '#capacity' do
    it 'checks the default capacity is equal to 20' do
      expect(subject.capacity).to eq(20)
    end
  end

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
      subject.capacity.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new) }.to raise_error 'station is full'
    end
  end 
end
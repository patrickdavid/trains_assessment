require 'spec_helper'

describe 'Stations' do
  it 'Initializes the Stations class' do
    test_station = Stations.new({'name' => "Vienna/GMU"})
    expect(test_station).to be_an_instance_of Stations
  end
  
  it 'saves stations into our stations database' do
    test_station = Stations.new({'name' => "Vienna/GMU"})
    test_station.save
    expect(Stations.all).to eq [test_station]
  end
  
  it 'updates name for line' do
    test_line = Lines.new({'name' => "Orange"})
    test_line.save
    test_line.change_name('Gold')
    expect(test_line.name).to eq 'Gold'
  end
  
  it 'deletes a station name' do
    test_station = Stations.new({'name' => "Vienna/GMU"})
    test_station.save
    test_station1 = Stations.new({'name' => "Dunn Loring"})
    test_station1.save
    Stations.delete(test_station)
    expect(Stations.all).to eq [test_station1]
  end
end
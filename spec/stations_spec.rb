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
  
  it 'deletes a station' do
    test_station = Stations.new({'name' => "Vienna/GMU"})
    test_station.save
    test_station1 = Stations.new({'name' => "Dunn Loring"})
    test_station1.save
    name = test_station.name
    Stations.delete(name)
    expect(Stations.all).to eq [test_station1]
  end
  
  it 'lists all lines that a station has' do
    test_line = Lines.new({'name' => "Orange"})
    test_line.save
    test_station = Stations.new({'name' => "Metro Center"})
    test_station.save
    test_stop = Stops.new({'station_id' => test_station.id, 'line_id' => test_line.id})
    test_stop.save
    test_line1 = Lines.new({'name' => "Red"})
    test_line1.save
    test_stop1 = Stops.new({'station_id' => test_station.id, 'line_id' => test_line1.id})
    test_stop1.save
    expect(test_station.lines).to eq [test_line, test_line1]
  end
end
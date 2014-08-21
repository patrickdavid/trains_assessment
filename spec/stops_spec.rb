require 'spec_helper'

describe 'Stops' do
  it 'instantiates a stop with id, line_id and station_id' do
    test_line = Lines.new({'name' => "Orange"})
    test_line.save
    test_station = Stations.new({'name' => "Vienna/GMU"})
    test_station.save
    test_stop = Stops.new({'station_id' => test_station.id, 'line_id' => test_line.id})
    expect(test_stop).to be_an_instance_of Stops
  end
  
  it 'saves stops into our stop database' do
    test_line = Lines.new({'name' => "Orange"})
    test_line.save
    test_station = Stations.new({'name' => "Vienna/GMU"})
    test_station.save
    test_stop = Stops.new({'station_id' => test_station.id, 'line_id' => test_line.id})
    test_stop.save
    expect(Stops.all).to eq [test_stop]
  end
  
end
require 'spec_helper'

describe 'Stops' do
  it 'instantiates a stop with id, line_id and station_id' do
    test_line = Lines.new({'name' => "Orange"})
    test_station = Stations.new({'name' => "Vienna/GMU"})
    test_stop = Stops.new({'line_id' => test_line.id, 'station_id' => test_station.id})
    expect(test_stop).to be_an_instance_of Stops
  end
end
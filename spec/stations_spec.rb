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
end
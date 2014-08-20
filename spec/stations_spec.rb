require 'spec_helper'

describe 'Stations' do
  it 'Initializes the Stations class' do
    test_station = Stations.new({:name => "Vienna/GMU"})
    expect(test_station).to be_an_instance_of Stations
  end
end
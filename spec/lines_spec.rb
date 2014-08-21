require 'spec_helper'

describe 'Lines' do
  it 'Initializes the Lines class' do
    test_line = Lines.new({'name' => "Orange"})
    expect(test_line).to be_an_instance_of Lines
  end
  
  it 'saves lines into our lines table' do
    test_line = Lines.new({'name' => "Orange"})
    test_line.save
    expect(Lines.all).to eq [test_line]
  end
  
  it 'updates name for line' do
    test_line = Lines.new({'name' => "Orange"})
    test_line.save
    test_line.change_name('Gold')
    expect(test_line.name).to eq 'Gold'
  end
  
  it 'deletes a line' do
    test_line = Lines.new({'name' => "Orange"})
    test_line.save
    test_line1 = Lines.new({'name' => "Silver"})
    test_line1.save
    name = test_line.name
    Lines.delete(name)
    expect(Lines.all).to eq [test_line1]
  end
  
  it 'lists all stations that a line has' do
    test_line = Lines.new({'name' => "Orange"})
    test_line.save
    test_station = Stations.new({'name' => "Metro Center"})
    test_station.save
    test_station1 = Stations.new({'name' => "Vienna"})
    test_station1.save
    test_stop = Stops.new({'station_id' => test_station.id, 'line_id' => test_line.id})
    test_stop.save
    test_stop1 = Stops.new({'station_id' => test_station1.id, 'line_id' => test_line.id})
    test_stop1.save
    expect(test_line.stations).to eq [test_station, test_station1]
  end
end
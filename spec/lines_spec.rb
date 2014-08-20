require 'spec_helper'

describe 'Lines' do
  it 'Initializes the Lines class' do
    test_line = Lines.new({'name' => "Orange"})
    expect(test_line).to be_an_instance_of Lines
  end
  
  it 'saves stations into our stations table' do
    test_line = Lines.new({'name' => "Orange"})
    test_line.save
    expect(Lines.all).to eq [test_line]
  end
  
  it 'deletes a line' do
    test_line = Lines.new({'name' => "Orange"})
    test_line.save
    test_line1 = Lines.new({'name' => "Silver"})
    test_line1.save
    Lines.delete(test_line)
    expect(Lines.all).to eq [test_line1]
  end
end
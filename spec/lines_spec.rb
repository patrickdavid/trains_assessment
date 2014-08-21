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
end
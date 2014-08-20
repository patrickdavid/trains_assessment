require 'rspec'
require 'stations'
require 'lines'
require 'pg'

DB = PG.connect(:dbname => 'trains_test')
RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stations *;")
    DB.exec("DELETE FROM lines *;")
  end
end
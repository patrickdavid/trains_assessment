require 'rspec'
require 'stations'
require 'lines'
require 'stops'
require 'pg'


DB = PG.connect(:dbname => 'trains_test')
RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stations *;")
    DB.exec("DELETE FROM lines *;")
    DB.exec("DELETE FROM stops *;")
  end
end
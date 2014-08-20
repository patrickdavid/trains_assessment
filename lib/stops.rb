class Stops

  attr_accessor :station_id, :line_id, :id

  def initialize(attributes)
    @station_id = attributes['station_id']
    @line_id = attributes['line_id']
    @id = attributes['id']
  end
  
  def self.all
    results = DB.exec("SELECT * FROM stops;")
    stops = []
    results.each do |result|
      puts result    
      id = result['id'].to_i
      station_id = result['stations_id'].to_i
      line_id = result['lines_id'].to_i
      stops << Stops.new({'id' => id, 'station_id' => station_id, 'line_id' => line_id})
    end
    stops
  end
  
  def ==(another_stop)
    self.station_id == another_stop.station_id && self.line_id == another_stop.line_id
  end
  
   def save
    results = DB.exec("INSERT INTO stops (stations_id, lines_id) VALUES (#{@station_id}, #{@line_id}) RETURNING id;")
    @id = results.first['id'].to_i
  end
end
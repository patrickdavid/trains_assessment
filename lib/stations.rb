class Stations
  
  attr_accessor :name, :id
  
  def initialize(attributes)
    @name = attributes['name']
    @id = attributes['id']
  end
  
  def self.all
    results = DB.exec("SELECT * FROM stations;")
    @stations = []
    results.each do |result|
      name = result['name']
      id = result['id'].to_i
      @stations << Stations.new({'name' => name, 'id' => id})
    end
    @stations
  end
  
  def save
    @id = DB.exec("INSERT INTO stations (name) VALUES ('#{@name}') RETURNING id;").first['id'].to_i
  end
  
  def ==(another_station)
    self.name == another_station.name
  end
  
  
end
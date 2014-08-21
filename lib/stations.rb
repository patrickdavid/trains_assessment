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
    results = DB.exec("INSERT INTO stations (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end
  
  def ==(another_station)
    self.name == another_station.name
  end
  
  def self.delete(input_station)
    Stations.all.each do |station|
      if input_station == station.name
        DB.exec("DELETE FROM stations WHERE name = '#{input_station}';")
      end
    end
  end
  
  def change_name(revised_name)
    DB.exec("UPDATE lines SET name = '#{revised_name}' WHERE id = #{@id};")
    @name = revised_name
  end
end
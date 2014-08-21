class Lines
  
  attr_accessor :name, :id
  
  def initialize(attributes)
    @name = attributes['name']
    @id = attributes['id']
  end
  
  def self.all
    results = DB.exec("SELECT * FROM lines;")
    @lines = []
    results.each do |result|
      name = result['name']
      id = result['id'].to_i
      @lines << Lines.new({'name' => name, 'id' => id})
    end
    @lines
  end
  
  def self.delete(input_line)
    Lines.all.each do |line|
      if input_line == line.name
        DB.exec("DELETE FROM lines WHERE name = '#{input_line}';")
      end
    end
  end
  
  def save
    results = DB.exec("INSERT INTO lines (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end
  
  def ==(another_line)
    self.name == another_line.name
  end
  
  def change_name(revised_name)
    DB.exec("UPDATE stations SET name = '#{revised_name}' WHERE id = #{@id};")
    @name = revised_name
  end
  
  def stations
    results = DB.exec("SELECT stations.* FROM lines JOIN stops on (lines.id = stops.lines_id) JOIN stations on (stops.stations_id = stations.id) WHERE lines.id = #{@id};")
    stations = []
    results.each do |result|
      id = result['id']
      name = result['name']
      stations << Lines.new({'id'=>id, 'name' => name})
    end
    stations
  end
end
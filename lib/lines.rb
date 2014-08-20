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
      @lines << Stations.new({'name' => name, 'id' => id})
    end
    @lines
  end
  
  def self.delete(input_line)
    Lines.all.each do |line|
      if input_line == line
        DB.exec("DELETE FROM lines WHERE id = #{input_line.id};")
      end
    end
  end
  
  def save
    @id = DB.exec("INSERT INTO lines (name) VALUES ('#{@name}') RETURNING id;").first['id'].to_i
  end
  
  def ==(another_line)
    self.name == another_line.name
  end
  
  def change_name(revised_name)
    DB.exec("UPDATE stations SET name = '#{revised_name}' WHERE id = #{@id};")
    @name = revised_name
  end  
end
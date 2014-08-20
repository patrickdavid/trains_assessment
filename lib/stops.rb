class Stops

  attr_accessor :station_id, :line_id, :id

  def initialize(attributes)
    @station_id = attributes['station_id']
    @line_id = attributes['line_id']
    @id = attributes['id']
  end
end
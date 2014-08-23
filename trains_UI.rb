require 'pg'
require './lib/lines.rb'
require './lib/stops.rb'
require './lib/stations.rb'

DB = PG.connect({:dbname => 'trains_test'})

def main_menu
  loop do
    puts "Press 'o' if you are a train operator"
    puts "Press 'c' if you are a commuter"
    puts "Press 'x' to exit"

    menu_choice = gets.chomp.downcase

    if menu_choice == 'o'
      operator_menu
    elsif menu_choice == 'c'
      commuter_menu
    elsif menu_choice == 'x'
      puts "Good-bye!"
      exit
    else
      puts "The option you entered is not a valid option.  Please choose again."
      main_menu
    end
  end
end

def operator_menu
  loop do
    puts "Press 'l' to list all lines"
    puts "Press 's' to list all stations"
    puts "press 'ss' to add a stop"
    puts "Press 'al' to add a line"
    puts "Press 'as' to add a station"
    puts "Press 'rl' to remove a line"
    puts "Press 'rs' to remove a station"
    puts "Press 'ls' to list all stations of a specific line"
    puts "Press 'll' to list all lines of a specific station"
    puts "Press 'm' to return to main menu"

    menu_choice = gets.chomp.downcase

    if menu_choice == 'l'
      list_lines
    elsif menu_choice == 's'
      list_stations
    elsif menu_choice == 'ss'
      add_stop
    elsif menu_choice == 'al'
      add_line
    elsif menu_choice == 'as'
      add_station
    elsif menu_choice == 'rl'
      remove_line
    elsif menu_choice == 'rs'
      remove_station
    elsif menu_choice == 'ls'
      list_stations_of_line
    elsif menu_choice == 'll'
      list_lines_of_station
    elsif menu_choice == 'm'
      main_menu
    else
      puts "Did not understand entry.  Please enter a valid option."
    end
  end
end


def commuter_menu
  loop do
    puts "Press 'l' to list all lines"
    puts "Press 's' to list all stations"
    puts "Press 'ls' to list all stations of a specific line"
    puts "Press 'll' to list all lines of a specific station"
    puts "Press 'm' to return to main menu"

    menu_choice = gets.chomp.downcase

     if menu_choice == 'l'
      list_lines
    elsif menu_choice == 's'
      list_stations
    elsif menu_choice == 'ls'
      list_stations_of_line
    elsif menu_choice == 'll'
      list_lines_of_station
    elsif menu_choice == 'm'
      main_menu
    else
      puts "Did not understand entry.  Please enter a valid option."
    end
  end
end

def list_lines
  Lines.all.each do |line|
    puts line.name
  end
end

def list_stations
  Stations.all.each do |station|
    puts station.name
  end
end

def add_station
  puts "Please enter the name of the station."
  name = gets.chomp
  new_station = Stations.new({'name' => name})
  new_station.save
  puts "The station has been added."
end

def add_line
  puts "Please enter the name of the line."
  name = gets.chomp
  new_line = Lines.new({'name' => name})
  new_line.save
  puts "The line has been added."
end

def add_stop
  puts "Please enter the name of the station."
  station_name = gets.chomp
  new_station = Stations.new({'name' => station_name})
  new_station.save
  puts "The station has been added."
  puts "\n\n\n\n"
  puts "Please enter the name of the line."
  line_name = gets.chomp
  new_line = Lines.new({'name' => line_name})
  new_line.save
  puts "The line has been added."
  new_stop = Stops.new({'station_id' => new_station.id, 'line_id' => new_line.id})
  new_stop.save
  puts "\n\n\n"
  puts "The stop has been saved"
end

def remove_station
  puts "Which station would you like to remove"
  input_station = gets.chomp
  Stations.delete(input_station)
  puts "Station removed"
end

def remove_line
  puts "Which line would you like to remove"
  input_line = gets.chomp
  Lines.delete(input_line)
  puts "Line removed"
end

def list_stations_of_line
  puts "Which line would you like to see the stations for?"
  result = ''
  input_line = gets.chomp
  puts "Here are all the stations for that particular line"
  Lines.all.each do |line|
    if input_line == line.name
      result = line
    end
    stats = result.stations
    stats.each do |stat|
      puts stat.name
    end
  end
end

def list_lines_of_station
  puts "Enter the station name to see which lines stop here."
  result = ''
  result1 = ''
  input_station = gets.chomp
  puts "Here are all the lines for that particular station"
  Stations.all.each do |station|
    if input_station == station.name
      result = station
    end
    line = result.lines
    line.each do |lin|
      puts lin.name
    end
  end
end


main_menu
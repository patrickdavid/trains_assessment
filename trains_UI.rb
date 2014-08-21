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
    puts "Press 'al' to add a line"
    puts "Press 'as' to add a station"
    puts "Press 'rl' to remove a line"
    puts "Press 'rs' to remove a station"
    puts "Press 'ls' to list all stations of a specific line"
    puts "Press 'll' to list all lines of a specific station"
    puts "Press 'ns' to change a name of a station"
    puts "Press 'nl' to change a name of a line"
    puts "Press 'm' to return to main menu"

    menu_choice = gets.chomp.downcase

    if menu_choice == 'l'
      list_lines
    elsif menu_choice == 's'
      list_stations
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
    elsif menu_choice == 'ns'
      new_station_name
    elsif menu_choice == 'nl'
      new_line_name
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

def remove_line
  
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


main_menu
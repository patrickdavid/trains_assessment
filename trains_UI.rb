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
    puts "Press 'al' to add line to station"
    puts "Press 'as' to add a staion to a line"
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

main_menu
require_relative 'app'

def main
  app = App.new
  app.run
end

def options_list(option)
  case option
  when 1
    list_book_display
  when 2
    list_people_display
  when 3
    create_person_display
  when 4
    create_book_display
  when 5
    create_rental_display
  when 6
    list_all_rental
  else
    puts 'Thanks for using the application'

  end
end

def display_menu
  puts 'Please choose an option by entering a number'
  puts '1 - List all books.'
  puts '2 - List all people.'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental.'
  puts '6 - List all rentals for a given person id.'
  puts '7 - Exit'
end

main

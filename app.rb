require_relative 'person'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book_rental'
require_relative 'create_student'



class App < CreateStudent
  attr_reader :books, :person

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  # List all books
  def list_book_display
    if @books.empty?
      puts 'The book list is empty. Create new book!'
    else
      @books.each_with_index do |book, index|
        puts "#{index}. Title: #{book.title} Author: #{book.author}"
      end
    end
  end

  # List all people
  def list_people_display
    if @people.empty?
      puts 'The people list is currently empty'
    else
      @people.each_with_index do |person, index|
        puts "#{index} = #{person.class} Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  # Create a book
  def create_book_display
    puts
    print 'Title: '
    title = gets.chomp.strip.capitalize
    puts
    print 'Author: '
    author = gets.chomp.strip.capitalize
    @books.push(Book.new(title, author))
    puts "Title: #{title} - Author: #{author}. Created successfully!"
  end

  # Create a person (teacher or student, not a plain Person)

  def create_person_display
    puts 'Do you want to create a student record or teacher record?'
    print 'Type 1 to create student or 2 to create teacher:'
    option = gets.chomp.strip.to_i
    case option
    when 1
      create_student
    when 2
      create_teacher
    end
  end

# create student


  
  

  # List all rentals for a given person id

  def list_all_rental
    puts 'Rentals List Generator'
    list_people_display
    print 'Enter person ID:=> '
    person_id = gets.chomp.to_i
    person_selected = @rentals.select { |rental| rental.person == person_id }
    puts "#{person_id} => Rentals Details."

    if person_selected.empty?
      puts "No rentals are found for #{person_id}"
    else
      person_selected.each do |rental|
        puts "Date: #{rental.date} =>> Book: #{rental.book}"
      end
    end
  end



  # The Run method

  def run
    puts 'run code start'
    selection = 0
    while selection != 7
      display_menu
      puts
      print 'Please choose an option by entering a number: '
      selection = gets.chomp.strip.to_i
      puts 'Goob Bye!!' if selection == 7
      options_list(selection)
      puts 'Press any key to continue....' if selection != 7
    end
  end
end

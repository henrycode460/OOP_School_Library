require_relative 'person'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
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

  def create_student
    puts 'Enter student information'
    print 'Name: '
    name = gets.chomp.strip.capitalize
    print 'Age: '
    age = gets.chomp.strip.to_i
    while age <= 0 || age >= 150
      print 'Please enter valid age in number between (1 - 100):'
      age = gets.chomp.strip.to_i
    end
    print 'Has parent permission? Enter [Y/N]: '
    permission = gets.chomp.strip.upcase
    case permission
    when 'Y'
      permission = true
    when 'N'
      permission = false
    end
    @people << Student.new(Random.rand(1...1000), age, nil, name, parent_permission: permission)
    puts 'Student created successfully!!!!!'
  end

  # create teacher
  def create_teacher
    puts 'Enter teacher\'s record'
    print 'Name: '
    name = gets.chomp.strip.capitalize
    puts
    print 'Specialization: '
    specialization = gets.chomp.strip.capitalize
    print 'Age: '
    age = gets.chomp.strip.to_i
    while age <= 0 || age >= 150
      print 'Please enter a valid age number between (1 - 100):'
      age = gets.chomp.strip.to_i
    end
    @people << Teacher.new(Random.rand(1..1000), age, specialization, name)
    puts 'Teachers record created successfully!!!!'
  end

  # Create a rental
  def create_rental_display # rubocop:disable Metrics/MethodLength
    puts 'New Book Rentals. Select a book from the list below by number'
    list_book_display
    print 'enter the number for the book you want to rent: '
    book_option = gets.chomp.to_i
    while book_option.negative? || book_option >= @books.length
      print "Please enter number between 0 - #{@books.length - 1} range: "
      book_option = gets.chomp.to_i
    end
    book = "#{@books[book_option].title} By #{@books[book_option].author}"
    puts 'Select a person from the following list by number (not ID)'
    list_people_display
    print 'Enter person number: '
    person_option = gets.chomp.to_i
    while person_option.negative? || person_option >= @people.length
      print "Please enter number only between 0 -#{@people.length - 1}: "
      person_option = gets.chomp.to_i
    end
    person = @people[person_option].id
    print 'Enter date of booking: (yyyy/mm/dd): '
    date = gets.chomp.strip
    @rentals << Rental.new(date, person, book)
    puts 'Book rental successful!!!!'
  end

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

class BookRental
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
    
end
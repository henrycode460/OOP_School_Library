module ChoiceMethods
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
    
end
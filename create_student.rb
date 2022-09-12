
class CreateStudent

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
    
end
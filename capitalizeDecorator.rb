require_relative 'baseDecorator'
require_relative 'person'
require_relative 'trimmerDecorator'

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

# person = Person.new(22, 'maximilianus')
#  puts person.correct_name
#   capitalizedPerson = CapitalizeDecorator.new(person)
#   puts capitalizedPerson.correct_name
#  capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
#   puts capitalizedTrimmedPerson.correct_name

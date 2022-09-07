require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(specialization, age, name, parent_permission)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    of_age? || @parent_permission ? true : false
  end
end

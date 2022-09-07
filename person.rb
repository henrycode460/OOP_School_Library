require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parental_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parental_permission = parental_permission
  end

  def can_use_services?
    of_age? || @parent_permission ? true : false
  end

  def correct_name
    puts @name
  end

  private

  def of_age?
    @age >= 18
  end
end

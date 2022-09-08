require_relative 'baseDecorator'
require_relative 'person'
require_relative 'trimmerDecorator'

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

require_relative 'baseDecorator'

class CapitalizeDecorator < BaseDecorator
  def correct_name
    puts @nameable.upcase
  end
end

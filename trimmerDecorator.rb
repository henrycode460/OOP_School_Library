require_relative 'baseDecorator'

class TrimmerDecorator < BaseDecorator
  def correct_name(length = 9)
    if @nameable.correct_name.length > length
      puts @nameable.to_s[0..length]

    else
      puts @nameable

    end
  end
end

require_relative 'baseDecorator'

class CapitalizeDecorator < BaseDecorator
    def class_name
       puts @nameable.upcase
    end
end



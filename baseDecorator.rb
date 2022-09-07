require_relative 'nameable'

class BaseDecorator < Nameable
    attr_accessor :nameable
    def initialize(nameable)
        @nameable = nameable
    end

    def correct_name
        puts @nameable
    end
end


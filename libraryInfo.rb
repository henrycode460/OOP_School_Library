class Person
    attr_reader :id, :name, :age
    attr_writer  :name, :age
    def initialize(id, name = nil, age, parent_permission = true)
        @id = id
        @name = name
        @age = age
        @parent_permission = parent_permission

        
    end
end
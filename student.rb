require_relative 'person';
# We implement Ineritance Concept here that's about child class inherits 
class Student < Person
# Accessors
attr_accessor :classroom
def initialize(name = "unknown", age, parent_permission:true, classroom)
super(name,age,parent_permission)
@classroom : classroom
end
def play_hooky
    ¯\(ツ)/¯
end
end
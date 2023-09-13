require_relative 'person';
# We implement Ineritance Concept here that's about subclass inherits superclass (methods and properties)
class Teacher < Person
# Accessors
attr_accessor :specialization
# Initialize Method
def initialize(name = "unknown", age, parent_permission:true, specialization)
# super keyword is used to call initialize method of Parent Class.
super(name,age,parent_permission)
@specialization = specialization
end
def can_use_services?
    true
end
end
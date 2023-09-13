require_relative 'person'
# We implement Ineritance Concept here that's about subclass inherits superclass (methods and properties)
class Student < Person
  # Accessors
  attr_accessor :classroom

  # Initialize Method
  def initialize(classroom, age, name = 'unknown', parent_permission: true)
    # super keyword is used to call initialize method of Parent Class.
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end

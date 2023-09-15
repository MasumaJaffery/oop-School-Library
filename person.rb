require_relative 'nameable'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

class Person < Nameable
  # Accessors Methods That used for getters and Setters in quick way!
  # attr_accessor works for getter and setter both purposes.
  attr_accessor :name, :age
  # attr_reader works for only getter purposr.
  attr_reader :id, :classroom

  # Initialize Method
  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
  end

  def correct_name
    @name
  end

  def classroom(classroom)
    @classroom = classroom
    classroom.add_student(self)
  end

  def add_new_rental(book, date)
    @rental << Rental.new(date, book, self)
  end
  
  # Private

  private

  def of_age?
    # age is greater or equal to 18
    @age >= 18
  end
  # Public

  public

  def can_use_services?
    # We implement Encapsulation Method too use private method of_age? inside public method can_use_services?
    # Encapsulation goal is hiding internal info of object and provides
    # controlled interface to control upon confidential info for secure object direct info useage.
    # if person is of age or if they have permission from parents
    of_age? || @parent_permission
  end
end

# Did You that Person Class plays an role oof polymorphism, A Person can be student and also a teacher.

# Create a Person object
person = Person.new(22, 'maximilianus')

# Create a CapitalizeDecorator and wrap the person
capitalized_person = CapitalizeDecorator.new(person)

# Create a TrimmerDecorator and wrap the capitalized person
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)

# Use the decorated object
puts capitalized_trimmed_person.correct_name

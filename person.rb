class Person
# Accessors Methods That used for getters and Setters in quick way!
# attr_accessor works for getter and setter both purposes.
attr_accessor :name, :age
# attr_reader works for only getter purposr.
attr_reader :id
# Initialize Method
def initialize(name = "unknown", age, parent_permission: true)
@id = Random.rand(1..100)
@name = name
@age = age
@parent_permission = parent_permission
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
# Encapsulation goal is hiding internal info of object and provides ccontrolled interface to control upon confidential info for secure object direct info useage.
# if person is of age or if they have permission from parents    
of_age? || @parent_permission
end
end
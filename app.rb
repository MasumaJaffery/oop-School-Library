require_relative 'person'
require_relative 'student'
require_relative 'classroom'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
def initialize
 @people = []
 @book = []
 @rental = []
end

def run
  main_menu
  options = gets.chomp.to_i
  case options 
  when 1 then list_books
  when 2 then list_people
  when 3 then create_person
  when 4 then create_book
  when 5 then create_rental
  when 6 then rental_per_person
end
end

private

def main_menu 
 print("Make a Selection for need")
 print("Choose an option below;")
 print("1. List all Books")
 print("2. List all People")
 print("3. Create a Person")
 print("4. Create a Book")
 print("5. Create a Rental")
 print("6. List Rental per Person")
 print("Enter your Option Please:")
end

# Book Listing
def list_books
print("Book Listing:")
if @books.isEmpty? 
  print("There are no books yet!")
  sleep 3
  run
end
@books.each do |book|
print("Book: #{book.title} written by #{book.author}")
end
sleep 3
run 
end

# People Listing
def list_people
print("People Listing:")
if(@people.isEmpty?)
print("There are no person yet!")
sleep 3
run
end
@people.each do |person|
print("Person: -Id: #{id} -Name: #{name} -Age: #{age}")
end
sleep 3
run
end

# Create a Student
def create_student
print("For creating student, please enter correct information:")
print("Classroom:")
class = gets.chomp.strip  
print("Name:")
name = gets.chomp.strip
print("Age:")
age = gets.chomp.strip
print("Parent Permsision? (y/n)")
pp = gets.chomp.strip
pp = pp == 'y' 

classroom = Classroom.new(class)
student = Student.new(classroom, name, age, parent_permission: pp)
@people.push(student)
print(" Student created with id: #{student.id}")
sleep 3
run
end

def create_teacher
print("For creating teacher, please enter correct information:")
print("Specialization:")
specialization = gets.chomp.strip
print("Name:")
name = gets.chomp.strip
print("Age:")
age = gets.chomp.strip
teacher = Teacher.new(specialization, name, age)
@people.push(teacher)
print(" Teacher created with id: #{teacher.id}")
sleep 3
run
end

def create_person 
print("Do you want to create a Student or Teacher?")
print("Select a option:")
print("1. Student")
print("2. Teacher")
print("Enter an option:")
options = gets.chomp.to_i
case options
when 1 create_student
when 2 create_teacher
when 0 run
else print("Invalid, Try Again!")
sleep 2
create_person
end

def create_book
print("Creating a book, please enter the book information:")
print ("Name:")
name = gets.chomp
puts ("Author:")
author = gets.chomp

book = Book.new(name, author)
@books.push(book)
print("Book created successfully:#{name} - #{author}")
sleep 3
run
end

def select_book_from_list
if @books.empty?
print("There are no books yet.")
sleep 3
run
end
print ("Listing Books:")
print("Please enter the ID of the book:")
@books.each_with_index do |book, index|
print("#{index}). #{book.title} - #{book.author}")
end
print("Enter your option:")
option = gets.chomp.to_i
@books[option]
end

def select_person_from_list
if @people.empty?
print("There are no people yet.")
sleep 3
run
end
print("Listing all people:")
print("Please enter the number of the person: (not ID)")
@people.each_with_index do |person, index|
  puts "#{index}). #{person.id} - Name: #{person.name}, Age: #{person.age}"
end
print("Enter your option:")
option = gets.chomp.to_i
@people[option]
end

def create_rental
print("Creating a rental, please enter the following information:")

print("Date:")
date = gets.chomp.strip

book = select_book_from_list
person = select_person_from_list

if book.nil? || person.nil?
print("Book or person not found, please try again.")
sleep 3
create_rental
else
rental = Rental.new(date, book, person)
@rentals.push(rental)
print("Rental created successfully")
sleep 3
run
end
end

def select_person_by_id
print("Please enter the ID of the person:")
id = gets.chomp.to_i
@people.find { |p| p.id == id }
end

def list_rentals_per_person
id = select_person_by_id.id
rentals = @rentals.select { |rental| rental.person.id == id }
print ("Listing rentals for person with ID #{id}:")
rentals.each do |rental|
  print("Date: #{rental.date}, Book: #{rental.book.title}")
end
sleep 3
run
end
endd

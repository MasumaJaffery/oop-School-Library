require_relative 'person'
require_relative 'student'
require_relative 'classroom'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
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
    when 6 then list_rentals_per_person
    end
  end

  private

  def main_menu
    puts('Make a Selection for what you need:')
    puts('Choose an option below:')
    puts('1. List all Books')
    puts('2. List all People')
    puts('3. Create a Person')
    puts('4. Create a Book')
    puts('5. Create a Rental')
    puts('6. List Rentals per Person')
    print('Enter your Option Please: ')
  end

  def list_books
    puts('Book Listing:')
    if @books.empty?
      puts('There are no books yet!')
      sleep 3
      run
    end
    @books.each do |book|
      puts("Book: #{book.title} written by #{book.author}")
    end
    sleep 3
    run
  end

  def list_people
    puts('People Listing:')
    if @people.empty?
      puts('There are no people yet!')
      sleep 3
      run
    end
    @people.each do |person|
      puts("Person - Id: #{person.id}, Name: #{person.name}, Age: #{person.age}")
    end
    sleep 3
    run
  end

  def create_student
    puts('For creating a student, please enter correct information:')
    print('Classroom: ')
    classroom_name = gets.chomp.strip
    print('Name: ')
    name = gets.chomp.strip
    print('Age: ')
    age = gets.chomp.strip
    print('Parent Permission? (y/n): ')
    pp_input = gets.chomp.strip
    parent_permission = pp_input.downcase == 'y'

    classroom = Classroom.new(classroom_name)
    student = Student.new(classroom, age, name, parent_permission: parent_permission)
    @people.push(student)
    puts("Student created with ID: #{student.id}")
    sleep 3
    run
  end

  def create_teacher
    puts('For creating a teacher, please enter correct information:')
    print('Specialization: ')
    specialization = gets.chomp.strip
    print('Name: ')
    name = gets.chomp.strip
    print('Age: ')
    age = gets.chomp.strip

    teacher = Teacher.new(specialization, name, age)
    @people.push(teacher)
    puts("Teacher created with ID: #{teacher.id}")
    sleep 3
    run
  end

  def create_person
    puts('Do you want to create a Student or Teacher?')
    puts('Select an option:')
    puts('1. Student')
    puts('2. Teacher')
    puts('0. Back to Main Menu')
    print('Enter an option: ')
    option = gets.chomp.to_i

    case option
    when 1
      create_student
    when 2
      create_teacher
    when 0
      run
    else
      puts('Invalid option. Please try again.')
      sleep 2
      create_person
    end
  end

  def create_book
    puts('Creating a book, please enter the book information:')
    print('Name: ')
    name = gets.chomp.strip
    print('Author: ')
    author = gets.chomp.strip

    book = Book.new(name, author)
    @books.push(book)
    puts("Book created successfully: #{name} - #{author}")
    sleep 3
    run
  end

  def select_book_from_list
    if @books.empty?
      puts('There are no books yet.')
      sleep 3
      run
    end

    puts('Listing Books:')
    puts('Please enter the ID of the book:')
    @books.each_with_index do |book, index|
      puts("#{index}). #{book.title} - #{book.author}")
    end

    print('Enter your option: ')
    option = gets.chomp.to_i
    @books[option]
  end

  def select_person_from_list
    if @people.empty?
      puts('There are no people yet.')
      sleep 3
      run
    end

    puts('Listing all people:')
    puts('Please enter the number of the person (not ID):')
    @people.each_with_index do |person, index|
      puts("#{index}). #{person.id} - Name: #{person.name}, Age: #{person.age}")
    end

    print('Enter your option: ')
    option = gets.chomp.to_i
    @people[option]
  end

  def create_rental
    puts('Creating a rental, please enter the following information:')
    print('Date: ')
    date = gets.chomp.strip

    book = select_book_from_list
    person = select_person_from_list

    if book.nil? || person.nil?
      puts('Book or person not found, please try again.')
      sleep 3
      create_rental
    else
      rental = Rental.new(date, book, person)
      @rentals.push(rental)
      puts('Rental created successfully')
      sleep 3
      run
    end
  end

  def select_person_by_id
    print('Please enter the ID of the person: ')
    id = gets.chomp.to_i
    @people.find { |p| p.id == id }
  end

  def list_rentals_per_person
    person = select_person_by_id
    if person.nil?
      puts('Person not found, please try again.')
    else
      id = person.id
      rentals = @rentals.select { |rental| rental.person.id == id }
      puts("Listing rentals for person with ID #{id}:")
      rentals.each do |rental|
        puts("Date: #{rental.date}, Book: #{rental.book.title}")
      end
    end
    sleep 3
    run
  end
end

app = App.new
app.run

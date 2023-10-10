require 'json'

# Create a Class for Data Manager
class DataManager
  # Here we specify accessors as we know it's used for getter/setter methods in Ruby!
  attr_accessor :books

  # Here we define initialize
  # Notice that we use parentheses after the keyword 'initialize.'
  def initialize
    @books = []
    # In case of rentals and person(student/teacher you can add @rentals = [])
  end

  # Load Data
  def load_data
    # This Load Method contains all methods that need to load!
    load_books
  end

  # Save Data
  def save_data
    begin # Added a begin block for error handling
      # Same as load mechanism but it saves books, person, and rental!
      save_books
      puts "Books Saved!"
    rescue StandardError => e # Here e is the error
      puts "Error Saving Data: #{e.message}"
    end
  end

  # save_books 
  def save_books
    # File.open is used to open a file, and basically, it takes two parameters
    # File name and 'w' that is write mode
    File.open('books.json', 'w') do |file|
      file.puts @books.map { |book|
        { 'title' => book.title, 
          'author' => book.author }
      }.to_json
      # to_json converts data that you enter in the console into JavaScript Object Notation inside books.json.
    end
  end

  private
  # load_books
  def load_books
    # Checks first if the file exists or not using File.exist?
    return unless File.exist?('books.json')
    # File.read('books.json') reads the file
    # We used json_str because we need to parse data!
    json_str = File.read('books.json')
    # Basically, we convert JSON format into console data format here to show data that you saved!
    @books = JSON.parse(json_str).map do |book_data|
      Book.new(book_data['title'], book_data['author'])
    end
  end
end

# Let's move on to App.rb

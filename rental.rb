require_relative 'book'

class Rental
   attr_accessor :date, :book, :person
  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    # << is to append elements to an array.
    book.Rental << self
    person.Rental << self
  end 
end
class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    add_rental # This method associates the rental with the book and person.
  end

  # Define a method to add the rental to the book and person.
  def add_rental
    book.add_rental(self)
    person.add_rental(self)
  end
end

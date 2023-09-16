require_relative 'rental'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end

  # Define a method to add a rental to a book.
  def add_rental(rental)
    @rental << rental
  end
end
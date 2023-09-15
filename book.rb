require_relative 'rental'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end

  def add_new_rental(person, date)
    Rental.new(self, person, date)
  end
end

require_relative 'rental'

class Book
  attr_accessor :title, :author
  attr_reader :rental

  def initialize(title, author)
    @title = title
    @author = author
    @eental = []
  end

  def add_new_rental(person, date)
    Rental.new(self, person, date)
  end
end

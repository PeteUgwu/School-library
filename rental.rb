require_relative './book'
require_relative './person'

class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date

    @person = person
    puts person
    person.rentals.push(self)

    @book = book
    book.rentals.push(self)
  end
end

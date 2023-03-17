require './book'
require './student'
require './teacher'
require './rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def create_student(age, name, parent_permission)
    classroom = 'Null'
    @people << { type: 'Student', data: Student.new(age, name, classroom, parent_permission) }
  end

  def create_teacher(age, name, spec)
    @people << { type: 'Teacher', data: Teacher.new(age, spec, name) }
  end

  def add_book(title, author)
    @books << Book.new(title, author)
  end

  def create_rental(book_id, person_id, date)
    person = find_person(person_id)

    @rentals << Rental.new(@books[book_id], person[:data], date)
  end

  def list_people
    @people.each_with_index do |person, id|
      index = id + 1
      puts "#{index} - [#{person[:type]}] Name: #{person[:data].name} Age: #{person[:data].age} ID: #{person[:data].id}"
    end
  end

  def list_books
    @books.each_with_index do |book, id|
      index = id + 1
      puts "#{index} -- #{book.title}, #{book.author}"
    end
  end

  def list_person_rentals(id)
    person = find_person(id)

    person[:data].rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} written by: #{rental.book.author}"
    end
  end

  private

  def find_person(p_id)
    @people.find { |person| person[:data].id == p_id }
  end
end
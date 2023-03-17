require './app'

def welcome
  puts 'Welcome to the School Library App'
end

def create_person(library)
  print 'Do you want to create a Student (1) or a teacher (2)?:'

  input = gets.chomp.to_i

  print 'Name: '
  name = gets.chomp

  print 'Age: '
  age = gets.chomp.to_i

  if input == 1
    print 'Has parent permission? y/n :'
    permission = gets.chomp

    library.create_student(age, name, permission == 'y')
  else
    print 'Enter Teachers specialization:'
    spec = gets.chomp

    library.create_teacher(age, name, spec)
  end

  puts input == 1 ? 'Student created Successfuly!' : 'Teacher created Successfuly!'

  user_choice(library)
end

def create_book(library)
  puts 'Enter book Title:'
  title = gets.chomp
  puts 'Enter authors name'
  author = gets.chomp
  library.add_book(title, author)

  puts 'Book created'
  user_choice(library)
end

def create_rental(library)
  puts 'Select a Books from the book list below: '
  library.list_books

  book_id = gets.chomp.to_i

  puts "Select a person from the list below: Enter the person's ID: "
  library.list_people

  person_id = gets.chomp.to_i

  print 'Enter Date: '
  date = gets.chomp

  library.create_rental(book_id - 1, person_id, date)

  puts 'Rental created Suceefully!!'
  user_choice(library)
end

def list_people(library)
  library.list_people

  user_choice(library)
end

def list_books(library)
  library.list_books

  user_choice(library)
end

def list_rentals(library)
  library.list_people
  puts "Enter a person's ID: "

  id = gets.chomp.to_i

  library.list_person_rentals(id)

  user_choice(library)
end

def list_options
  prompt = "\n Please choose an option by entering a number:
    1 - List all Books
    2 - List all people
    3 - Create a person
    4 - Create a book
    5 - Create a rental
    6 - List all rentals for a given person id
    7 - Exit!
    "
  puts prompt
end

def user_choice(library)
  list_options
  choice = gets.chomp.to_i

  case choice
  when 1
    list_books(library)
  when 2
    list_people(library)
  when 3
    create_person(library)
  when 4
    create_book(library)
  when 5
    create_rental(library)
  when 6
    list_rentals(library)
  end

  # Exit
  puts 'Thanks for for using this App'
end

def main
  library = App.new
  user_choice(library)
end

welcome
main
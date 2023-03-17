require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, _name = 'Unknown', _parent_permission: true)
    super(age, _name = 'Unknown', _parent_permission: true)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end

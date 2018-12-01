
class Student < ApplicationRecord
  has_many :student_klasses
  has_many :klasses, through: :student_klasses
end

class Klass < ApplicationRecord
  has_many :student_klasses
  has_many :students, through: :student_klasses

end

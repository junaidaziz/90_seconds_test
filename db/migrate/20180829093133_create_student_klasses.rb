class CreateStudentKlasses < ActiveRecord::Migration[5.2]
  def change
    create_table :student_klasses do |t|
      t.references :student
      t.references :klass

      t.timestamps
    end
  end
end

class ApplicationController < ActionController::API
  def students
    render json: {
      students: Student.all.map do |student|
        {
          name: student.name,
          classes: student.klasses.map(&:name),
          classmates: student.klasses.includes(student_klasses: [:student]).map do |klass|
            students = klass.student_klasses.select {|student_klasse| student_klasse.student.id != student.id}  
            {
              name: klass.name,
              mates: students.map do |student_klass|
                {
                  name: student_klass.student.name
                }
              end
            }
          end
        }
      end
    }
  end

  def stats
    render json: {
      students_count: Student.count,
      classes_count: Klass.count,
      no_classes: Student.where('id NOT IN (SELECT DISTINCT(student_id) FROM student_klasses)').map do |student|
        {
          name: student.name,
        }
      end,
      min_students: Klass.joins(:student_klasses)
                          .select("klasses.*, count(student_klasses.id) as student_count")
                          .group('klasses.id').order("student_count DESC").map do |klass|
        {
          name: klass.name,
          student_count: klass.student_count
        }
      end
    }
  end
end

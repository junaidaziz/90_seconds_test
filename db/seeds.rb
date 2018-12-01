math = Klass.create!(name: 'Math')
physics = Klass.create!(name: 'Physics')
chemistry = Klass.create!(name: 'Chemistry')

alice = Student.create!(name: 'Alice')
bob = Student.create!(name: 'Bob')
carol = Student.create!(name: 'Carol')
dave = Student.create!(name: 'Dave')

alice.klasses = [math, physics]
bob.klasses = [math, chemistry]
carol.klasses = [chemistry]

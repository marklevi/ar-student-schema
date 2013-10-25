require 'faker'
require_relative 'teacher' 
require_relative 'student'



6.times do Teacher.create(:name => Faker::Name.name, :email => Faker::Internet.email, :address => Faker::Address.street_address, :phone => Faker::PhoneNumber.cell_phone)

end



# teacher1 = Teacher.create(:name => 'Dan', :email => 'mark@gmail.com')

# teacher2 = Teacher.create(:name => 'Mark', :email => 'mark@gmail.com')


Student.all.each do |student|
  student.teacher = Teacher.find(rand(1..6)) 
  student.save
end

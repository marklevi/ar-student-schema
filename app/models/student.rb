require_relative '../../db/config'

class Student < ActiveRecord::Base

  validates :email, format: { with: /.+@.+\..+.+/, message: "invalid email"}
  validates :email, uniqueness: true
  validate :age_must_be_greater_than_five
  validates :phone, length: {minimum: 10}

  def age_must_be_greater_than_five
    if age < 5
      errors.add(:birthday, "can't be less than five year's old")
    end
  end

  def name 
    self.first_name + " " + self.last_name
  end

  def age
    now = Date.today
    age = now.year - self.birthday.year 
  end


end


# sam = Student.create(first_name: "sam", last_name: "something")
# sam.first_name
# sam.last_name
# sam.name


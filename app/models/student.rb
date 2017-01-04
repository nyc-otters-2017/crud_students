class Student < ActiveRecord::Base
  # Remember to create a migration!

  validates :first_name, :last_name, presence:  true
  
  # validate :my_custom_validation
  #
  # def my_custom_validation
  #   if self.first_name.length == 0
  #     errors.add('first_name', 'can not be blank')
  #   end
  # end
  # validates :password, presence: true, length: {minimum: 6}
end

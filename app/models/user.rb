class User < ActiveRecord::Base
  # Remember to create a migration!

  validates :username, :email, :password, presence:  true
  validates :password, length: {minimum:  6}
  has_secure_password

  has_many :books

  # def password
  #   # binding.pry
  #   @password ||= BCrypt::Password.new(password_digest)
  # end
  #
  # def password=(value)
  #   # binding.pry
  #   # @password = BCrypt::Password.create(value)
  #   self.password_digest = BCrypt::Password.create(value)
  #   @password =  value
  # end
end

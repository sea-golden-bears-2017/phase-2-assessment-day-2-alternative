require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt

  validates :user_name, :email, presence: true
  validates :email, :user_name, uniqueness: true

  has_many :entries

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end

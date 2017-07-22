class User < ApplicationRecord
  include BCrypt
  attr_reader :raw_password
	validates_presence_of :fullname, :email, :password
  validates_uniqueness_of :email
  validates :raw_password, presence: true, if: "raw_password.nil?"
  validates :email,
    {presence: true,
    format: {with: /\S*@\S*\.\S+/,
    message: "must be valid email"},
    uniqueness: true}

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @raw_password = new_password
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(test_email, test_password)
    # if email and password correspond to a valid user, return that user
    authenticated_user = User.find_by(email: test_email)
    unless authenticated_user.nil?
      if authenticated_user.password == test_password
        return authenticated_user
      end
    # otherwise, return nil
    else
      return nil
    end
  end
end

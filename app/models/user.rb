class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 5 }

  before_save { self.email.downcase! }

  def self.authenticate_with_credientials(email, password)
    user = User.find_by_email email.strip.downcase
    if (user && user.authenticate(password))
      return user
    else
      nil
    end
  end

end

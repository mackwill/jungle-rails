class User < ActiveRecord::Base
  
  has_secure_password


  validates :email, uniqueness: { case_sensitive: false }
  validates :email, presence: true
  validates :password, presence: true
  validates :password, length: { minimum: 6 }
  validates :first_name, presence:  true
  validates :last_name, presence: true

  def self.authenticate_with_credentials(email, password)
    email = email.strip

    User.find_by(email: email).try(:authenticate, password)

  end

  private
   

end

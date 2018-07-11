class User < ApplicationRecord
  attr_reader :password



  validates :username, :session_token, presence: true,uniqueness: true
  validates :password_digest, presence: {message: 'Password can\t be blank'}
  validates :password, length: {minimum: 6, allowed_nil: true}
  before_validation :ensure_session_token

  def self.find_by_credentials(username,pw)
    user=User.find_by(username: username)
    if user.nil?
      return nil
    else
      if user.is_password?(pw)
        return user
      end
      return nil
    end
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def password=(pw)
      self.password_digest = BCrypt::Password.create(pw)
  end

  def ensure_session_token
      self.session_token ||= User.generate_session_token
  end



  def reset_session_token
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def is_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end



end

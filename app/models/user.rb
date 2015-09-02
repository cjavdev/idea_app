# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :session_token, presence: true, uniqueness: true
  validates :email, uniqueness: true
  attr_reader :password
  has_many :ideas

  before_validation on: :create do
    self.session_token = SecureRandom.hex
  end

  def self.find_by_credentials(user_params)
    u = User.find_by(email: user_params[:email])
    return u if u && u.is_password?(user_params[:password])
    nil
  end

  def reset_session_token!
    self.session_token = SecureRandom.hex
    self.save
    session_token
  end

  def is_password?(raw)
    BCrypt::Password.new(password_digest).is_password?(raw)
  end

  def password=(raw)
    @password = raw
    self.password_digest = BCrypt::Password.create(raw)
  end
end

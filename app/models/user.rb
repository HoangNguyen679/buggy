class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:login],
         reset_password_keys: [:login]

  attr_writer :login

  validates :email, format: {
    with: URI::MailTo::EMAIL_REGEXP,
    message: 'must be a valid email address'
  }
  validates :username, uniqueness: true

  has_many :media, dependent: :destroy

  def login
    @login || username || email
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h)
        .where(['username = :value OR lower(email) = lower(:value)', { value: login }])
        .first
    elsif conditions.key?(:username) || conditions.key?(:email)
      conditions[:email]&.downcase!
      where(conditions.to_h).first
    end
  end
end

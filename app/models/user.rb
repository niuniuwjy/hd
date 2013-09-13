class User < ActiveRecord::Base

  has_many :comments


  validates :email, :presence => true, :uniqueness => true
  validates :username, presence: true,
            length: {maximum: 16},
            uniqueness: true

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable    :authentication_keys

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me ,:votes
  attr_accessor :login
  attr_accessible :login

  include Likeable::UserMethods

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
    else
      where(conditions).first
    end
  end

### This is the correct method you override with the code above
### def self.find_for_database_authentication(warden_conditions)
### end

end

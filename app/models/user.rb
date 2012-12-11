class User
  include MongoMapper::Document

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :encryptable

  ## Database authenticatable
  key :user_name, String, :default => ""
  key :email, String, :default => ""
  key :encrypted_password, String, :default => ""

  ## Recoverable
  key :reset_password_token, String
  key :reset_password_sent_at, Time

  ## Rememberable
  key :remember_created_at, Time

  ## Trackable
  key :sign_in_count, Integer, :default => 0
  key :current_sign_in_at, Time
  key :last_sign_in_at, Time
  key :current_sign_in_ip, String
  key :last_sign_in_ip, String

  key :password_salt, String

  validates_presence_of :user_name
  validates_uniqueness_of :user_name
end

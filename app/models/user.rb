class User < Neo4j::Rails::Model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  property :username, type: String
  property :facebook_token, type: String, index: :exact

  property :created_at, type: Time
  property :updated_at, type: Time

  ## Database authenticatable
  property :email, type: String, null: false, default: "", index: :exact
  property :encrypted_password, type: NilClass

  ## If you include devise modules, uncomment the properties below.

  ## Rememberable
  property :remember_created_at, type: Time
  index :remember_token, type: :exact

  ## Recoverable
  property :reset_password_token, type: NilClass, index: :exact
  property :reset_password_sent_at, type: Time

  ## Trackable
  property :sign_in_count, type: Fixnum, default: 0
  property :current_sign_in_at, type: Time
  property :last_sign_in_at, type: Time
  property :current_sign_in_ip, type:  String
  property :last_sign_in_ip, type: String

  ## Confirmable
  # property :confirmation_token, type: NilClass, index: :exact
  # property :confirmed_at, type: DateTime
  # property :confirmation_sent_at, type: DateTime

  ## Lockable
  # property :failed_attempts, type: Fixnum, default: 0
  # property :locked_at, type: DateTime
  # property :unlock_token, type: String, index: :exact

  ## Token authenticatable
  # property :authentication_token, type: String, null: true, index: :exact

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable #, :omniauthable
end

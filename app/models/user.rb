class User < ApplicationRecord
  # FIGVAPER
  attr_reader :password
  after_initialize :ensure_session_token

  validates :first_name, :last_name, :birth_date, :email, :location, :password_digest, :session_token, presence: true
  validates :email, :session_token, uniqueness: true
  validates :password, length: {minimum: 6}, allow_nil: true

  has_many :routes,
    class_name: :Route,
    foreign_key: :user_id,
    primary_key: :id

  has_many :comments,
    class_name: :Comment,
    foreign_key: :author_id,
    primary_key: :id

  has_many :connections,
    foreign_key: :requester,
    class_name: :FriendRequest,
    primary_key: :id

  has_many :friends,
    through: :connections,
    source: :friend


  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil unless user && user.is_password?(password)
    user
  end
  
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  def generate_unique_session_token
    self.session_token = new_session_token
    while User.find_by(session_token: self.session_token) # referenced from aA open as a more efficient alternative
      self.session_token = new_session_token
    end
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def ensure_session_token
    generate_unique_session_token unless self.session_token
  end

  def reset_session_token!
    generate_unique_session_token
    save!
    self.session_token
  end


  def new_session_token
    SecureRandom.urlsafe_base64
  end

  def all_the_routes
    routes.all # method using active record to pull all routes
  end

  def all_the_comments
    comments.all
  end


end

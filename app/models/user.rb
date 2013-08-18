class User < ActiveRecord::Base
  include BCrypt

  has_many :votes
  has_many :survey_takers
  has_many :surveys # through: :survey_users

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true,
      format: { with: /(.{1,})(\@)(\w{1,})(\.)(\w{2,})/}
  validates :password, presence: true


  def self.authenticate(name, password)
    user = User.find_by_name(name)
    if user && user.password == password
      return user
    else
      return nil
    end
  end

  def password
    @password ||= Password.new(self.password_hash)
  end

  def password=(password_string)
    @password = Password.create(password_string)
    self.password_hash = @password
  end
end

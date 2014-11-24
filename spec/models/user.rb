class User
  validates :name, :email, :password , :password_confirmation, presence: true
end
class User < ActiveRecord::Base
	has_secure_password

	has_many :concerts
	has_many :comments
 
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

end

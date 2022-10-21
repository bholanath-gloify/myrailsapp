class User < ApplicationRecord
  has_many :books
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         

  enum user_role: {
    admin: 0,
    author: 1
  }


  validates_presence_of :email, :name, :dob, :user_role, :encrypted_password 


end

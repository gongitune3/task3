class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  validates :name, presence: true, length: {minimum: 2, maximum: 20 }
  validates :introduction,  length: {maximum: 50 } 
  attachment :profile_image

  # def self.find_first_by_auth_conditions(warden_conditions)
  #   conditions = warden_conditions.dup
  #   if login = conditions.delete(:login)
  #     where(conditions).where(["username = :value", { :value => username }]).first
  #   else
  #     where(conditions).first
  #   end
  # end


end

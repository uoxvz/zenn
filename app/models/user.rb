class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable,
  :authentication_keys => [:name]

  mount_uploader :avatar, AvatarUploader

  validates_uniqueness_of :name
  validates_presence_of :name
  def email_required?
    false
  end

  # nameを利用してログイン
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["name = :value", { :value => name }]).first
    else
      where(conditions).first
    end
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  attachment :profile_image

end

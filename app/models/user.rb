class User < ActiveRecord::Base
  validates :uid,          presence: true, uniqueness: true
  validates :display_name, presence: true
  validates :email,        presence: true
  validates :token,        presence: true

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid          = auth_info.uid
      new_user.display_name = auth_info.extra.raw_info.display_name
      new_user.email        = auth_info.extra.raw_info.email
      new_user.token        = auth_info.credentials.token
    end
  end
end

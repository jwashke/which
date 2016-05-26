class AddAvatarToUsers < ActiveRecord::Migration
  def change
    link = "https://s3.amazonaws.com/tinystays-development/avatar-missing.jpeg"
    add_column :users, :avatar, :string, default: link
  end
end

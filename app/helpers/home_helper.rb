module HomeHelper
  def link_to_unfollow(name)
    if current_user
      link_to "Unfollow Stream", follow_path(id: name), method: :delete
    end
  end
end

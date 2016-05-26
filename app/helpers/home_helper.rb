module HomeHelper
  def link_to_follow(name)
    if current_user
      link_to "Follow Stream", follows_path(id: name), method: :post
    end
  end

  def link_to_unfollow(name)
    if current_user
      link_to "Unfollow Stream", follow_path(id: name), method: :delete
    end
  end
end

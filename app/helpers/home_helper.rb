module HomeHelper
  def link_to_follow(name)
    if current_user
      link_to "Follow", follows_path(id: name), method: :post, class: "btn btn-purple center-block"
    end
  end

  def link_to_unfollow(name)
    if current_user
      link_to "Unfollow", follow_path(id: name), method: :delete, class: "btn btn-purple center-block"
    end
  end
end

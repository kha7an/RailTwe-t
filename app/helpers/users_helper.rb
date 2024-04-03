module UsersHelper
  include ActionView::RecordIdentifier

  def following?(user)
    current_user&.followees&.include?(user)
  end

  def dom_id_for_follower(follower)
    dom_id(follower)
  end

  def gravatar_for(user, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end

module FoodsHelper
  def gravatar_for food, size: 80
    gravatar_id = Digest::MD5::hexdigest food.name
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag gravatar_url, alt: food.name, class: "gravatar"
  end
end

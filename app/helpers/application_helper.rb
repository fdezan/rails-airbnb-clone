module ApplicationHelper

  def avatar_url(user)
    user.facebook_picture_url || cl_image_path(user.photo.path) || "http://placehold.it/30x30"
  end

  def background_url(my_service)
    my_service.photos.sample.try(:path) || "http://placehold.it/30x30"
  end
end

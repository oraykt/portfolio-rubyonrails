module CurrentUserConcern
  extend ActiveSupport::Concern

  def current_user
    super || guest_user
  end

  def guest_user
    guest_user = GuestUser.new
    guest_user.id = object_id
    guest_user.nickname = "guest"
    guest_user.email = "guest@oraykurt.com"
    guest_user
  end
end
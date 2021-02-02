module CurrentUserConcern
  extend ActiveSupport::Concern

  def current_user
    super || guest_user
  end

  def guest_user
    OpenStruct.new(
      full_name: "Guest User",
      nickname: "guest",
      email: "guest@oraykurt.com"
    )
  end
end
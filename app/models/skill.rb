class Skill < ApplicationRecord
  validates_presence_of :title, :percent_utilized

  def set_defaults
    self.badge ||= "http://via.placeholder.com/100x100"
  end
end

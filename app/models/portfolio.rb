class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.custom_query_1
    where(subtitle: 'React')
  end

  scope :custom_query_2, ->{
    where(subtitle: 'Ruby on Rails')
  }

  # Custom queries usage
  # Portfolio.custom_query_1
  # Portfolio.custom_query_2
end

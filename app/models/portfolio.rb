class Portfolio < ApplicationRecord
  has_many :technologies, dependent: :destroy
  accepts_nested_attributes_for :technologies,
                                reject_if: ->(attrs) { attrs['name'].blank? }
  # reject_if: lambda { |attrs| attrs['name'].blank?}
  validates_presence_of :title, :body

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  def self.by_position
    order('position ASC')
  end
  # Portfolio.custom_query_2
  scope :custom_query_2, lambda {
    where(subtitle: 'Ruby on Rails')
  }

end

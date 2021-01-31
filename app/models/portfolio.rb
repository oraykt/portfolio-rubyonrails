class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                reject_if: ->(attrs) { attrs['name'].blank? }
                              # reject_if: lambda { |attrs| attrs['name'].blank?}
  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image

  # Portfolio.custom_query_1
  def self.custom_query_1
    where(subtitle: 'React')
  end

  # Portfolio.custom_query_2
  scope :custom_query_2, lambda {
    where(subtitle: 'Ruby on Rails')
  }

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '300', width: '200')
  end

end

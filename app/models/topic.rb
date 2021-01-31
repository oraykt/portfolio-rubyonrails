class Topic < AppmodellicationRecord
  validates_presence_of :title

  has_many :blogs
end

class Event < ActiveRecord::Base
  #has_many :comments
  has_many :reviews
  has_many :posts
  has_many :event_groupships 
  has_many :groups, :through => :event_groupships
  has_one :location
  validates_presence_of :bookname

end

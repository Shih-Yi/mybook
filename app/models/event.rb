class Event < ActiveRecord::Base
  has_many :comments
  validates_presence_of :bookname
end

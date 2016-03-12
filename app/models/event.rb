class Event < ActiveRecord::Base
  validates_presence_of :bookname
end

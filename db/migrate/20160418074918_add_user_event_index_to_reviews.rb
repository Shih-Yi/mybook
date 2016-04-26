class AddUserEventIndexToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :event, index: true
    add_reference :reviews, :user, index: true

  end
end

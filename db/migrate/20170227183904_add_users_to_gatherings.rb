class AddUsersToGatherings < ActiveRecord::Migration[5.0]
  def change
    add_reference :gatherings, :user, foreign_key: true
  end
end

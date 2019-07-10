class AddHobbyIdToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :hobby_id, :integer
  end
end

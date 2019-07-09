class AddHobbyIdToCelebrities < ActiveRecord::Migration[4.2]
  def change
    add_column :celebrities, :hobby_id, :integer
  end
end

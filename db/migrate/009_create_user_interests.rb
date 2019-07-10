class CreateUserInterests < ActiveRecord::Migration[4.2]
  def change
    create_table :user_interests do |t| 
      t.integer :interest_id
      t.integer :user_id
    end
  end
end

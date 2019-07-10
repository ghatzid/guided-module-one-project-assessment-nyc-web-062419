class CreateCelebrityInterests < ActiveRecord::Migration[4.2]
  def change
    create_table :celebrity_interests do |t| 
      t.integer :interest_id
      t.integer :celebrity_id
    end
  end
end

class CreateUserHobbys < ActiveRecord::Migration[4.2]
  def change
    create_table :user_hobbys do |t| 
      t.integer :hobbys_id
      t.integer :users_id
    end
  end
end

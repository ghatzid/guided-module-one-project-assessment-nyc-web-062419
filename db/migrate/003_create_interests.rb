class CreateInterests < ActiveRecord::Migration[4.2]
  def change
    create_table :interests do |t| 
      t.string :interest_names
    end
  end
end

class CreateHobbys < ActiveRecord::Migration[4.2]
  def change
    create_table :hobbys do |t| 
      t.string :hobbys_name
    end
  end
end

class CreateHobbies < ActiveRecord::Migration[4.2]
  def change
    create_table :hobbies do |t| 
      t.string :hobby_name 
    end
  end
end

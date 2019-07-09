class CreateCelebrities < ActiveRecord::Migration[4.2]
  def change
    create_table :celebrities do |t| 
      t.string :name
    end
  end
end

class AddAgeToCelebrities < ActiveRecord::Migration[4.2]
    def change
      add_column :celebrities, :age, :integer
    end
  end
  
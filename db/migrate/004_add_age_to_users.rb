  class AddAgeToUsers < ActiveRecord::Migration[4.2]
    def change
      add_column :users, :age, :integer
    end
  end
  
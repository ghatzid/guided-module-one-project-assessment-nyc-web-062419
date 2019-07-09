class AddKnownForToCelebrities < ActiveRecord::Migration[4.2]
  def change
    add_column :celebrities, :known_for, :string
  end
end

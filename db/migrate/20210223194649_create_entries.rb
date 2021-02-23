class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.integer :variable_id
      t.integer :value

      t.timestamps
    end
  end
end

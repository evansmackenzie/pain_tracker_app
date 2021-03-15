class AddRatingToEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :rating, :integer
  end
end

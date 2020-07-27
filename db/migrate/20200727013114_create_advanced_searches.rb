class CreateAdvancedSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :advanced_searches do |t|
      t.string :keywords
      t.string :structure_type
      t.string :manufacturer
      t.float :min_price
      t.float :max_price
      t.float :kwp

      t.timestamps
    end
  end
end

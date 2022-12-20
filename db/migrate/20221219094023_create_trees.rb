class CreateTrees < ActiveRecord::Migration[7.0]
  def change
    create_table :trees do |t|
      t.string :name
      t.string :address
      t.text :description
      t.integer :price_per_year
      t.string :fruits
      t.integer :quantity_by_year
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

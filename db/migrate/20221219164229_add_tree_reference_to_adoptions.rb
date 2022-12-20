class AddTreeReferenceToAdoptions < ActiveRecord::Migration[7.0]
  def change
    add_reference :adoptions, :tree, null: false, foreign_key: true
  end
end

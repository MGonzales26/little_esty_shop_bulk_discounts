class CreateReductions < ActiveRecord::Migration[5.2]
  def change
    create_table :reductions do |t|
      t.references :merchant, foreign_key: true
      t.references :bulk_discount, foreign_key: true

      t.timestamps
    end
  end
end

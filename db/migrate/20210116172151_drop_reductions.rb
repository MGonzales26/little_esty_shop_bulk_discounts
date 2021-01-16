class DropReductions < ActiveRecord::Migration[5.2]
  def change
    drop_table :reductions
  end
end

class CreateCalculators < ActiveRecord::Migration[6.1]
  def change
    create_table :calculators do |t|
      t.integer :int_a
      t.integer :int_b
      t.string :operator
      t.integer :result

      t.timestamps
    end
  end
end

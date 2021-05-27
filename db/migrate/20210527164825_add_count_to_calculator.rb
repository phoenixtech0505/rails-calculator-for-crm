class AddCountToCalculator < ActiveRecord::Migration[6.1]
  def change
    add_column :calculators, :count, :integer
  end
end

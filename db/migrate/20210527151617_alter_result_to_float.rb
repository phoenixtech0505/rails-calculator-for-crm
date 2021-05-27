class AlterResultToFloat < ActiveRecord::Migration[6.1]
  def change
    reversible do |dir|
      change_table :calculators do |t|
        dir.up {t.change :result, :float}
        dir.down {t.change :result, :integer}
      end
    end
  end
end

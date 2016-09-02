class CreateConversions < ActiveRecord::Migration
  def change
    create_table :conversions do |t|
      t.references :click, index: true, foreign_key: true
      t.float :revenue

      t.timestamps null: false
    end
  end
end

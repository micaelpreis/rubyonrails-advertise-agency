class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.references :campaign, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

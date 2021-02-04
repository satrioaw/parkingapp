class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :parkings do |t|
      t.string :plat_nomor
      t.string :warna
      t.string :tipe
      t.string :parking_lot
      t.string :parking_bill

      t.timestamps
    end
  end
end

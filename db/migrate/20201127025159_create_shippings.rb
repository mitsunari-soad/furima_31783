class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string :postal,              null: false
      t.integer :prefecture_id,      null: false
      t.string :city,                null: false
      t.string :number,              null: false
      t.string :phone,               null: false
      t.string :build,               null: false
      t.references :purchase,        foreign_key: true
      t.timestamps
    end
  end
end

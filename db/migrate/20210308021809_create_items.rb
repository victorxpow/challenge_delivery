class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :external_code
      t.string :name
      t.decimal :price
      t.integer :quantity
      t.decimal :total
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end

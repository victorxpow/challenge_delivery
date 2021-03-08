class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :external_code, null: false
      t.integer :store_id, null: false
      t.decimal :sub_total, null: false
      t.decimal :delivery_fee, null: false
      t.decimal :total_shipping, null: false
      t.decimal :total, null: false
      t.string :country, null: false
      t.string :state, null: false
      t.string :city, null: false
      t.string :district, null: false
      t.string :street, null: false
      t.string :complement, null: false
      t.decimal :latitude, null: false, precision: 10, scale: 6
      t.decimal :longitude, null: false, precision: 10, scale: 6
      t.datetime :dt_order_create, null: false
      t.string :postal_code, null: false
      t.integer :number, null: false

      t.timestamps
    end
  end
end

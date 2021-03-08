class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :external_code, null: false
      t.string :name, null: false
      t.string :email, null: false
      t.string :area_code, null: false
      t.string :number, null: false
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end

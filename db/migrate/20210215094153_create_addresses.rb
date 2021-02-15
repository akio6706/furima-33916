class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code, null: false
      t.integer    :area_id,     null: false
      t.string     :city,        null: false
      t.string     :street,      null: false
      t.string     :address,     null: false
      t.string     :phone_number
      t.references :order,       foreign_key: true
      t.timestamps
    end
  end
end

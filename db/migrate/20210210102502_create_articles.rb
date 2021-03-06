class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.integer  :category_id,  null: false
      t.integer  :state_id,     null: false
      t.integer  :burden_id,    null: false
      t.integer  :area_id,      null: false
      t.integer  :day_id,       null: false
      t.timestamps
    end
  end
end
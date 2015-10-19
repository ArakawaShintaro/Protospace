class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :main_image
      t.string :sub_image
      t.integer :prototype_id
      t.timestamps null: false
    end
  end
end

class CreatePrototypes < ActiveRecord::Migration
  def change
    create_table :prototypes do |t|
      t.string :catchcopy
      t.text :concept
      t.references :user, index: true
      t.timestamps null: false
    end
  end
end

class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :bookname
      t.integer :no
      t.string :author
      t.integer :price
      t.text :description
      t.boolean :is_public
      t.integer :capacity

      t.timestamps null: false
    end
  end
end

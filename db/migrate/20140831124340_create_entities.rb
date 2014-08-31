class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :name
      t.string :type
      t.decimal :lat
      t.decimal :lon
      t.text :description
      t.string :url
      t.string :address
      t.integer :year_estab
      t.integer :user_id
      t.boolean :admin_verification, default: false

      t.timestamps
    end
  end
end

class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :name
      t.decimal :lat
      t.decimal :lon
      t.text :description
      t.string :uri
      t.string :address
      t.int :year_estab
      t.int :user_id

      t.timestamps
    end
  end
end

class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :name
      t.string :type
      t.decimal :lat, :precision => 15, :scale => 10
      t.decimal :lon, :precision => 15, :scale => 10
      t.text :description
      t.string :url
      t.string :address
      t.integer :year_estab
      t.boolean :admin_verification, default: false
      t.references :user, index: true

      t.timestamps
    end
  end
end

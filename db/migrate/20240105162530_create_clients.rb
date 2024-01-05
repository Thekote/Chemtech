class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.integer :sex, null: false
      t.date :birthday, null: false
      t.integer :age, null: false
      t.boolean :active, null: false, default: true

      t.references :city, index: true, foreign_key: true

      t.timestamps
    end
  end
end

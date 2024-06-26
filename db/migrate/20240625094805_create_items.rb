class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.boolean :done
      t.datetime :deadline
      t.references :todo, foreign_key: true

      t.timestamps
    end
  end
end

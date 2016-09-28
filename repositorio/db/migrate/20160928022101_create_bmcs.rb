class CreateBmcs < ActiveRecord::Migration
  def change
    create_table :bmcs do |t|
      t.text :problema
      t.text :propuesta
      t.text :cliente
      t.references :proyect, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

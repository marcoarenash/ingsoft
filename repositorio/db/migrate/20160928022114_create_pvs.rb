class CreatePvs < ActiveRecord::Migration
  def change
    create_table :pvs do |t|
      t.text :productos
      t.text :generadores
      t.text :eliminadores
      t.text :tareas
      t.text :ganancias
      t.text :frustaciones
      t.references :proyect, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

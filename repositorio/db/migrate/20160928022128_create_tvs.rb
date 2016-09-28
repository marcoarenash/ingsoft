class CreateTvs < ActiveRecord::Migration
  def change
    create_table :tvs do |t|
      t.text :hipcli
      t.text :hipprob
      t.text :hipsol
      t.text :invalidamos
      t.text :validamos
      t.references :proyect, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreatePlates < ActiveRecord::Migration
=begin
  def change
    create_table :plates do |t|
      t.string, :state
      t.string, :plate
      t.string, :full, :unique => true
      t.decimal, :turning, :precision =>10, :scale =>1, :null => true
      t.decimal, :speed, :precision =>10, :scale =>1, :null => true
      t.decimal, :merging, :precision =>10, :scale =>1, :null => true
      t.decimal, :parking, :precision =>10, :scale =>1, :null => true
      t.decimal, :general, :precision =>10, :scale =>1, :null => true

      t.timestamps null: false
    end
  end
=end
end

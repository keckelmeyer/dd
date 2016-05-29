class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :state
      t.string :plate
      t.string :category
      t.integer :stars

      t.timestamps null: false
    end
  end
end

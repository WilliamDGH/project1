class CreateRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :routes do |t|
      t.text :start
      t.text :end
      t.integer :capacity
      t.boolean :full, :default => false

      t.timestamps
    end
  end
end

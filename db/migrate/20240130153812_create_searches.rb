class CreateSearches < ActiveRecord::Migration[7.1]
  def change
    create_table :searches do |t|
      t.string :body1
      t.string :transmission2
      t.string :engine3
      t.string :traction4
      t.string :optionals5
      t.timestamps
    end
  end
end

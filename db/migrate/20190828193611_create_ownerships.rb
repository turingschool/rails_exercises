class CreateOwnerships < ActiveRecord::Migration[5.1]
  def change
    create_table :ownerships do |t|
      t.references :dog, foreign_key: true
      t.references :owner, foreign_key: true
      t.integer :length
    end
  end
end

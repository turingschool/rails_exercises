class CreateTricks < ActiveRecord::Migration[5.1]
  def change
    create_table :tricks do |t|
      t.string :title
      t.references :dog, foreign_key: true
    end
  end
end

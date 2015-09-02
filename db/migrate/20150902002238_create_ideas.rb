class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.text :description, null: false
      t.integer :author_id, null: false

      t.timestamps null: false
    end

    add_index :ideas, :author_id
  end
end

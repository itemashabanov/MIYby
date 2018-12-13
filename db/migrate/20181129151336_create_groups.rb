class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups, id: false do |t|
      t.string :group, null: false
      t.string :specialty
      t.string :specialization

      t.timestamps
    end
    add_index :groups, :group, unique: true
  end
end

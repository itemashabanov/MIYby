class CreateTeachingMaterials < ActiveRecord::Migration[5.1]
  def change
    create_table :teaching_materials do |t|
      t.string :name
      t.string :url
      t.string :discipline_id, null: false

      t.timestamps
    end
    add_index :teaching_materials, :discipline_id
  end
end

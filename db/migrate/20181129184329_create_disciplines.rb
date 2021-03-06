class CreateDisciplines < ActiveRecord::Migration[5.1]
  def change
    create_table :disciplines, id: false do |t|
      t.string :discipline, null: false
      t.string :teacher
      t.string :course
      t.string :specialty_id, null: false

      t.timestamps
    end
    add_index :disciplines, :discipline
    add_index :disciplines, :specialty_id
  end
end

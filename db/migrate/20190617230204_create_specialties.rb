class CreateSpecialties < ActiveRecord::Migration[5.1]
  def change
    create_table :specialties, id:false do |t|
      t.string :specialty, null:false
      t.string :specialization

      t.timestamps
    end
    add_index :specialties, :specialty, unique: true
  end
end

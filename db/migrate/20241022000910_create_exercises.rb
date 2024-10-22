class CreateExercises < ActiveRecord::Migration[7.2]
  def change
    create_table :exercises do |t|
      t.references :workout, null: false, foreign_key: true
      t.string :exercise_name
      t.boolean :is_completed, default: false
      t.string :exercise_type
      t.string :exercise_instruction

      t.timestamps
    end
  end
end

class CreateExerciseSets < ActiveRecord::Migration[7.2]
  def change
    create_table :exercise_sets do |t|
      t.references :workout_exercise, null: false, foreign_key: true
      t.string :reps
      t.time :duration
      t.boolean :is_completed, default: false

      t.timestamps
    end
  end
end

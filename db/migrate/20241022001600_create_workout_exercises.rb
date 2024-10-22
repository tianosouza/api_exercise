class CreateWorkoutExercises < ActiveRecord::Migration[7.2]
  def change
    create_table :workout_exercises do |t|
      t.references :workout, null: false, foreign_key: true
      t.references :exercise, null: false, foreign_key: true
      t.integer :sets
      t.integer :reps

      t.timestamps
    end
  end
end

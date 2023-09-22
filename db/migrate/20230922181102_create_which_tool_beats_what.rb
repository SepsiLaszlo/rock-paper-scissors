class CreateWhichToolBeatsWhat < ActiveRecord::Migration[7.0]
  def change
    create_table :which_tool_beats_whats do |t|
      t.references :tool_that_beats, foreign_key: { to_table: :tools }
      t.references :tool_that_is_beaten, foreign_key: { to_table: :tools }

      t.timestamps
    end
  end
end

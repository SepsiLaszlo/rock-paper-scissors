class Tool < ApplicationRecord
  has_and_belongs_to_many :tools_that_this_can_beat,
                          class_name: "Tool",
                          join_table: 'which_tool_beats_whats',
                          foreign_key: "tool_that_beats_id",
                          association_foreign_key: "tool_that_is_beaten_id"

  def beats?(other_tool)
    tools_that_this_can_beat.include?(other_tool)
  end
end

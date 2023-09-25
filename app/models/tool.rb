class Tool < ApplicationRecord
  has_and_belongs_to_many :tools_that_this_can_beat,
                          class_name: "Tool",
                          join_table: 'which_tool_beats_whats',
                          foreign_key: "tool_that_beats_id",
                          association_foreign_key: "tool_that_is_beaten_id"
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [139, 139]
  end

  validates :name, presence: true
  validate :image_type

  def beats?(other_tool)
    tools_that_this_can_beat.include?(other_tool)
  end

  private

  def image_type
    if image.attached? == false
      errors.add(:image, "is missing!")
    end
    unless image&.content_type&.in?(%('image/jpeg image/png image/svg+xml'))
      errors.add(:image, "needs to be a jpeg, png or svg!")
    end
  end
end

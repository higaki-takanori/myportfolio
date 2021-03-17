class Tool < ApplicationRecord
  belongs_to :play
  validates :tool_content,  presence: true
end

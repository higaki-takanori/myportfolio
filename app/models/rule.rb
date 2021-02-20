class Rule < ApplicationRecord
  mount_uploader :rule_image_path, RuleImageUploader
  belongs_to :play
end

class Rule < ApplicationRecord
  mount_uploader :rule_image_path, RuleImageUploader
end

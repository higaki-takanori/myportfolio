class Rule < ApplicationRecord
  mount_uploader :rule_image_path, RuleImageUploader
  belongs_to :play

  def image_url
    if rule_image_path.nil?
      return default_url
    end
    rule_image_path.url
  end

end

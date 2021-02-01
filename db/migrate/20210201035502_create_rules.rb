class CreateRules < ActiveRecord::Migration[6.0]
  def change
    create_table :rules do |t|
      t.bigint :play_id
      t.text :rule_image_path
      t.text :rule_content
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

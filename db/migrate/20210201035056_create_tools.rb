class CreateTools < ActiveRecord::Migration[6.0]
  def change
    create_table :tools do |t|
      t.bigint :play_id
      t.string :tool_content

      t.timestamps
    end
  end
end

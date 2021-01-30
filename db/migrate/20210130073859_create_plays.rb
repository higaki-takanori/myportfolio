class CreatePlays < ActiveRecord::Migration[6.0]
  def change
    create_table :plays do |t|
      t.string :title
      t.string :place
      t.text :outline
      t.text :winnig_content
      t.integer :min_player
      t.integer :max_player
      t.bigint :user_id
      t.text :play_image_path
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

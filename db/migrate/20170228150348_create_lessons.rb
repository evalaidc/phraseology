class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :photo_url
      t.string :link_url
      t.string :summary

      t.references :language, index: true, foreign_key: true
      t.timestamps
    end
  end
end

class CreateLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :languages do |t|
      t.string :level
      t.string :description
      t.string :photo_url

      t.timestamps
    end
  end
end

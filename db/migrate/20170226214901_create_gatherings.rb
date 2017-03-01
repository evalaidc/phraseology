class CreateGatherings < ActiveRecord::Migration[5.0]
  def change
    create_table :gatherings do |t|
      t.string :topic
      t.string :location
      t.datetime :start_time, :null => false, :default => Time.now
      t.datetime :end_time, :null => false, :default => Time.now
      t.string :photo_url
      t.string :description
      t.references :language, index: true, foreign_key: true
      t.timestamps
    end
  end
end

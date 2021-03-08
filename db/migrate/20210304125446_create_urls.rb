class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string :url
      t.boolean :is_processed, default: false
      t.timestamps
    end
  end
end

class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.text :title
      t.text :body
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

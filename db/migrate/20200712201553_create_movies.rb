class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :url
      t.references :author

      t.timestamps
    end
  end
end

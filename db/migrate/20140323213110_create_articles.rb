class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :url
      t.string :source
      t.string :publication_date

      t.timestamps
    end
  end
end

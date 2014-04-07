class CreateMentions < ActiveRecord::Migration
  def change
    create_table :mentions do |t|
      t.references :article, index: true
      t.references :team, index: true

      t.timestamps
    end
  end
end

class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :location
      t.string :nickname

      t.timestamps
    end
  end
end

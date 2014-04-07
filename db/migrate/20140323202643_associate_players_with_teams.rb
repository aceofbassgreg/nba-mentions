class AssociatePlayersWithTeams < ActiveRecord::Migration
  def change
    add_reference :players, :team
  end
end

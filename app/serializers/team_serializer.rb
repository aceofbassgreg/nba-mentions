class TeamSerializer < ActiveModel::Serializer
  attributes :id, :location, :nickname
  has_many :players, serializer: PlayerWithoutTeamSerializer
end

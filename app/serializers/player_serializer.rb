class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :age
  has_one :team, serializer: TeamWithoutPlayersSerializer
end

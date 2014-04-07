class MentionSerializer < ActiveModel::Serializer
  attributes :id
  has_one :article
  has_one :team
end

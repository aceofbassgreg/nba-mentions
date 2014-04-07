class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :url, :source, :publication_date
end

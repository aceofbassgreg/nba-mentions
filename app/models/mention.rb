class Mention < ActiveRecord::Base
  belongs_to :article
  belongs_to :team
end

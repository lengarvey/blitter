class Bleat
  include Mongoid::Document
  include Mongoid::Timestamps
  field :body, :type => String
  field :author, :type => String

  belongs_to :user
end

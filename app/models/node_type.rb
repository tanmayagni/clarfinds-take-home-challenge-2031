class NodeType < ApplicationRecord
  belongs_to :graph
  has_many :nodes, dependent: :destroy
end

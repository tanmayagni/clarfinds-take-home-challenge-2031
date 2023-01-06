class Graph < ApplicationRecord
  has_many :node_types, dependent: :destroy
  has_many :nodes, dependent: :destroy
  has_many :links, dependent: :destroy
end

class Node < ApplicationRecord
  belongs_to :graph
  belongs_to :node_type
  has_many :outgoing_links, class_name: "Link", foreign_key: :source_id, dependent: :destroy
  has_many :incoming_links, class_name: "Link", foreign_key: :target_id, dependent: :destroy
  has_many :target_nodes, through: :outgoing_links, class_name: "Node", source: :target
  has_many :source_nodes, through: :incoming_links, class_name: "Node", source: :source
end

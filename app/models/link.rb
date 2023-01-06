class Link < ApplicationRecord
  belongs_to :graph
  belongs_to :source, class_name: "Node"
  belongs_to :target, class_name: "Node"
end

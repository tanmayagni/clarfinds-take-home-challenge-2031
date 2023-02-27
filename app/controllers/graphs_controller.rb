class GraphsController < ApplicationController
  def show
    @graph = Graph.find(params[:id])
    if @graph.present?
      respond_to do |format|
        format.html
        format.json do 
          @graph_data = graph_data(@graph)
          render json: { graph: @graph, data: @graph_data }
        end
      end
    end
  end
  
  private

  def graph_data(graph)
    {
      nodes: graph.nodes.includes(:node_type).map { |node| node_data(node) },
      links: graph.links.map { |link| link_data(link) }
    }
  end

  def node_data(node)
    {
      id: node.id,
      name: node.name,
      type: node.node_type.name
    }
  end

  def link_data(link)
    {
      source: link.source_id,
      target: link.target_id
    }
  end
end

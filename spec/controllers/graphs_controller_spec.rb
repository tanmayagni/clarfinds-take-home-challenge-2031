# spec/controllers/graphs_controller_spec.rb

require 'rails_helper'

RSpec.describe GraphsController, type: :controller do
  describe "GET #show" do
    let!(:graph) { FactoryBot.create(:graph, name: 'Test Graph') }
    let!(:node_type) { FactoryBot.create(:node_type, graph: graph) }
    let!(:node1) { FactoryBot.create(:node, name: "Node 1", node_type: node_type, graph: graph) }
    let!(:node2) { FactoryBot.create(:node, name: "Node 2", node_type: node_type, graph: graph) }
    let!(:link) { FactoryBot.create(:link, source: node1, target: node2, graph: graph) }

    it "returns JSON data for the requested graph" do
      get :show, params: { id: graph.id, format: 'json' }

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json["graph"]["id"]).to eq(graph.id)
      expect(json["graph"]["name"]).to eq("Test Graph")
      expect(json["data"]["nodes"].size).to eq(2)
      expect(json["data"]["links"].size).to eq(1)
      expect(json["data"]["nodes"].first["name"]).to eq("Node 1")
    end
  end
end

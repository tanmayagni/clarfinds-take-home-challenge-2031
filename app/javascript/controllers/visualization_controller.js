import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['nodeCount', 'linkCount'];

  async connect() {
    const response = await fetch(`/graphs/${this.element.dataset.graphId}.json`);
    const graphData = await response.json();

    this.nodeCountTarget.textContent = graphData.data.nodes.length;
    this.linkCountTarget.textContent = graphData.data.links.length;
  }
}

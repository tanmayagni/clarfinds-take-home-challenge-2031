import { Controller } from "@hotwired/stimulus"
import { load } from "../load"

export default class extends Controller {
  static targets = ['nodeCount', 'linkCount']
  
  connect = () => {
    load().then(data => {
      this.updateCounts(data.nodes.length, data.links.length)
    }).catch(error => {
      console.error(error)
    })
  }
  
  updateCounts = (nodeCount, linkCount) => {
    this.nodeCountTarget.textContent = nodeCount
    this.linkCountTarget.textContent = linkCount
  }
}

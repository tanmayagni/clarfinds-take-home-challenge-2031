export const load = () => {
  const sampleData = {
    "nodes": [
      {"id": "1", "name": "Example node 1", "graphId": 1, "nodeTypeId": 1, "adjacentNodeIds": [2, 3]},
      {"id": "2", "name": "Example node 2", "graphId": 1, "nodeTypeId": 1, "adjacentNodeIds": [1]},
      {"id": "3", "name": "Example node 3", "graphId": 1, "nodeTypeId": 1, "adjacentNodeIds": [1]}
    ],
    "links": [
      {"id": "1", "graphId": 1, "sourceId": "1", "targetId": "2"},
      {"id": "2", "graphId": 1, "sourceId": "1", "targetId": "3"}
    ]
  }
  
  return new Promise((resolve, reject) => {
    if (!sampleData) {
      reject('No data to load')
    }
    resolve(sampleData)
  })
}
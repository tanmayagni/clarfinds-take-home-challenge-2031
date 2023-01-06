## Before we begin

Please record how much time you spend on the following phases:

- Reading (this readme, the codebase, documentation, etc.)
- Thinking / designing / planning
- Implementing Ruby functionality \*
- Implementing JavaScript functionality \*
- Writing specs \*
- Refactoring \*

The combined time for phases marked with an asterisk (\*) constitutes your *total time working*. All phase amounts together make up your *total time spent*. Work in the order that best suits you.

Should we end up working together, you will of course **no longer be asked** to do this. I ask for it now because it helps me better evaluate your work.

If this were a ticket, I would go into a bit of depth to share my thoughts on implementation, and we'd have an open door policy to discuss issues as they crop up.
 
Instead, I've written this specification so we can agree on what would constitute a valid solution. That means you shouldn't hesitate to reach out with any questions around these requirements specifically, until you feel like you have a clear picture of the task.

The challenge is intended to be simple to implement. All in all, you should spend no more than a handful of hours of *total time working* on it. You have a total of 48 hours to hand it in.

---

## App overview

Clara is a data visualization app which helps users manage and visualize graphs.

Graphs are made up of nodes and links. Nodes belong to a node type. Links connect two nodes as source and target.

The schema reflects these relationships and has already been implemented. Data is stored within `graphs`, `node_types`, `nodes`, and `links` tables.

There is a frontend component set up to consume sample JSON data via `load.js`, intended to replace a full-fledged visualization.

Your task is to render, deliver and read graph JSON data for any given graph.

- Your solution should aim to deliver graph JSON data containing 1k-50k nodes and 1k-100k links each
- Optimize for a high-read/low-write scenario, i.e. one where the final JSON is often consumed but seldom generated anew
- Ensure the frontend component uses data served from the backend when you're done (i.e. I can visit `localhost:3000/graphs/1` and see the relevant counts)

#### JSON schema

This is what a node's JSON looks like:

```
{
  "id": 1,
  "name": "Example node",
  "graphId": 1,
  "nodeTypeId": 1,
  "adjacentNodeIds": [
    2,
    3
  ]
}
```

Here is a link:

```
{
  "id": 1,
  "graphId": 1,
  "sourceId": 1,
  "targetId": 2
}
```

Together, they make a graph, like so:

```
{
  nodes: [{...}, ...],
  links: [{...}, ...]
}
```

## Your solution

Remember: we're looking for a clear communicator, in prose as well as code. Someone who has reliable technical skill, knows the tools inside and out, is wary of feature scope creep, and has a penchant for independence.

A quicker solution (in terms of *total time spent*) beats a slower one, but only if they are of equivalent quality.

A clean, well thought out solution handed in at the last minute with a more sizeable amount of *total time spent* is better than a hastily implemented rough-shod solution handed in within a few hours of starting.

Add specs and structure your code as you see fit—i.e. change, add, and remove files at your leisure.

Be precise in your implementation and, where useful, verbose in your code comments and commit messages. If you'd like to, you can attach any notes you take as you work.

When reviewing your solution, I expect to be able to run a suite of green specs, and then seed the database and run the app to see the JSON being served in the browser.

In general, share what information you deem useful, and withhold what you deem irrelevant.

> For example, when tracking time, total time per phase is what matters. If you had to e.g. go back to the drawing board multiple times and you feel like knowing about this will help my understanding of your commit history, you may decide to e.g. additionally share how you alternated between phases.

If there are places in the codebase where you imagine related changes may happen in the immediate future, but you feel like they are out of the scope of this challenge, leave behind a TODO comment

```
# TODO Turbo encabulator will be prefabulated here
```

or a pending spec

```
pending { is_expected.to prefabulate_turbo_encabulator }
```

## Requirements

- [ ] Generate JSON for any given graph
- [ ] Deliver JSON efficiently via API endpoint(s)
- [ ] Consume API endpoint(s) from a Stimulus.js controller which displays the number of nodes and links per graph
- [ ] Write suite of specs

## Submitting

Once you've implemented JSON generation, delivery, and specs, you're done :)

Please:
- [ ] Submit your code using GitHub
- [ ] Send any additional documentation, such as your recorded times, via email
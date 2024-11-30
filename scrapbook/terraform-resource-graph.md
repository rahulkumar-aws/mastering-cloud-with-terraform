## Terraform – Visualizing Execution Plans​
You can visualize an execution plan as a graph using the terraform graph command​

Terraform will output a `GraphViz` file (you’ll need GraphViz installed to view the file)​

### What is [GraphViz](https://graphviz.org/)?​ 

open-source tools for drawing graphs specified in DOT language scripts having the file name extension "gv"​

## Terraform – Resource Graph​
Terraform builds a dependency graph from the Terraform configurations, and walks this graph to generate plans, refresh state, and more. ​

When you use terraform graph, this is a visual presentation of the dependency graph​

### What is a dependency graph?​

In mathematics is a directed graph representing dependencies of several objects towards each other​

- `Resource Node​​` :  Represents a single resource​
- `​Resource Meta-Node​​` : Represents a group of resources, but does not represent any action on its own​
- `Provider Configuration Node` : ​​Represents the time to fully configure a provider​

Reference [Resource Graph](https://www.terraform.io/docs/internals/graph.html)

## Terraform Core and Terraform Plugins​
Terraform is logically split into two main parts: ​

- `Terraform Core​`
uses remote procedure calls (RPC) to communicate with Terraform Plugins​
- `Terraform Plugins​`
expose an implementation for a specific service, or provisioner​

Terraform Core is a statically-compiled binary written in the Go programming language.​
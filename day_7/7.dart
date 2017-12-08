import 'dart:io';

void main() {
  final file = new File('./day_7/7.txt');
  final rawInput = file.readAsStringSync().split('\n');
  final nodeSet = new Set<Node>();

  rawInput.forEach((s) {
    nodeSet.add(new Node.fromString(s));
  });

  nodeSet.forEach((n) {
    final parent = nodeSet.firstWhere(
        (p) => p.childrenNames?.contains(n.name) ?? false,
        orElse: () => null);

    if (parent != null) {
      n.parent = parent;

      if (parent.children == null) {
        parent.children = new Set<Node>();
      }

      parent.children.add(n);
    }
  });

  final root = part1(nodeSet);

  print('Part 1 Solution: ${root.name}');
}

Node part1(Set<Node> nodes) => nodes.where((n) => n.parent == null).first;


class Node {
  Node parent;
  String name;
  int weight;
  Set<String> childrenNames;
  Set<Node> children;

  Node(this.name, [this.weight = null, this.children = null]);

  Node.fromString(String s) {
    final nameWeightRegex = new RegExp(r'(\w+)+ \(([0-9]+)\)(?:\s->\s(.+)|)');
    final match = nameWeightRegex.firstMatch(s);
    name = match.group(1);
    weight = int.parse(match.group(2));
    if (match.group(3) != null) {
      childrenNames = match.group(3).replaceAll(' ', '').split(',').toSet();
    }
  }

  @override
  bool operator ==(other) {
    if (!(other is Node)) return false;

    return (other as Node).name == name;
  }

  @override
  int get hashCode => name.hashCode;

  int get totalWeight =>
      weight + children?.map((n) => n.weight).reduce((val, el) => val + el) ??
      0;

  bool get childrenAreBalanced =>
      children.map((n) => n.weight).toSet().length == 1;


  int findImbalance(int imbalance) {
    if (imbalance != null && childrenAreBalanced) {
      return weight - imbalance;
    } else {
      
    }
  }
}

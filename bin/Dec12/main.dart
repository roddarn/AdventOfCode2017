import 'input.dart';

Node root;
Map<int,Node> map = {};
int sum = 0;

int groups = 0;

main(List<String> arguments) {
  String input = getInput();
  List<String> lines = input.split('\n');
  createGraph(lines);

//  walk(0);
//  print(sum);

  map.keys.forEach((k) {
    if (!map[k].visited) {
      groups++;
      walk(k);
    }
  });

  print(groups);
}

void walk(int id) {
  Node node = map[id];
  node.visited = true;
  sum++;
  node.children.forEach((c) {
     if (!map[c].visited) {
       walk(c);
     }
  });

}

void createGraph(List<String> lines) {
  lines.forEach((l) {
    List<int> tokens = l.split(new RegExp('[ ,<>-]+')).map((t) => int.parse(t)).toList();
    Node n = new Node(tokens[0]);
    n.children = tokens.sublist(1);
    map[tokens[0]] = n;
  });
  root = map[0];
}

class Node {
  int id;
  List<int> children = [];
  bool visited = false;

  Node(this.id);

}
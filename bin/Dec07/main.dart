import 'input.dart';

class prog {
  String name;
  int weight;
  int totalWight;
  List<prog> childs = [];

  prog(this.name,this.weight);

  String toString() => "$name $weight $totalWight";
}

Map<String,prog> progSet = {};

main(List<String> arguments) {

  String input = getInput();
  List<String> lines = input.split('\n');
  lines.forEach((line) => parseLine1(line));

  lines.forEach((line) => parseLine2(line));

  print(progSet.keys);
  prog root = findRoot();


  setTotalWeight(root);

}

setTotalWeight(prog p) {
  if (p.childs.isEmpty)
    p.totalWight = p.weight;
  else {
    p.childs.forEach((c) => setTotalWeight(c));

    bool ok = true;
    for (int i = 0 ;i<p.childs.length-1;i++) {
      ok = ok && p.childs[i].totalWight == p.childs[i+1].totalWight;
    }
    if (!ok)
      print(p.childs);

    int childSum = 0;
    p.childs.forEach((c) => childSum += c.totalWight);
    p.totalWight = p.weight + childSum;;
  }
  
  
}

//qhvca (428) -> odttvb, ymehff, ymyzbqc, jtdtmsi, wciuyuh

parseLine1(String line) {
  List<String> tokens = line.split(new RegExp('[ )(,]+'));
  prog p = new prog(tokens[0], int.parse(tokens[1]));
  progSet[tokens[0]]=p;
}

parseLine2(String line) {
  List<String> tokens = line.split(new RegExp('[ )(,]+'));
  if (tokens.length > 2) {
    tokens.sublist(3).forEach((child) {
      print("${tokens[0]} $child");
      progSet[tokens[0]].childs.add(progSet[child]);
    });
  }
}

prog findRoot() {
  Set<String> s = progSet.keys.toSet();
  progSet.values.expand((p) => p.childs).forEach((c) => s.remove(c.name));

  print(s);
  return progSet[s.first];

}

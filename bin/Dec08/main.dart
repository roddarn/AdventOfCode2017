import 'input.dart';
import 'dart:math' as math;
main(List<String> arguments) {

  String input = getInput();
  List<String> lines = input.split('\n');
  Map<String,int> regs = {};
  int globalMax = 0;

  lines.forEach((l) => regs[l.split(' ')[0]] = 0);

  lines.forEach((l) {
    List<String> tokens = l.split(' ');
    String op = tokens[5];
    String ifreg = tokens[4];
    int ifval = int.parse(tokens[6]);
    bool ok = true;
    switch(op) {
      case '>':
        ok = regs[ifreg] > ifval;
        break;
      case '<':
        ok = regs[ifreg] < ifval;
        break;
      case '>=':
        ok = regs[ifreg] >= ifval;
        break;
      case '==':
        ok = regs[ifreg] == ifval;
        break;
      case '<=':
        ok = regs[ifreg] <= ifval;
        break;
      case '!=':
        ok = regs[ifreg] != ifval;
        break;
    }

    if (ok) {
      if (tokens[1] == 'inc')
        regs[tokens[0]] += int.parse(tokens[2]);
      else
        regs[tokens[0]] -= int.parse(tokens[2]);
    }
    globalMax = math.max(globalMax, regs.values.reduce((a,b) => math.max(a, b)));

  });

  int max = regs.values.reduce((a,b) => math.max(a, b));
  print(max);
  print(globalMax);



}

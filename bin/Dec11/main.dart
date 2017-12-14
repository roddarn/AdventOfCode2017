import 'input.dart';

import 'dart:math' as math;
main(List<String> arguments) {
  String input = getInput();
  List<String> directions = input.split(',');

  Map<String,int> total = {};

  directions.forEach((dir) => total[dir] = total.containsKey(dir) ? total[dir] + 1 : 1);

  print(total);

  total['s'] -= total['n'];
  total.remove('n');
  total['se'] -= total['nw'];
  total.remove('nw');
  total['ne'] -= total['sw'];
  total.remove('sw');

  print(total);
  // 687



  int x = 0;
  int y = 0;
  int max = 0;
  directions.forEach((dir) {
    switch (dir) {
      case 'n':
        y++;
        break;
      case 's':
        y--;
        break;
      case 'ne':
        y++;
        x++;
        break;
      case 'se':
        x++;
        break;
      case 'nw':
        x--;
        break;
      case 'sw':
        x--;
        y--;
        break;
    }
    int dist = getDist(x, y);
    max = math.max(max, dist);
  });
  int dist = getDist(x, y);
  print(dist);
  print(max);

}

int getDist(int x,int y) {
  int d = y - x;
  return math.max(math.max(x.abs(), y.abs()), d.abs());

}
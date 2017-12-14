import 'input.dart';

String input = getInput();

main(List<String> arguments) {
//  print(input);
  DateTime startT = new DateTime.now();
  List<String> lines = input.split('\n');
  int length = int.parse(lines.last.split(':').first);

  List<int> firewall = new List<int>.generate(length + 1, (int i) => 0);

  lines.forEach((l) {
    List<int> val =
        l.split(new RegExp('[: ]+')).map((s) => int.parse(s)).toList();
    firewall[val[0]] = val[1];
  });

  int startTime = 1;
  int co = 0;
  bool ok = true;
  do {
    startTime++;
    int cost = 0;
    int pos = 0;
    int time = startTime;
    ok = true;
    while (pos < length + 1) {
      int range = firewall[pos];
//      print("p: $pos t: $time r: $range c: $cost");
      if (range != 0) {
        if ((time % (range * 2 - 2)) == 1) {
//          print("p: $pos r: $range");
//          cost += pos * range;
          ok = false;
          break;
        }
      }
      pos++;
      time++;
    }
    co = cost;
//    print(startTime);
//    print(co);
//    print("----------------------------------");
  } while (co > 0 || !ok);
  print(startTime-1);

  DateTime endT = new DateTime.now();
  Duration dur = endT.difference(startT);

  print("$startT $endT $dur");

}

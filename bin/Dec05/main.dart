import 'input.dart';
main(List<String> arguments) {

  String input = getInput();

  List<int> values = input.split('\n').map((s) => int.parse(s)).toList();
  int pointer = 0;
  int steps = 0;
  while(pointer < values.length) {
//    int jump = values[pointer]++;
    int jump = values[pointer];

    if (jump <3)
      values[pointer]++;
    else
      values[pointer]--;
    pointer += jump;
    steps++;
  }
  print(steps);

}

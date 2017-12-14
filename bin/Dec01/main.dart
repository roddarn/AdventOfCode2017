import 'input.dart';
main(List<String> arguments) {
  String input = getInput();
  int i = 0;
  int sum = 0;
  int sum2 = 0;
  int length = input.length;

  while(i<length) {
    if (input[i] == input[(i+1)%length])
      sum = sum + int.parse(input[i]);
    if (input[i] == input[(i+(length/2).floor())%length])
      sum2 = sum2 + int.parse(input[i]);
    i++;
  }
  print(sum);
  print(sum2);
  }

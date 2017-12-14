import 'input.dart';

String input = getInput();

int garbSum = 0;
main(List<String> arguments) {


  int sum = 0;
  int level = 1;

  for(int i = 0;i < input.length;i++) {
    if (input[i] == '{') {
      sum += level++;
    }
    if (input[i] == '}') {
      level--;
    }
    if (input[i] == '!') {
      i++;
    }

    if (input[i] == '<') {
      i = forwardGarb(++i);
    }

  }
  
  print(sum);
  print(garbSum);
}

int forwardGarb(int i) {
  while(input[i] != '>') {
    if (input[i] == '!') {
      i += 2;
    } else {
      i++;
      garbSum++;
    }
  }

  return i;
}

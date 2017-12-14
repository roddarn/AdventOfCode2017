
String input = "14	0	15	12	11	11	3	5	1	6	8	4	9	1	8	4";

main(List<String> arguments) {
  List<int> banks = input.split("\t").map((i) => int.parse(i)).toList();

  List<String> mem = new List();
  int count = 0;
  while(!mem.contains(banks.toString())) {
    mem.add(banks.toString());
    int index = getLarge(banks);
    distribute(banks, index);
    count++;
  }
  print(mem.indexOf(banks.toString()));
  print(count);
  print(count - mem.indexOf(banks.toString()));
}

int getLarge(List<int> banks) {
  int index = 0;
  int max = 0;
  for (int i=0;i<banks.length;i++) {
    if (banks[i] > max) {
      index = i;
      max = banks[i];
    }
  }
  return index;
}

void distribute(List<int> banks,int index) {
  int value = banks[index];
  banks[index] = 0;
  while (value > 0) {
    index = (index + 1) % banks.length;
    banks[index]++;
    value--;
  }
}
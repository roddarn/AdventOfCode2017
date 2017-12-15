main(List<String> arguments) {
//  part1();
  part2();

}

part1() {
//  int a = 65;
//  int b = 8921;

  int a = 289;
  int b = 629;


  int amulti = 16807;
  int bmulti = 48271;

  int div = 2147483647;
  int mask = 0xffff;

  int count = 0;
  for (int i = 0 ; i < 40000000;i++) {
    a = (a * amulti) % div;
    b = (b * bmulti) % div;

    if ((a & mask) == (b & mask)) {
      count++;
//      print(count);
    }
//    print(a);
//    print(b);
  }

  print(count);
  
}

part2() {
  generator agen = new generator(289, 4, 16807);
  generator bgen = new generator(629, 8, 48271);
  int mask = 0xffff;


  int count = 0;
  for (int i = 0 ; i < 5000000;i++) {
    int a = agen.getNext();
    int b = bgen.getNext();
    if ((a & mask) == (b & mask)) {
      count++;
//      print(count);
    }
//    print(a);
//    print(b);
  }

  print(count);

}

class generator {
  int value;
  int gate;
  int  multi;
  int div = 2147483647;

  generator(this.value,this.gate,this.multi);
  
  int getNext() {
    do {
      value = (value * multi) % div;
    } while(value%gate != 0);
    return value; 
  }

}
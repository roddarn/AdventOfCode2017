import 'dart:convert' as conv;

int size = 256;

String knotHash(String input) {
//  List<int> lengths = input.split(',').map((i) => int.parse(i)).toList();
  List<int> lengths = conv.ASCII.encode(input).toList();
  lengths.addAll([17, 31, 73, 47, 23]);

  List<int> circle = new List<int>.generate(size, (int i) => i);
  int skip = 0;
  int index = 0;

  for (int i = 0;i < 64 ; i++) {
    lengths.forEach((l) {
//      print("Before $circle i: $index s: $skip l: $l");
      revSublist(circle, index, index + l);
      index = (index + l + skip) % size;
      skip++;
//      print("After $circle i: $index s: $skip l: $l");
//      print('');
    });
  }

//  print(circle[0] * circle[1]);
//  print(hex(circle));
  return(hex(circle));
}


String hex(List<int> circle) {
  String hex = "";
  for (int i = 0;i <16 ; i++) {
    int xorsum = 0;
    for (int j = 0;j <16 ; j++) {
      xorsum = xorsum ^ circle[i*16+j];
    }

    hex = hex + xorsum.toRadixString(16).padLeft(2,'0');
  }
  return hex;
}

void revSublist(List<int> circle,int start,int end) {


  List<int> sub = [];
  for(int i = start; i < end ; i++) {
    sub.add(circle[i%size]);
  }
  sub = sub.reversed.toList();

  for(int i = 0; i < sub.length ; i++) {
    circle[(start+i)%size] = sub[i];
  }
}

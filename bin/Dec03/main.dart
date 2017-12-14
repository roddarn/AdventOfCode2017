import 'dart:core';

Map<String,int> store = {};

main(List<String> arguments) {
  int rad = 1;

  int i = 1;
  int x = 0;
  int y = 0;

  int end = 265;
//  int end = 265149;


//  pr(1,x,y);
  store["0,0"] = 1;

  while (i < end){
    for (int j = 0 ;j < rad ; j++) {
      x++;
      i++;
      pr(i,x,y);
    }
    for (int j = 0 ;j < rad ; j++) {
      y--;
      i++;
      pr(i,x,y);
    }
    rad++;
    for (int j = 0 ;j < rad ; j++) {
      x--;
      i++;
      pr(i,x,y);
    }
    for (int j = 0 ;j < rad ; j++) {
      y++;
      i++;
      pr(i,x,y);
    }
    rad++;
  }
}

pr(int i,int x,int y) {
  int dist = x.abs() + y.abs();
  print ("i: $i  x: $x  y: $y dist: $dist ");

  int sum = 0;
  sum = sum + (store.containsKey(sc(x+1, y)) ? store[sc(x+1, y)] : 0 );
  sum = sum + (store.containsKey(sc(x+1, y+1)) ? store[sc(x+1, y+1)] : 0 );
  sum = sum + (store.containsKey(sc(x, y+1)) ? store[sc(x, y+1)] : 0 );
  sum = sum + (store.containsKey(sc(x-1, y+1)) ? store[sc(x-1, y+1)] : 0 );
  sum = sum + (store.containsKey(sc(x-1, y)) ? store[sc(x-1, y)] : 0 );
  sum = sum + (store.containsKey(sc(x-1, y-1)) ? store[sc(x-1, y-1)] : 0 );
  sum = sum + (store.containsKey(sc(x, y-1)) ? store[sc(x, y-1)] : 0 );
  sum = sum + (store.containsKey(sc(x+1, y-1)) ? store[sc(x+1, y-1)] : 0 );

  store[sc(x, y)] = sum;
  print ("i: $i  x: $x  y: $y dist: $dist sum: $sum");

}

String sc(x,y) => "$x,$y";


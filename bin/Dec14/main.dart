import '../Dec10/knowHash.dart';

String input = 'hwlqcszp';
//String input = 'flqrgnkx';

main(List<String> arguments) {
  int sum = 0;
  List<List<bool>> disk = [];

  for (int i = 0; i < 128; i++) {
    String hash = knotHash("$input-$i");
    String bin = hash
        .split('')
        .map((c) => int.parse(c, radix: 16).toRadixString(2).padLeft(4, '0'))
        .toList()
        .join('');
    disk.add(bin.split('').map((c) => c == '1').toList());
    sum +=
        bin.split('').fold(0, (int sum, String c) => sum += c == '1' ? 1 : 0);
  }
  print(sum);

  int regions = 0;
  for (int x = 0; x < 128; x++)
    for (int y = 0; y < 128; y++)
      if (disk[x][y]) {
        regions++;
        walkRegion(disk, x, y);
      }
  print(regions);
}

walkRegion(List<List<bool>> disk, int x, int y) {
  disk[x][y] = false;
  if (x > 0 && disk[x - 1][y]) walkRegion(disk, x - 1, y);
  if (x < 127 && disk[x + 1][y]) walkRegion(disk, x + 1, y);
  if (y > 0 && disk[x][y - 1]) walkRegion(disk, x, y - 1);
  if (y < 127 && disk[x][y + 1]) walkRegion(disk, x, y + 1);
}

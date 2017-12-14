import 'input.dart';

main(List<String> arguments) {
  String input = getInput();

  List<String> lines = input.split("\n");

  int count = 0;
  int count2 = 0;
  for (String line in lines) {
    Set<String> saved = new Set();
    List<String> words = line.split(' ');
    bool ok = true;
    bool ok2 = true;
    words.forEach((w) {
      ok = ok && !saved.contains(w);
      ok2 = ok2 && !containsAna(w, saved);
      saved.add(w);
    });

    if (ok) count++;
    if (ok2) count2++;
  }

  print(count);
  print(count2);
}

bool containsAna(String w, Set<String> s) {
  for (String sa in s) {
    if (isAnagram(sa, w)) return true;
  }
  return false;
}

bool isAnagram(String a, String b) {
  List<String> al = a.split('');
  al.sort();

  List<String> bl = b.split('');
  bl.sort();

  return al.toString() == bl.toString();
}

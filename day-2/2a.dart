import 'dart:async';
import 'dart:io';

Future main() async {
  final file = new File('./2.txt');
  List<List<int>> rows = new List();
  String rawInput = await file.readAsString();

  rawInput.split('\n').forEach((s) {
    rows.add(s.split('\t').map((s) => int.parse(s)).toList());
  });

  int sum = 0;

  for (int i = 0; i < rows.length; i++) {
    List row = rows[i];
    int min = row[0];
    int max = row[0];

    for (int j = 1; j < row.length; j++) {
      int value = row[j];

      if (value > max) {
        max = value;
      }

      if (value < min) {
        min = value;
      }
    }

    sum += max - min;
  }

  print('Result: $sum');
}

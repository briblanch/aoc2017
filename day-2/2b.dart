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

    for (int j = 0; j < row.length; j++) {
      for (int k = j + 1; k < row.length; k++) {
        int valj = row[j];
        int valk = row[k];

        if (valj < valk) {
          if (valk % valj == 0) {
            sum += valk ~/ valj;
          }
        } else {
          if (valj % valk == 0) {
            sum += valj ~/ valk;
          }
        }
      }
    }
  }

  print('Result: $sum');
}

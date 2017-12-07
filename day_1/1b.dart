import 'dart:async';
import 'dart:io';

Future main() async {
  final file = new File('./1.txt');
  final input = (await file.readAsString())
      .replaceAll('\n', '')
      .split('')
      .map((s) => int.parse(s))
      .toList();

  int sum = 0;

  for (int i = 0; i < input.length; i++) {
    if (input[i] == input[(i + (input.length ~/ 2)) % input.length]) {
      sum += input[i];
    }
  }

  print('Result: $sum');
}

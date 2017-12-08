import 'dart:io';
import 'dart:async';

Future main() async {
  final file = new File('./4.txt');
  final passwords = (await file.readAsString()).split('\n');

  print('Part 1 Solution: ${part1(passwords)}');
  print('Part 2 Solution: ${part2(passwords)}');
}

String part1(List<String> passwords) {
  int validPasswords = 0;

  passwords.forEach((s) {
    final phrases = s.split(' ');
    final phrasesSet = phrases.toSet();

    if (phrases.length == phrasesSet.length) {
      validPasswords++;
    }
  });

  return '$validPasswords';
}

String part2(List<String> passwords) {
  int validPasswords = 0;

  passwords.forEach((s) {
    final phrases = s.split(' ');
    final sortedPhrases = phrases.map((s) {
      return new String.fromCharCodes(new List.from(s.codeUnits)..sort());
    }).toSet();

    if (phrases.length == sortedPhrases.length) {
      validPasswords++;
    }
  });

  return '$validPasswords';
}

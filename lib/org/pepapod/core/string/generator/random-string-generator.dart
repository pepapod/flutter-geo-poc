import 'dart:core';
import 'dart:math';

const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

class RandomStringGenerator {

  String generate(int length) {
    Random rnd = new Random(new DateTime.now().millisecondsSinceEpoch);
    return List.generate(length, (_) => chars[rnd.nextInt(chars.length)]).join();
  }
}

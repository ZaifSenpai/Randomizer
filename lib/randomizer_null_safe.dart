library randomizer_null_safe;

import 'dart:math';
import 'dart:ui';

class Randomizer {
  static Randomizer? _instance;

  late Random _random;

  /// Returns the same Randomizer instance everytime when [seed] is null, but returns a new instance everytime when [seed] is given
  ///
  /// So:
  /// ```
  /// Randomizer.instance() == Randomizer.instance()
  /// ```
  /// but
  /// ```
  /// Randomizer.instance(n) != Randomizer.instance(n)
  /// ```
  ///
  /// __It is recommended to use Randomizer.instance() without seed__
  static Randomizer instance([int? seed]) {
    if (seed != null) {
      return Randomizer._withSeed(seed);
    } else if (_instance == null) {
      _instance = Randomizer._withSeed(seed);
    }
    return _instance!;
  }

  Randomizer._withSeed([int? seed]) {
    _random = Random(seed);
  }

  /// Returns a random Color
  Color randomColor() {
    return Color.fromARGB(
      255,
      randomIntInRange(0, 255),
      randomIntInRange(0, 255),
      randomIntInRange(0, 255),
    );
  }

  /// Returns a random Color with Opacity
  Color randomColorWithOpacity() {
    return Color.fromRGBO(
      randomIntInRange(0, 255),
      randomIntInRange(0, 255),
      randomIntInRange(0, 255),
      _random.nextDouble(),
    );
  }

  /// Returns a value from a random index in given list
  ///
  /// List should be non-empty
  T randomElementFromList<T>(List<T> list) {
    assert(list.length > 0);
    return list[_random.nextInt(list.length)];
  }

  /// Returns a random int in range of [[0, 1<<32]]
  ///
  /// If [max] is given, then return random int in range of
  /// [[0, max]]. max should be non-negative
  ///
  /// If [includeNegative] is true, this will return value in range
  /// of [[-(1<<32), 1<<32]]. If [max] is also given, then return value
  /// in range [[-max, max]]
  int randomInt({
    int? max,
    bool includeNegative = false,
  }) {
    max ??= (1 << 32) - 1;

    assert(max >= 0);

    return includeNegative && _random.nextBool()
        ? -_random.nextInt(max)
        : randomIntInRange(
            0,
            max,
          ); // not using nextInt() because its range is [1, 1<<32]
  }

  /// Return a random int in the range
  /// of [[start], [end]]
  ///
  /// Example:
  /// [randomIntInRange(-2, 2)] will return an int N such that
  /// -2 ≤ N ≤ 2
  int randomIntInRange(int start, int end) {
    assert(end >= start);
    return _random.nextInt(end - start + 1) + start;
  }

  /// Returns a random double in range of (0, double.maxFinite)
  ///
  /// If [max] is given, then return random double in range of
  /// (0, [max]). [max] should be non-negative
  ///
  /// If [includeNegative] is true, return value in range
  /// of (-double.maxFinite, double.maxFinite). If [max] is also given, then return value
  /// in range (-[max], [max])
  double randomDouble({
    double? max,
    bool includeNegative = false,
  }) {
    max ??= double.maxFinite;

    assert(max >= 0);

    double value = randomDoubleInRange(0, max);

    return includeNegative && _random.nextBool() ? -value : value;
  }

  /// Return a random double in the range of ([start], [end])
  ///
  /// Example:
  /// [randomDoubleInRange(-2, 2)] will return a double D such that
  /// -2 < D < 2
  double randomDoubleInRange(double start, double end) {
    assert(end >= start);
    return _random.nextDouble() * (end - start) + start;
  }
}

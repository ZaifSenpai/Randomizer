## randomizer_null_safe

[![GitHub stars](https://img.shields.io/github/stars/ZaifSenpai/randomizer)](https://github.com/ZaifSenpai/randomizer/stargazers) [![pub package](https://img.shields.io/pub/v/randomizer_null_safe)](https://pub.dev/packages/randomizer_null_safe)

Flutter package which helps in picking random color, random element from list, random numbers,
random doubles and many more.

###### Fork of [randomizer](https://github.com/SivaramNalliboyana/Randomizer) with null-safety, optimized code, new functions and example project.

## Usage

* ### Instantiate Randomizer without seed

Use `Randomizer.instance()` to get same static instance everytime.

```
Randomizer r1 = Randomizer.instance();
Randomizer r2 = Randomizer.instance();
// r1 and r2 uses same instance
```

This is recommended way to use Randomizer

* ### Instantiate Randomizer with seed

Use `Randomizer.instance(seed)` to initiate Randomizer with your custom seed. This will also return
a different instance of `Randomizer` everytime even if seed is same.

```
Randomizer r1 = Randomizer.instance(N1);
Randomizer r2 = Randomizer.instance(N2);
// r1 and r2 uses different instances
```

Only use your own seed if you know what you are doing

* ### Generate random color

```
Color color1 = randomizer.randomColor();
Color color3 = randomizer.randomColorWithOpacity();
```

* ### Get random value from a non-empty list

```
int num = randomizer.randomElementFromList([0, 1, 2, 3]);
```

* ### Get random integer values

```
int num1 = randomizer.randomInt();
int num2 = randomizer.randomInt(max: 1000);
int num3 = randomizer.randomInt(includeNegative: true);
int num4 = randomizer.randomInt(max: 1000, includeNegative: true);
int num5 = randomizer.randomIntInRange(10000, 999999);
```

* ### Get random double values

```
double num1 = randomizer.randomDouble();
double num2 = randomizer.randomDouble(max: 99);
double num3 = randomizer.randomDouble(includeNegative: true);
double num4 = randomizer.randomDouble(max: 99, includeNegative: true);
double num5 = randomizer.randomDoubleInRange(10, 99);
```

## Screenshot

![Example](./screenshot.jpg)

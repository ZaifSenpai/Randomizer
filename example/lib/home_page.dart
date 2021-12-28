import 'package:flutter/material.dart';
import 'package:randomizer_null_safe/randomizer_null_safe.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Randomizer _randomizer;

  final List<int> _list = List.generate(
    1000,
    (i) => i,
  );

  @override
  void initState() {
    super.initState();

    _randomizer = Randomizer.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(-0.4, -0.8),
              stops: [0.0, 0.5, 0.5, 1],
              colors: [
                Colors.black12,
                Colors.white,
                Colors.black12,
                Colors.white,
              ],
              tileMode: TileMode.repeated,
            ),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Divider(),
              const Text(
                "Randomizer Example",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(),
              const Text("_randomizer.randomColor():"),
              _ColorBox(_randomizer.randomColor()),
              const Divider(),
              const Text("_randomizer.randomColorWithAlpha():"),
              _ColorBox(_randomizer.randomColorWithAlpha()),
              const Divider(),
              const Text("_randomizer.randomColorWithOpacity():"),
              _ColorBox(_randomizer.randomColorWithOpacity()),
              const Divider(),
              const Text(
                "_randomizer.randomElementFromList([0, 1, 2, ..., 999]):",
              ),
              Text(
                _randomizer.randomElementFromList(_list).toString(),
              ),
              const Divider(),
              const Text("_randomizer.randomInt()"),
              Text(_randomizer.randomInt().toString()),
              const Divider(),
              const Text("_randomizer.randomInt(max: 1000)"),
              Text(_randomizer.randomInt(max: 1000).toString()),
              const Divider(),
              const Text(
                "_randomizer.randomInt(max: 1000, includeNegative: true)",
              ),
              Text(
                _randomizer
                    .randomInt(
                      max: 1000,
                      includeNegative: true,
                    )
                    .toString(),
              ),
              const Divider(),
              const Text("_randomizer.randomIntInRange(10000, 999999)"),
              Text(_randomizer.randomIntInRange(10000, 999999).toString()),
              const Divider(),
              const Text("_randomizer.randomDouble()"),
              Text(_randomizer.randomDouble().toString()),
              const Divider(),
              const Text("_randomizer.randomDouble(max: 99)"),
              Text(_randomizer.randomDouble(max: 99).toString()),
              const Divider(),
              const Text(
                "_randomizer.randomDouble(max: 99, includeNegative: true)",
              ),
              Text(
                _randomizer
                    .randomDouble(
                      max: 99,
                      includeNegative: true,
                    )
                    .toString(),
              ),
              const Divider(),
              const Text("_randomizer.randomDoubleInRange(10, 99)"),
              Text(_randomizer.randomDoubleInRange(10, 99).toString()),
              const Divider(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.shuffle),
        onPressed: () {
          setState(() {});
        },
      ),
    );
  }
}

class _ColorBox extends StatelessWidget {
  final Color color;

  const _ColorBox(
    this.color, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 24,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(
              color: Colors.black54,
              width: 0.5,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        const VTDivider(),
        SelectableText(color.toString()),
      ],
    );
  }
}

/// Transparent Divider
class TDivider extends StatelessWidget {
  const TDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(color: Colors.transparent);
  }
}

/// Transparent VerticalDivider
class VTDivider extends StatelessWidget {
  const VTDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const VerticalDivider(color: Colors.transparent);
  }
}

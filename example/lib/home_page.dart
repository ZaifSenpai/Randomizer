import 'package:flutter/material.dart';
import 'package:randomizer_null_safe/randomizer_null_safe.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Randomizer randomizer;

  final List<int> _list = List.generate(
    1000,
    (i) => i,
  );

  @override
  void initState() {
    super.initState();

    randomizer = Randomizer.instance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Divider(height: 32),
                const Text(
                  "Randomizer Example",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                const Text("randomizer.randomColor():"),
                _ColorBox(randomizer.randomColor()),
                const Divider(),
                const Text("randomizer.randomColorWithOpacity():"),
                _ColorBox(randomizer.randomColorWithOpacity()),
                const Divider(),
                const Text(
                  "randomizer.randomElementFromList([0, 1, 2, ..., 999]):",
                ),
                Text(
                  randomizer.randomElementFromList(_list).toString(),
                ),
                const Divider(),
                const Text("randomizer.randomInt()"),
                Text(randomizer.randomInt().toString()),
                const Divider(),
                const Text("randomizer.randomInt(max: 1000)"),
                Text(randomizer.randomInt(max: 1000).toString()),
                const Divider(),
                const Text(
                  "randomizer.randomInt(max: 1000, includeNegative: true)",
                ),
                Text(
                  randomizer
                      .randomInt(
                        max: 1000,
                        includeNegative: true,
                      )
                      .toString(),
                ),
                const Divider(),
                const Text("randomizer.randomIntInRange(10000, 999999)"),
                Text(randomizer.randomIntInRange(10000, 999999).toString()),
                const Divider(),
                const Text("randomizer.randomDouble()"),
                Text(randomizer.randomDouble().toString()),
                const Divider(),
                const Text("randomizer.randomDouble(max: 99)"),
                Text(randomizer.randomDouble(max: 99).toString()),
                const Divider(),
                const Text(
                  "randomizer.randomDouble(max: 99, includeNegative: true)",
                ),
                Text(
                  randomizer
                      .randomDouble(
                        max: 99,
                        includeNegative: true,
                      )
                      .toString(),
                ),
                const Divider(),
                const Text("randomizer.randomDoubleInRange(10, 99)"),
                Text(randomizer.randomDoubleInRange(10, 99).toString()),
                const Divider(),
              ],
            ),
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

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: XylophoneApp(),
    );
  }
}

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  final numbers = [1, 2, 3, 4, 5, 6, 7];

  void playSong(int num) {
    final player = AudioPlayer();
    player.play(AssetSource('note$num.wav'));
  }

  Widget noteWidget(int num, MaterialColor backgroundColor) {
    return Expanded(
        child: ElevatedButton(
            onPressed: () => playSong(num),
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(backgroundColor),
            ),
            child: Text(
              "Note $num",
            )));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            noteWidget(1, Colors.red),
            noteWidget(2, Colors.orange),
            noteWidget(3, Colors.yellow),
            noteWidget(4, Colors.green),
            noteWidget(5, Colors.blue),
            noteWidget(6, Colors.indigo),
            noteWidget(7, Colors.purple),
          ],
        )),
      ),
    );
  }
}

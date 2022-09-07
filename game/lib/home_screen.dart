import 'package:flutter/material.dart';
import './logic.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  bool isSwitched = false;
  String activeplayer = 'X';
  String result = '';
  int turn = 0;
  bool gameover = false;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 17, 22),
      body: SafeArea(
        child: (MediaQuery.of(context).orientation == Orientation.portrait)
            ? Column(
                children: [...FirstBlock(), _expanded(), ...LastBlock()],
              )
            : Row(children: [
                Expanded(
                  child: Column(
                    children: [...FirstBlock(), ...LastBlock()],
                  ),
                ),
                SizedBox(width: 20),
                _expanded()
              ]),
      ),
    );
  }

  OnTape(int index) {
    if (!gameover && Player.validPlaces.contains(index)) {
      Game.PlayGame(index, activeplayer);

      if (Game.checkWinner() != '') {
        gameover = true;
        result = 'Winner is ${Game.checkWinner()}';
      }
      print(activeplayer);
      updateState();
      print(activeplayer);
      if (isSwitched && !gameover) {
        Game.autoplay(activeplayer);
        updateState();
        if (Game.checkWinner() != '') {
          gameover = true;
          result = 'Winner is ${Game.checkWinner()}';
        }
      }
      if (Player.validPlaces.length == 0 && Game.checkWinner() == '') {
        result = "It's draw";
      }
    }
  }

  Expanded _expanded() {
    return Expanded(
      child: Center(
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 1.2,
          children: List.generate(9, (index) {
            return Container(
              child: InkWell(
                onTap: gameover ? null : () => OnTape(index),
                borderRadius: BorderRadius.circular(16),
                child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 15, 76, 126),
                        borderRadius: BorderRadius.circular(16)),
                    alignment: Alignment.center,
                    child: Text(
                      (Player.Playerx.contains(index) == true
                          ? 'X'
                          : Player.playero.contains(index) == true
                              ? 'O'
                              : ''),
                      style: const TextStyle(fontSize: 50, color: Colors.blue),
                    )),
              ),
            );
          }),
        ),
      ),
    );
  }

  List<Widget> FirstBlock() {
    return [
      Container(
        padding: MediaQuery.of(context).systemGestureInsets,
        child: SwitchListTile.adaptive(
            title: const Text(
              'Turn on/off two players',
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            value: isSwitched,
            onChanged: (newValue) {
              setState(() {
                isSwitched = newValue;
              });
            }),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        "It's $activeplayer turn".toUpperCase(),
        style: const TextStyle(fontSize: 50),
      ),
      SizedBox(height: 50)
    ];
  }

  List<Widget> LastBlock() {
    return [
      const SizedBox(
        height: 5,
      ),
      Text(
        result,
        style: const TextStyle(fontSize: 50),
      ),
      Container(
        height: 50,
        width: 100,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              Player.Playerx = [];
              Player.playero = [];
              isSwitched = false;
              activeplayer = 'X';
              result = '';
              turn = 0;
              gameover = false;
              Player.validPlaces = [0, 1, 2, 3, 4, 5, 6, 7, 8];
            });
          },
          child: Icon(Icons.replay),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blueAccent)),
        ),
      ),
      Text(
        'restart',
        style: TextStyle(
          fontSize: 50,
        ),
      )
    ];
  }

  void updateState() {
    setState(() {
      if (activeplayer == 'O')
        activeplayer = 'X';
      else
        activeplayer = 'O';
    });
  }
}

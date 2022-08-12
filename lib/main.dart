import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'instruments/g1000.dart';
import 'instruments/ga_radio.dart';

void main() => runApp(const MaterialApp(home: AppHomePage()));

class AppHomePage extends StatelessWidget {
  const AppHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    return Scaffold(
      appBar:
        AppBar(title: const Text("X-Plane 11 Dashboard"), centerTitle: true),
      drawer:
        Drawer(child: ListView(
          children: [
            const ListTile(title: Text("Layouts", style: TextStyle(fontSize: 20.0))),
            ListTile(title: const Text("G1000"), onTap: (){
              Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => G1000View()),
            );}),
            ListTile(title: Text("GA Radio"), onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GARadioView()),
              );
            }),
            const ListTile(title: Text("737 FMS")),
            const ListTile(title: Text("737 Radio"))
          ],
        )),
      body: Column(
        children: [
          Container(padding: const EdgeInsets.all(25), child: const Center(child: Text("Welcome to X-Plane Dashboard!", style: TextStyle(fontSize: 16.0)))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(child: const Text("App Setup"), onPressed: (){}),
              TextButton(child: const Text("X-Plane Setup"), onPressed: (){})
            ],
          )
        ],
      )
    );
  }
}

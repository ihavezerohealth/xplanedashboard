import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class G1000View extends StatefulWidget {
  const G1000View({Key? key}) : super(key: key);

  @override
  State<G1000View> createState() => _G1000ViewState();
}

class _G1000ViewState extends State<G1000View> {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    // ]);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/g1000.jpg"),
            fit: BoxFit.fill
          )
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 25.0, 0.0, 0.0),
                    child: GestureDetector(
                      child: const Text("test", style: TextStyle(fontSize: 25.0)),
                    )
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
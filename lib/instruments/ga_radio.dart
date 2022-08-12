import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:segment_display/segment_display.dart';
import 'dart:async';
import 'dart:core';

class GARadioView extends StatefulWidget {
  const GARadioView({Key? key}) : super(key: key);

  @override
  State<GARadioView> createState() => _GARadioViewState();
}

class _GARadioViewState extends State<GARadioView> {
  num com1Active = 123.456;
  num com2Active = 123.457;
  num com1Standby = 124.456;
  num com2Standby = 124.457;

  double distance = 0;
  final ratio = 14;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("GA RADIO", style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white60
                  ))
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                    child: SevenSegmentDisplay(size: 7, value: com1Active.toStringAsFixed(3))
                )),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: GestureDetector(
                    onTap: () {
                      num temp = com1Active;
                      com1Active = com1Standby;
                      com1Standby = temp;
                      setState(() {});
                    },
                    onHorizontalDragStart: (details) {distance = 0.00;},
                    onHorizontalDragUpdate: (details) {
                      //distance += details.primaryDelta!;
                      com1Active += num.parse((details.primaryDelta! / ratio).toStringAsFixed(3));
                      setState(() {});
                    },
                    onHorizontalDragEnd: (details) {print(distance);},
                    child: const Image(
                      image: AssetImage("assets/ga_radio/knob.png"),
                      height: 100,
                      width: 100
                    ),
                  ),
                ),
                Expanded(child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SevenSegmentDisplay(size: 7, value: com1Standby.toStringAsFixed(3)),
                ))
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SevenSegmentDisplay(size: 7, value: com2Active.toStringAsFixed(3))
                )),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: GestureDetector(
                    onTap: () {
                      num temp = com2Active;
                      com2Active = com2Standby;
                      com2Standby = temp;
                    },
                    onHorizontalDragStart: (details) {distance = 0.00;},
                    onHorizontalDragUpdate: (details) {
                      //distance += details.primaryDelta!;
                      com2Active += num.parse((details.primaryDelta! / ratio).toStringAsFixed(3));
                      setState(() {});
                    },
                    onHorizontalDragEnd: (details) {print(distance);},
                    child: const Image(
                        image: AssetImage("assets/ga_radio/knob.png"),
                        height: 100,
                        width: 100
                    ),
                  ),
                ),
                Expanded(child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SevenSegmentDisplay(size: 7, value: com2Standby.toStringAsFixed(3)),
                ))
              ],
            ),
          )
        ],
      )
    );
  }
}

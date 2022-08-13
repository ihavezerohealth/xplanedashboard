import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:segment_display/segment_display.dart';
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
  final ratio = 55;

  num frequencyRound(num value) {
    num temp = value % 0.025;
    if (temp < 0) {
      temp = 0.025 + temp;
    } else if (temp == 0) {
      return value;
    }
    return value + 0.025 - temp;
  }

  bool frequencyLimit(num value) {
    if (value > 117.975 && value < 137.000) {
      return true;
    } else {
      return false;
    }
  }

  void handleFrequenciesCom1(num value) {
    num rounded = frequencyRound(value);
    bool limited = frequencyLimit(rounded);
    print(limited);
    if (limited) {
      com1Active = rounded;
    } else if (com1Active.compareTo(117.975).isNegative) {
      com1Active = 117.975;
    } else {
      com1Active = 137.000;
    }
  }
  void handleFrequenciesCom2(num value) {
    num rounded = frequencyRound(value);
    bool limited = frequencyLimit(rounded);
    print(limited);
    if (limited) {
      com2Active = rounded;
    } else if (com2Active.compareTo(117.975).isNegative) {
      com2Active = 117.975;
    } else {
      com2Active = 137.000;
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
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
                      print("ratio $ratio");
                      print("line2 ${details.primaryDelta! / ratio}");
                      print("line3 ${(details.primaryDelta! / ratio).toStringAsFixed(3)}");
                      num temp = com1Active + num.parse((details.primaryDelta! / ratio).toStringAsFixed(3));
                      print("temp1 $temp");
                      handleFrequenciesCom1(temp);
                      setState(() {});
                    },
                    //onHorizontalDragEnd: (details) {handleFrequenciesCom1(com1Active); setState(() {});},
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
                      setState(() {});
                    },
                    onHorizontalDragStart: (details) {distance = 0.00;},
                    onHorizontalDragUpdate: (details) {
                      //distance += details.primaryDelta!;
                      com2Active += num.parse((details.primaryDelta! / ratio).toStringAsFixed(3));
                      handleFrequenciesCom2(com2Active);
                      setState(() {});
                    },
                    onHorizontalDragEnd: (details) {handleFrequenciesCom2(com2Active); setState(() {});},
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

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }
}

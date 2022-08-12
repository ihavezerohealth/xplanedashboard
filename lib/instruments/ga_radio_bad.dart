import 'package:flutter/material.dart';
import 'package:segment_display/segment_display.dart';
import 'dart:async';

class GARadioView extends StatefulWidget {
  const GARadioView({Key? key}) : super(key: key);

  @override
  State<GARadioView> createState() => _GARadioViewState();
}

class _GARadioViewState extends State<GARadioView> {
  double com1Active = 123.456;
  double com1Standby = 122.245;

  double com2Active = 136.42;
  double com2Standby = 124.696;

  late Timer _timer;

  double initial = 0.00;
  double distance = 0.00;

  double ratio = 140.00;

  String fixFrequency(double freq) {
    String newFreq = freq.toString();
    if (freq < 117.975) {
      return "117.975";
    } else if (freq > 137.000) {
      return "137.000";
    }

    if ((com1Active + freq).toString().length > 7) {
      freq = double.parse((freq).toStringAsFixed(3));
    }

    if (newFreq.length == 7) {
      return newFreq;
    } else if (newFreq.length == 6) {
      return ("${newFreq}0");
    } else if (newFreq.length == 5) {
      return ("${newFreq}00");
    } else {
      return ("${newFreq}000");
    }
  }

  int conversion(int value) {
    return (value / ratio).round();
  }

  void frequencyHandling(String frequencyType, int frequencyChange) {
    print("$frequencyChange change");
    if (frequencyType == "com1") {
      com1Active = com1Active + frequencyChange;
    } else {
      com2Active = com2Active + frequencyChange;
    }
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //mainAxisSize: MainAxisSize.min,
              children: [
                Padding(padding: const EdgeInsets.only(left: 15), child: SevenSegmentDisplay(size: 6, value: fixFrequency(com1Active))
                ),
                Expanded(
                    child: FractionallySizedBox(
                      heightFactor: 0.45,
                      widthFactor: 0.35,
                      child: GestureDetector(
                          onTap: () {double temp = com1Active; com1Active = com1Standby; com1Standby = temp;},
                          child: const Image(
                            image: AssetImage("assets/ga_radio/active_standby_switch.png")
                          )
                      ),
                    )
                ),
                SevenSegmentDisplay(size: 6, value: fixFrequency(com1Standby)),
                const SizedBox(width: 20),
                Expanded(
                    child: FractionallySizedBox(
                      heightFactor: 0.9,
                      widthFactor: 0.9,
                      child: GestureDetector(
                          onTap: () {print("tapped");},
                          onHorizontalDragStart: (DragStartDetails details) {initial = details.globalPosition.dx;},
                          onHorizontalDragUpdate: (DragUpdateDetails details) {
                            distance = details.globalPosition.dx - initial;
                            int distance1 = distance.round();
                            int change = conversion(distance1);
                            frequencyHandling("com1", change);
                            print(change);
                          },
                          onHorizontalDragEnd: (DragEndDetails details) {
                            int distance1 = distance.round();
                            int change = conversion(distance1);
                            frequencyHandling("com1", change);
                            distance = 0;
                            initial = 0;
                          },
                          child: const Image(
                              image: AssetImage("assets/ga_radio/knob.png")
                          )
                      ),
                    )
                ),
                const SizedBox(width: 5),
                Expanded(
                    child: FractionallySizedBox(
                      heightFactor: 0.9,
                      widthFactor: 0.9,
                      child: GestureDetector(
                          onTap: () {print("tapped");},
                          child: const Image(
                            image: AssetImage("assets/ga_radio/knob.png")
                          )
                      ),
                    )
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 269),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text("Active", style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black
                )),
                SizedBox(width: 155),
                Text("Standby", style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black
                )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //mainAxisSize: MainAxisSize.min,
              children: [
                Padding(padding: const EdgeInsets.only(left: 15), child: SevenSegmentDisplay(size: 6, value: fixFrequency(com2Active))
                ),
                Expanded(
                    child: FractionallySizedBox(
                      heightFactor: 0.45,
                      widthFactor: 0.35,
                      child: GestureDetector(
                          onTap: () {double temp1 = com2Active; com2Active = com2Standby; com2Standby = temp1;},
                          child: const Image(
                              image: AssetImage("assets/ga_radio/active_standby_switch.png")
                          )
                      ),
                    )
                ),
                SevenSegmentDisplay(size: 6, value: fixFrequency(com2Standby)),
                const SizedBox(width: 20),
                Expanded(
                    child: FractionallySizedBox(
                      heightFactor: 0.9,
                      widthFactor: 0.9,
                      child: GestureDetector(
                          onTap: () {print("tapped");},
                          child: const Image(
                              image: AssetImage("assets/ga_radio/knob.png")
                          )
                      ),
                    )
                ),
                const SizedBox(width: 5),
                Expanded(
                    child: FractionallySizedBox(
                      heightFactor: 0.9,
                      widthFactor: 0.9,
                      child: GestureDetector(
                          onTap: () {print("tapped");},
                          child: const Image(
                              image: AssetImage("assets/ga_radio/knob.png")
                          )
                      ),
                    )
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("", style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white60
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

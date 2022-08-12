import 'package:flutter/material.dart';
import 'package:segment_display/segment_display.dart';

class GARadioView extends StatefulWidget {
  const GARadioView({Key? key}) : super(key: key);

  @override
  State<GARadioView> createState() => _GARadioViewState();
}

class _GARadioViewState extends State<GARadioView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/ga_radio/ga_radio.png"),
                fit: BoxFit.fill,
            )
        ),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 40),
                    Expanded(
                      child: FractionallySizedBox(
                        heightFactor: 0.95,
                        widthFactor: 2,
                        child: GestureDetector(
                          onTap: () {print("tapped");},
                          child: Container(color: Colors.orangeAccent)
                        )
                      ),
                    ),
                    SevenSegmentDisplay(value: "123.45", size: 5),
                    SevenSegmentDisplay(value: "123.45", size: 5),
                    Expanded(
                      child: FractionallySizedBox(
                          heightFactor: 0.9,
                          widthFactor: 1,
                          child: GestureDetector(
                              onTap: () {print("tapped");},
                              child: Container(color: Colors.orangeAccent)
                          )
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: FractionallySizedBox(
                          heightFactor: 0.9,
                          widthFactor: 1,
                          child: GestureDetector(
                              onTap: () {print("tapped");},
                              child: Container(color: Colors.orangeAccent)
                          )
                      ),
                    ),
                    const SizedBox(width: 10)
                  ],
                ),
              ),
              //const SizedBox(height: 200),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 69),
                    Expanded(
                      child: FractionallySizedBox(
                          heightFactor: 0.95,
                          widthFactor: 8,
                          child: GestureDetector(
                              onTap: () {print("tapped");},
                              child: Container(color: Colors.orangeAccent)
                          )
                      ),
                    ),
                    const SizedBox(width: 550),
                    Expanded(
                      child: FractionallySizedBox(
                          heightFactor: 0.9,
                          widthFactor: 4.5,
                          child: GestureDetector(
                              onTap: () {print("tapped");},
                              child: Container(color: Colors.orangeAccent)
                          )
                      ),
                    ),
                    const SizedBox(width: 80),
                    Expanded(
                      child: FractionallySizedBox(
                          heightFactor: 0.9,
                          widthFactor: 4,
                          child: GestureDetector(
                              onTap: () {print("tapped");},
                              child: Container(color: Colors.orangeAccent)
                          )
                      ),
                    ),
                    const SizedBox(width: 55)
                  ]
                ),
              )
            ],
          ),
        )
      )
    ); 
  }
}

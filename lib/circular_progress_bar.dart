import 'dart:async';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CircularProgressBar extends StatefulWidget {
  const CircularProgressBar({Key? key}) : super(key: key);

  @override
  State<CircularProgressBar> createState() => _CircularProgressBarState();
}

class _CircularProgressBarState extends State<CircularProgressBar> {

  double _value = 50;

  @override
  void initState() {
    _progressBoost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _getDeterminateProgressBar(),
      ),
    );
  }

  Widget _getDeterminateProgressBar() {
    return SizedBox(
      height: 150,
      width: 150,
      child: SfRadialGauge(axes: <RadialAxis>[
        RadialAxis(
          startAngle: 270,
          endAngle: 270,
          showLabels: false,
          showTicks: false,
          radiusFactor:  0.75,
          axisLineStyle: const AxisLineStyle(
            thickness: 0.05,
            color: Color.fromARGB(30, 0, 169, 181),
            thicknessUnit: GaugeSizeUnit.factor,
          ),
          pointers: <GaugePointer>[
            RangePointer(
                value: _value,
                width: 0.05,
                sizeUnit: GaugeSizeUnit.factor,
                enableAnimation: true,
                animationDuration: 20,
                animationType: AnimationType.linear)
          ],
        )
      ]),
    );
  }

  void _progressBoost() {
    Timer.periodic(const Duration(milliseconds: 10), (Timer t) {
      if(_value <= 100) {
        _value++;
      } else {
        _value = 0;
      }
      setState(() {

      });
    });
  }


}

import 'package:battery/battery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    home: Main(),
  ));
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  Battery battery = Battery();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: () => alart(),
          child: Row(
            children: <Widget>[
              Icon(Icons.battery_full),
              Text('Check'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => batteryLavel(),
        elevation: 3,
      ),
    );
  }

  Future<int> batteryLavel() async {
    int batteryLavel = await battery.batteryLevel;
    print('Battery Lavel: $batteryLavel');
    return batteryLavel;
  }

  Future<void> alart() async {
    int batteryLavel = await battery.batteryLevel;
    if (batteryLavel <= 20) {
      print('Battery lavel is Critically Low!');
      SystemSound.play(SystemSoundType.click);
    }
    if (batteryLavel >= 95) {
      print('Please stop charging');
      SystemSound.play(SystemSoundType.click);
    }
  }
}

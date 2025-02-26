import 'package:flutter/material.dart';

void main() {
  runApp(const TemperatureConverterMain());
}

class TemperatureConverterMain extends StatelessWidget {
  const TemperatureConverterMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TemperatureConverter(),
    );
  }
}

class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({super.key});

  @override
  State<TemperatureConverter> createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  int groupValue = 0;
  double T = 0;
  double R = 0;
  String converted = "";

  void performConversion(int value) {
    setState(() {
      groupValue = value;
      if (value == 1) {
        R = (T - 32.0) * (5 / 9);
        converted = "$R C";
      } else if (value == 2) {
        R = (T * 1.8) + 32;
        converted = "$R F";
      }
    });
  }

  void clearValues() {
    setState(() {
      T = 0;
      R = 0;
      groupValue = 0;
      converted = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Temperature Converter"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter value',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (String value) {
                if (value.isNotEmpty) {
                  T = double.parse(value);
                }
              },
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Radio(
                  activeColor: Colors.red,
                  value: 1,
                  groupValue: groupValue,
                  onChanged: (e) => performConversion(e!),
                ),
                const Text("Fahrenheit To Celsius"),
                const SizedBox(width: 5.0),
                Radio(
                  activeColor: Colors.red,
                  value: 2,
                  groupValue: groupValue,
                  onChanged: (e) => performConversion(e!),
                ),
                const Text("Celsius To Fahrenheit"),
              ],
            ),
            const SizedBox(height: 10.0),
            Center(  
              child: TextButton(
                child: const Text('Clear'),
                onPressed: clearValues,
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: Text(
              converted,
              style: const TextStyle(fontSize: 20),
              )
            ),
          ],
        ),
      ),
    );
  }
}
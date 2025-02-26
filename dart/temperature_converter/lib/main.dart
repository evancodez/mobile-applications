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

  // Conversion method
  void performConversion(int value) {
    setState(() {
      groupValue = value;
      if (value == 1) {
        // Farenheit to Celsius
        R = (T - 32.0) * (5 / 9);
        converted = "${R.toStringAsFixed(2)} C";
      } else if (value == 2) {
        // Celsius to Farenheit
        R = (T * 9 / 5) + 32;
        converted = "${R.toStringAsFixed(2)} F";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Temperature Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          children: [
            const SizedBox(height: 10.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter Temperature',
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
                  activeColor: Colors.orange,
                  value: 1,
                  groupValue: groupValue,
                  onChanged: (e) => performConversion(e!),
                ),
                const Text("F to C"),
                const SizedBox(width: 5.0),
                Radio(
                  activeColor: Colors.orange,
                  value: 2,
                  groupValue: groupValue,
                  onChanged: (e) => performConversion(e!),
                ),
                const Text("C to F"),
              ],
            ),
            const SizedBox(height: 10.0),
            TextButton(
              child: const Text('Clear'),
              onPressed: () {
                setState(() {
                  T = 0;
                  R = 0;
                  groupValue = 0;
                  converted = "";
                });
              },
            ),
            const SizedBox(height: 20.0),
            Text(
              converted,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
//shortcuts: stless or stful

import 'package:flutter/material.dart';

class DestinationWidget extends StatelessWidget {
  final String destinationName;

  const DestinationWidget({required this.destinationName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        destinationName,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
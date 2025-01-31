//shortcuts: stless or stful

import 'package:flutter/material.dart';

class DestinationWidget extends StatelessWidget {
  final String destinationName;

  const DestinationWidget({required this.destinationName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image(image: NetworkImage(("https://picsum.photos/100/100"),)),
      Text(destinationName)
    ]);
    }
  }

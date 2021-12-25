import 'package:flutter/material.dart';

class NoBill extends StatefulWidget {
  const NoBill({Key? key}) : super(key: key);

  @override
  _NoBillState createState() => _NoBillState();
}

class _NoBillState extends State<NoBill> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('No bill found !'),
        ),
      ),
    );
  }
}
